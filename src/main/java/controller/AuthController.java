package controller;

import dao.UserDAO;
import model.User;
import model.User.Role;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/login", "/signup", "/logout"})
public class AuthController extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        userDAO = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String path = request.getServletPath();

        if ("/signup".equals(path)) {
            handleSignup(request, response);
        } else if ("/login".equals(path)) {
            handleLogin(request, response);
        }
    }

    private void handleSignup(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String email = request.getParameter("email");
        String motdepasse = request.getParameter("motdepasse");
        String roleParam = request.getParameter("role");

        Role role = Role.valueOf(roleParam); // Assumes input is valid (USER/ADMIN)

        User existingUser = userDAO.findAll().stream()
                .filter(u -> u.getEmail().equals(email))
                .findFirst()
                .orElse(null);

        if (existingUser != null) {
            request.setAttribute("error", "Email already registered.");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
            return;
        }

        User user = new User(nom, prenom, email, motdepasse, role);
        userDAO.create(user);

        response.sendRedirect("login.jsp");
    }

    private void handleLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String motdepasse = request.getParameter("motdepasse");

        List<User> users = userDAO.findAll();
        User found = users.stream()
                .filter(u -> u.getEmail().equals(email) && u.getMotdepasse().equals(motdepasse))
                .findFirst()
                .orElse(null);

        if (found != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user", found);
            response.sendRedirect("dashboard.jsp"); // Replace with your dashboard
        } else {
            request.setAttribute("error", "Invalid credentials.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if ("/logout".equals(request.getServletPath())) {
            request.getSession().invalidate();
            response.sendRedirect("login.jsp");
        }
    }
}
