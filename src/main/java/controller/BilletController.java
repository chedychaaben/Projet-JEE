package controller;

import dao.BilletDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import model.Billet;
import model.User;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@WebServlet("/billets")
public class BilletController extends HttpServlet {

    private final BilletDAO billetDAO = new BilletDAO();


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        User user = (User) req.getSession().getAttribute("user");

        if (action == null) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action manquante.");
            return;
        }

        switch (action) {

            //  User
            case "annuler": {
                int id = Integer.parseInt(req.getParameter("id"));
                billetDAO.passerDeAcheteAEncoursAnnulation(id);

                resp.sendRedirect("billets?action=liste_de_mes_billets");
                return;
            }

            case "liste_de_mes_billets": {
                if (user == null) {
                    resp.sendRedirect("se_connecter.jsp");
                    return;
                }

                List<Billet> billets = billetDAO.findByUserId(user.getId());
                req.setAttribute("billets", billets);
                req.getRequestDispatcher("/liste_de_mes_billets.jsp").forward(req, resp);
                return;
            }

            // Admin
            case "lister_tous_les_demandes_annulation": {
                if (user == null || !user.isEstAdmin()) {
                    resp.sendError(HttpServletResponse.SC_FORBIDDEN, "Accès réservé aux administrateurs.");
                    return;
                }

                List<Billet> billets = billetDAO.findByEtat(Billet.Etat.ENCOURSDANNULATION);
                req.setAttribute("billets", billets);
                req.getRequestDispatcher("admin_liste_des_demandes_annulation.jsp").forward(req, resp);
                return;
            }

            case "accepter": {
                int id = Integer.parseInt(req.getParameter("id"));
                billetDAO.passerDeEncoursAnnulationAAnnule(id);

                resp.sendRedirect("billets?action=lister_tous_les_demandes_annulation");
                return;
            }

            case "refuser": {
                int id = Integer.parseInt(req.getParameter("id"));
                billetDAO.passerDeEncoursAnnulationAAchete(id);

                resp.sendRedirect("billets?action=lister_tous_les_demandes_annulation");
                return;
            }

            default:
                resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Action inconnue : " + action);
        }
    }



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
