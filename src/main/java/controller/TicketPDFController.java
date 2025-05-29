package controller;

import dao.BilletDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Billet;

import java.io.IOException;
import java.io.OutputStream;

import com.openhtmltopdf.pdfboxout.PdfRendererBuilder;

@WebServlet("/telecharger-ticket-pdf")
public class TicketPDFController extends HttpServlet {

    private BilletDAO billetDAO;

    @Override
    public void init() {
        billetDAO = new BilletDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing ticket id");
            return;
        }

        int billetId;
        try {
            billetId = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            res.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid ticket id");
            return;
        }

        Billet billet = billetDAO.findById(billetId);
        if (billet == null) {
            res.sendError(HttpServletResponse.SC_NOT_FOUND, "Ticket not found");
            return;
        }

        java.time.format.DateTimeFormatter dateFormatter = java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy");
        java.time.format.DateTimeFormatter timeFormatter = java.time.format.DateTimeFormatter.ofPattern("HH:mm");

        String userEmail = (billet.getUser() != null && billet.getUser().getEmail() != null)
                ? billet.getUser().getEmail()
                : "Inconnu";

        StringBuilder html = new StringBuilder();
        html.append("<html><head><style>")
                .append("body { font-family: Arial, sans-serif; padding: 20px; }")
                .append("h1, h2 { color: #2c3e50; }")
                .append("p { font-size: 14px; margin: 5px 0; }")
                .append("strong { width: 170px; display: inline-block; }")
                .append(".section { margin-bottom: 20px; }")
                .append("</style></head><body>");

        html.append("<h1>Billet n° ").append(billet.getId()).append("</h1>");

        html.append("<div class='section'>")
                .append("<p><strong>État :</strong> ").append(billet.getEtat() != null ? billet.getEtat() : "N/A").append("</p>")
                .append("<p><strong>Utilisateur :</strong> ").append(userEmail).append("</p>")
                .append("<p><strong>Date d'achat :</strong> ").append(
                        billet.getDateAchat() != null ? billet.getDateAchat().format(dateFormatter) : "N/A"
                ).append("</p>")
                .append("</div>");

        java.util.function.Function<model.Trajet, String> trajetToHtml = trajet -> {
            if (trajet == null) return "<p>Non spécifié</p>";

            StringBuilder t = new StringBuilder();
            t.append("<p><strong>Ville départ :</strong> ").append(trajet.getVilleDepart()).append("</p>");
            t.append("<p><strong>Heure départ :</strong> ").append(
                    trajet.getHeureDepart() != null ? trajet.getHeureDepart().format(timeFormatter) : "N/A").append("</p>");
            t.append("<p><strong>Ville arrivée :</strong> ").append(trajet.getVilleArrivee()).append("</p>");
            t.append("<p><strong>Heure arrivée :</strong> ").append(
                    trajet.getHeureArrivee() != null ? trajet.getHeureArrivee().format(timeFormatter) : "N/A").append("</p>");
            t.append("<p><strong>Date :</strong> ").append(
                    trajet.getDate() != null ? trajet.getDate().format(dateFormatter) : "N/A").append("</p>");
            t.append("<p><strong>Prix :</strong> ").append(String.format("%.2f TND", trajet.getPrix())).append("</p>");
            t.append("<p><strong>Places disponibles :</strong> ").append(trajet.getPlacesDisponibles()).append("</p>");
            return t.toString();
        };

        html.append("<div class='section'>");
        html.append("<h2>Trajet Aller</h2>");
        html.append(trajetToHtml.apply(billet.getTrajetAller()));
        html.append("<p><strong>Classe :</strong> ").append(billet.getTrajetAllerClasse() != null ? billet.getTrajetAllerClasse() : "N/A").append("</p>");
        html.append("<p><strong>Place côté fenêtre :</strong> ").append(billet.isTrajetAllerPlaceCoteFenetre() ? "Oui" : "Non").append("</p>");
        html.append("<p><strong>Espace famille :</strong> ").append(billet.isTrajetAllerEspaceFamille() ? "Oui" : "Non").append("</p>");
        html.append("<p><strong>Wagon non fumeur :</strong> ").append(billet.isTrajetAllerWagonNonFumeur() ? "Oui" : "Non").append("</p>");
        html.append("</div>");

        if (billet.getTrajetRetour() != null) {
            html.append("<div class='section'>");
            html.append("<h2>Trajet Retour</h2>");
            html.append(trajetToHtml.apply(billet.getTrajetRetour()));
            html.append("<p><strong>Classe :</strong> ").append(billet.getTrajetRetourClasse() != null ? billet.getTrajetRetourClasse() : "N/A").append("</p>");
            html.append("<p><strong>Place côté fenêtre :</strong> ").append(billet.isTrajetRetourPlaceCoteFenetre() ? "Oui" : "Non").append("</p>");
            html.append("<p><strong>Espace famille :</strong> ").append(billet.isTrajetRetourEspaceFamille() ? "Oui" : "Non").append("</p>");
            html.append("<p><strong>Wagon non fumeur :</strong> ").append(billet.isTrajetRetourWagonNonFumeur() ? "Oui" : "Non").append("</p>");
            html.append("</div>");
        }

        html.append("</body></html>");

        res.setContentType("application/pdf");
        res.setHeader("Content-Disposition", "attachment; filename=billet_" + billetId + ".pdf");

        try (OutputStream os = res.getOutputStream()) {
            PdfRendererBuilder builder = new PdfRendererBuilder();
            builder.withHtmlContent(html.toString(), null);
            builder.toStream(os);
            builder.run();
        } catch (Exception e) {
            throw new ServletException("Error generating PDF", e);
        }
    }


}
