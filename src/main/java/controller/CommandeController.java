package controller;

import dao.TrajetDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Trajet;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

@WebServlet("/commande")
public class CommandeController extends HttpServlet {

    private TrajetDAO trajetDAO;

    @Override
    public void init() {
        trajetDAO = new TrajetDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Trajet trajet1 = null;
        Trajet trajet2 = null;
        String nbParam = request.getParameter("nb");

        if ("1".equals(nbParam)) {
            int trajet1Id = Integer.parseInt(request.getParameter("id"));
            trajet1 = trajetDAO.findById(trajet1Id);
        }

        if ("2".equals(nbParam)) {
            int trajet1Id = Integer.parseInt(request.getParameter("id_aller")); // assume different param name for second trajet
            trajet1 = trajetDAO.findById(trajet1Id);
            int trajet2Id = Integer.parseInt(request.getParameter("id_retour"));
            trajet2 = trajetDAO.findById(trajet2Id);
        }

        request.setAttribute("trajet1", trajet1);
        if (trajet2 != null) {
            request.setAttribute("trajet2", trajet2);
        }
        request.getRequestDispatcher("/commande.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


}