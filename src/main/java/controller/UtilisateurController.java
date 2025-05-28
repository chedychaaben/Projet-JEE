package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/utilisateurs")
public class UtilisateurController extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("cree_un_compte".equals(action)) {
            handleSignup(request, response);
        } else if ("se_connecter".equals(action)) {
            handleLogin(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("se_deconnecter".equals(action)) {
            request.getSession().invalidate();
            response.sendRedirect("se_connecter.jsp");
            return;
        }

        if ("bloquer_un_utilisateur".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                userDAO.bloquerUtilisateur(id);
            }
            response.sendRedirect("utilisateurs?action=lister_tous_les_utilisateurs");
            return;
        }

        if ("debloquer_un_utilisateur".equals(action)) {
            String idStr = request.getParameter("id");
            if (idStr != null) {
                int id = Integer.parseInt(idStr);
                userDAO.debloquerUtilisateur(id);
            }
            response.sendRedirect("utilisateurs?action=lister_tous_les_utilisateurs");
            return;
        }

        if ("lister_tous_les_utilisateurs".equals(action)) {
            List<User> utilisateurs = userDAO.findAll();
            request.setAttribute("utilisateurs", utilisateurs);
            request.getRequestDispatcher("/admin_liste_des_utilisateurs.jsp").forward(request, response);
            return;
        }
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String motdepasse = request.getParameter("motdepasse");
        String estAdmin = request.getParameter("estAdmin");

        boolean isAdmin = estAdmin != null;

        User existingUser = userDAO.findAll().stream()
                .filter(u -> u.getEmail().equalsIgnoreCase(email))
                .findFirst()
                .orElse(null);

        if (existingUser != null) {
            request.setAttribute("error", "Email déjà utilisé.");
            request.getRequestDispatcher("cree_un_compte.jsp").forward(request, response);
            return;
        }

        User user = new User(nom, prenom, email, motdepasse);
        user.setEstAdmin(isAdmin);

        userDAO.create(user);
        response.sendRedirect("se_connecter.jsp");
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String motdepasse = request.getParameter("motdepasse");

        User found = userDAO.findAll().stream()
                .filter(u -> u.getEmail().equalsIgnoreCase(email)
                        && u.getMotdepasse().equals(motdepasse))
                .findFirst()
                .orElse(null);

        if (found != null) {
            if (found.isEstBanned()) {
                request.setAttribute("error", "Votre compte est bloqué. Veuillez contacter l'administrateur.");
                request.getRequestDispatcher("se_connecter.jsp").forward(request, response);
                return;
            }

            HttpSession session = request.getSession();
            session.setAttribute("user", found);
            if (found.isEstAdmin()) {
                response.sendRedirect("admin.jsp");
            } else {
                response.sendRedirect("pageacceuil.jsp");
            }
        } else {
            request.setAttribute("error", "Identifiants invalides.");
            request.getRequestDispatcher("se_connecter.jsp").forward(request, response);
        }
    }
}
