package controller;

import dao.TrajetDAO;
import model.Trajet;
import model.Trajet.ClasseDeVoyage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/trajet/create")
public class TrajetCreateController extends HttpServlet {

    private TrajetDAO trajetDAO;

    @Override
    public void init() {
        trajetDAO = new TrajetDAO(); // Utilise HibernateUtil derrière
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Afficher le formulaire JSP pour créer un trajet
        req.getRequestDispatcher("/trajetCreateForm.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Récupérer les données depuis le formulaire
            String villeDepart = req.getParameter("villeDepart");
            LocalTime heureDepart = LocalTime.parse(req.getParameter("heureDepart"));
            String villeArrivee = req.getParameter("villeArrivee");
            LocalTime heureArrivee = LocalTime.parse(req.getParameter("heureArrivee"));
            LocalDate date = LocalDate.parse(req.getParameter("date"));
            double prix = Double.parseDouble(req.getParameter("prix"));
            int placesDisponibles = Integer.parseInt(req.getParameter("placesDisponibles"));
            ClasseDeVoyage classeDeVoyage = ClasseDeVoyage.valueOf(req.getParameter("classeDeVoyage"));
            boolean placeCoteFenetre = "on".equals(req.getParameter("placeCoteFenetre"));
            boolean espaceFamille = "on".equals(req.getParameter("espaceFamille"));
            boolean wagonNonFumeur = "on".equals(req.getParameter("wagonNonFumeur"));

            // Création de l'objet Trajet
            Trajet trajet = new Trajet(villeDepart, heureDepart, villeArrivee, heureArrivee,
                    date, prix, placesDisponibles, classeDeVoyage,
                    placeCoteFenetre, espaceFamille, wagonNonFumeur);

            // Persister le trajet
            boolean success = trajetDAO.create(trajet);

            if (success) {
                resp.sendRedirect(req.getContextPath() + "/trajets"); // rediriger vers liste trajets
            } else {
                req.setAttribute("error", "Erreur lors de la création du trajet.");
                req.getRequestDispatcher("/trajetCreateForm.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("error", "Erreur: " + e.getMessage());
            req.getRequestDispatcher("/trajetCreateForm.jsp").forward(req, resp);
        }
    }
}
