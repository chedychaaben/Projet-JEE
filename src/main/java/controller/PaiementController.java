package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/paiement")
public class PaiementController extends HttpServlet {

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

        // If accepté sajel date de paiement w kol wel biellet
        String numeroCarte = req.getParameter("numeroCarte").replaceAll("\\s", "");
        String dateExpiration = req.getParameter("dateExpiration");
        String cvv = req.getParameter("cvv");

        String message = verifierPaiement(numeroCarte, dateExpiration, cvv);

        req.setAttribute("message", message);
        req.getRequestDispatcher("paiement.jsp").forward(req, res);
    }

    private String verifierPaiement(String numeroCarte, String dateExpiration, String cvv) {
        if (!cartesValidess.containsKey(numeroCarte)) {
            return "Paiement refusé : numéro de carte non reconnu.";
        }

        String[] details = cartesValidess.get(numeroCarte);
        String dateValide = details[0];
        String cvvValide = details[1];

        if (!dateExpiration.equals(dateValide)) {
            return "Paiement refusé : date d'expiration incorrecte.";
        }

        if (!cvv.equals(cvvValide)) {
            return "Paiement refusé : CVV incorrect.";
        }

        return "Paiement accepté ! Merci pour votre achat. Aller vers l'historique de vos tickets :)";
    }

}
