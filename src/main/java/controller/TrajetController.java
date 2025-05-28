package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;
import model.Trajet;
import dao.TrajetDAO;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

@WebServlet("/trajets")
public class TrajetController extends HttpServlet {
    private TrajetDAO trajetDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        trajetDAO = new TrajetDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action == null) {
            req.setAttribute("error", "Aucune action fournie.");
            req.getRequestDispatcher("pageacceuil.jsp").forward(req, resp);
            return;
        }

        String id = req.getParameter("id");

        if ((action.equals("modifier_un_trajet") || action.equals("supprimer_un_trajet"))) {
            if (id == null || id.isEmpty()) {
                req.setAttribute("error", "ID manquant.");
                req.getRequestDispatcher("pageacceuil.jsp").forward(req, resp);
                return;
            }

            int trajetId;
            try {
                trajetId = Integer.parseInt(id);
            } catch (NumberFormatException e) {
                req.setAttribute("error", "ID invalide.");
                req.getRequestDispatcher("pageacceuil.jsp").forward(req, resp);
                return;
            }

            Trajet trajet = trajetDAO.findById(trajetId);
            if (trajet == null) {
                req.setAttribute("error", "Trajet introuvable avec l'ID : " + id);
                req.getRequestDispatcher("pageacceuil.jsp").forward(req, resp);
                return;
            }

            if (action.equals("modifier_un_trajet")) {
                req.setAttribute("trajet", trajet);
                req.getRequestDispatcher("/admin_modifier_trajet_form.jsp").forward(req, resp);
                return;
            }

            if (action.equals("supprimer_un_trajet")) {
                trajetDAO.delete(trajetId);
                req.setAttribute("message", "Trajet modifié avec succès !");
                resp.sendRedirect("TrajetServlet?action=lister_tous_les_trajets");
                return;
            }
        }

        if (action.equals("lister_tous_les_trajets")) {
            List<Trajet> trajets = trajetDAO.findAll();
            req.setAttribute("trajets", trajets);
            req.getRequestDispatcher("/admin_liste_des_trajets.jsp").forward(req, resp);
            return;
        }

        // Default case if action is unknown
        req.setAttribute("error", "Action inconnue.");
        req.getRequestDispatcher("pageacceuil.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8"); // Pour éviter les problèmes d'encodage

        String action = req.getParameter("action");

        if ("creer_un_trajet".equals(action)) {
            try {
                // Récupération des données depuis le formulaire
                String villeDepart = req.getParameter("villeDepart");
                String heureDepartStr = req.getParameter("heureDepart");
                String villeArrivee = req.getParameter("villeArrivee");
                String heureArriveeStr = req.getParameter("heureArrivee");
                String dateStr = req.getParameter("date");
                String prixStr = req.getParameter("prix");
                String placesStr = req.getParameter("placesDisponibles");

                // Vérification de la validité des données
                if (villeDepart == null || villeArrivee == null || heureDepartStr == null || heureArriveeStr == null
                        || dateStr == null || prixStr == null || placesStr == null) {
                    throw new IllegalArgumentException("Tous les champs sont obligatoires.");
                }

                // Parsing des données
                LocalTime heureDepart = LocalTime.parse(heureDepartStr);
                LocalTime heureArrivee = LocalTime.parse(heureArriveeStr);
                LocalDate date = LocalDate.parse(dateStr);
                double prix = Double.parseDouble(prixStr);
                int placesDisponibles = Integer.parseInt(placesStr);

                // Création du trajet
                Trajet trajet = new Trajet(villeDepart, heureDepart, villeArrivee, heureArrivee, date, prix, placesDisponibles);

                // Persistance
                boolean success = trajetDAO.create(trajet);

                if (success) {
                    resp.sendRedirect(req.getContextPath() + "/trajets?action=lister_tous_les_trajets");
                } else {
                    req.setAttribute("error", "Erreur lors de la création du trajet.");
                    req.getRequestDispatcher("/admin_creer_trajet_form.jsp").forward(req, resp);
                }

            } catch (Exception e) {
                req.setAttribute("error", "Erreur: " + e.getMessage());
                req.getRequestDispatcher("/admin_creer_trajet_form.jsp").forward(req, resp);
            }
        } else if ("modifier_un_trajet".equals(action)) {
            try {
                // Récupération des données depuis le formulaire
                String idStr = req.getParameter("id");
                String villeDepart = req.getParameter("villeDepart");
                String heureDepartStr = req.getParameter("heureDepart");
                String villeArrivee = req.getParameter("villeArrivee");
                String heureArriveeStr = req.getParameter("heureArrivee");
                String dateStr = req.getParameter("date");
                String prixStr = req.getParameter("prix");
                String placesStr = req.getParameter("placesDisponibles");

                // Vérification de la validité des données
                if (idStr == null || villeDepart == null || villeArrivee == null || heureDepartStr == null
                        || heureArriveeStr == null || dateStr == null || prixStr == null || placesStr == null) {
                    throw new IllegalArgumentException("Tous les champs sont obligatoires.");
                }

                // Parsing des données
                int id = Integer.parseInt(idStr);
                LocalTime heureDepart = LocalTime.parse(heureDepartStr);
                LocalTime heureArrivee = LocalTime.parse(heureArriveeStr);
                LocalDate date = LocalDate.parse(dateStr);
                double prix = Double.parseDouble(prixStr);
                int placesDisponibles = Integer.parseInt(placesStr);

                // Création du trajet avec ID
                Trajet trajet = new Trajet(id, villeDepart, heureDepart, villeArrivee, heureArrivee, date, prix, placesDisponibles);

                // Mise à jour
                boolean success = trajetDAO.update(trajet);

                if (success) {
                    resp.sendRedirect(req.getContextPath() + "/trajets?action=lister_tous_les_trajets");
                } else {
                    req.setAttribute("error", "Erreur lors de la modification du trajet.");
                    req.setAttribute("trajet", trajet);
                    req.getRequestDispatcher("/admin_modifier_trajet_form.jsp").forward(req, resp);
                }

            } catch (Exception e) {
                req.setAttribute("error", "Erreur: " + e.getMessage());
                req.getRequestDispatcher("/admin_modifier_trajet_form.jsp").forward(req, resp);
            }
        } else {
            // Action inconnue
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action invalide.");
        }
    }


}

