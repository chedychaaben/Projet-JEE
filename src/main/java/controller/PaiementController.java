package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import model.Trajet;
import model.Billet;
import model.User;
import dao.TrajetDAO;
import dao.BilletDAO;
import java.time.LocalDate;
import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/paiement")
public class PaiementController extends HttpServlet {

    private TrajetDAO trajetDAO;
    private BilletDAO billetDAO;
    private UserDAO userDAO;

    @Override
    public void init() {
        trajetDAO = new TrajetDAO();
        billetDAO = new BilletDAO();
        userDAO = new UserDAO();
    }

    // Carte + date + CVV valides simulés
    private static final Map<String, String[]> cartesValidess = new HashMap<>();
    static {
        cartesValidess.put("4444455555554444", new String[] {"12/25", "123"});
        cartesValidess.put("5555666677778888", new String[] {"11/26", "456"});
        cartesValidess.put("378282246310005", new String[] {"10/27", "1234"});
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String id1 = req.getParameter("id1");
        String c1 = req.getParameter("c1");
        String pcf1 = req.getParameter("pcf1");
        String ef1 = req.getParameter("ef1");
        String wnf1 = req.getParameter("wnf1");

        String id2 = req.getParameter("id2");
        String c2 = req.getParameter("c2");
        String pcf2 = req.getParameter("pcf2");
        String ef2 = req.getParameter("ef2");
        String wnf2 = req.getParameter("wnf2");

        req.setAttribute("id1", id1);
        req.setAttribute("c1", c1);
        req.setAttribute("pcf1", pcf1);
        req.setAttribute("ef1", ef1);
        req.setAttribute("wnf1", wnf1);

        req.setAttribute("id2", id2);
        req.setAttribute("c2", c2);
        req.setAttribute("pcf2", pcf2);
        req.setAttribute("ef2", ef2);
        req.setAttribute("wnf2", wnf2);

        req.getRequestDispatcher("paiement.jsp").forward(req, res);
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String id1 = req.getParameter("id1");
        String c1 = req.getParameter("c1");
        String pcf1 = req.getParameter("pcf1");
        String ef1 = req.getParameter("ef1");
        String wnf1 = req.getParameter("wnf1");
        String id2 = req.getParameter("id2");
        String c2 = req.getParameter("c2");
        String pcf2 = req.getParameter("pcf2");
        String ef2 = req.getParameter("ef2");
        String wnf2 = req.getParameter("wnf2");

        req.setAttribute("id1", id1);
        req.setAttribute("c1", c1);
        req.setAttribute("pcf1", pcf1);
        req.setAttribute("ef1", ef1);
        req.setAttribute("wnf1", wnf1);
        req.setAttribute("id2", id2);
        req.setAttribute("c2", c2);
        req.setAttribute("pcf2", pcf2);
        req.setAttribute("ef2", ef2);
        req.setAttribute("wnf2", wnf2);

        String numeroCarte = req.getParameter("numeroCarte");
        if (numeroCarte != null) {
            numeroCarte = numeroCarte.replaceAll("\\s", "");
        }
        String dateExpiration = req.getParameter("dateExpiration");
        String cvv = req.getParameter("cvv");

        boolean paiementOK = verifierPaiement(numeroCarte, dateExpiration, cvv);

        if (paiementOK) {
            Trajet trajetAller = null;
            if (id1 != null && !id1.isEmpty()) {
                try {
                    trajetAller = trajetDAO.findById(Integer.parseInt(id1));
                } catch (NumberFormatException e) {
                    req.setAttribute("message", "Identifiant du trajet aller invalide.");
                    req.getRequestDispatcher("paiement.jsp").forward(req, res);
                    return;
                }
            } else {
                req.setAttribute("message", "Identifiant du trajet aller manquant.");
                req.getRequestDispatcher("paiement.jsp").forward(req, res);
                return;
            }

            Trajet trajetRetour = null;
            if (id2 != null && !id2.isEmpty()) {
                try {
                    trajetRetour = trajetDAO.findById(Integer.parseInt(id2));
                } catch (NumberFormatException e) {
                    req.setAttribute("message", "Identifiant du trajet retour invalide.");
                    req.getRequestDispatcher("paiement.jsp").forward(req, res);
                    return;
                }
            }

            User user = (User) req.getSession().getAttribute("user");
            if (user == null) {
                req.setAttribute("message", "Utilisateur non connecté.");
                req.getRequestDispatcher("paiement.jsp").forward(req, res);
                return;
            }
            Billet billet = new Billet();
            billet.setEtat(Billet.Etat.ACHETE);
            billet.setUser(user);
            billet.setDateAchat(LocalDate.now());

            billet.setTrajetAller(trajetAller);
            billet.setTrajetAllerClasse(convertClasse(c1));
            billet.setTrajetAllerPlaceCoteFenetre(Boolean.parseBoolean(pcf1));
            billet.setTrajetAllerEspaceFamille(Boolean.parseBoolean(ef1));
            billet.setTrajetAllerWagonNonFumeur(Boolean.parseBoolean(wnf1));

            if (trajetRetour != null) {
                billet.setTrajetRetour(trajetRetour);
                billet.setTrajetRetourClasse(convertClasse(c2));
                billet.setTrajetRetourPlaceCoteFenetre(Boolean.parseBoolean(pcf2));
                billet.setTrajetRetourEspaceFamille(Boolean.parseBoolean(ef2));
                billet.setTrajetRetourWagonNonFumeur(Boolean.parseBoolean(wnf2));
            }

            boolean success = billetDAO.create(billet);

            if (success) {
                req.setAttribute("billet", billet);
                req.getRequestDispatcher("paiementRecu.jsp").forward(req, res);
                return;
            } else {
                req.setAttribute("message", "Erreur de création du billet.");
                req.getRequestDispatcher("paiement.jsp").forward(req, res);
                return;
            }
        }

// If paiementOK is false or something else failed:
        String query = req.getQueryString();
        req.setAttribute("query", query);
        req.setAttribute("message", "Erreur de Paiement.");
        req.getRequestDispatcher("paiement.jsp" + (query != null ? "?" + query : "")).forward(req, res);

    }

    private boolean verifierPaiement(String numeroCarte, String dateExpiration, String cvv) {
        if (!cartesValidess.containsKey(numeroCarte)) {
            return false;
        }

        String[] details = cartesValidess.get(numeroCarte);
        String dateValide = details[0];
        String cvvValide = details[1];

        if (!dateExpiration.equals(dateValide)) {
            return false;
        }

        if (!cvv.equals(cvvValide)) {
            return false;
        }

        return true;
    }

    private Billet.Classe convertClasse(String value) {
        switch (value.toLowerCase()) {
            case "premier":
                return Billet.Classe.PREMIERE;
            case "deuxieme":
                return Billet.Classe.DEUXIEME;
            case "economique":
                return Billet.Classe.ECONOMIQUE;
            default:
                throw new IllegalArgumentException("Classe invalide : " + value);
        }
    }

}
