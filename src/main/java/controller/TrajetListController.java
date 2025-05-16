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
import java.util.List;

@WebServlet("/trajets")
public class TrajetListController extends HttpServlet {
    private TrajetDAO trajetDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        trajetDAO = new TrajetDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Action "modifier"
        //get id mel param
        // Action "supprimer"
        //get id  mel param
        // No Action (Retourner la liste :) )
        List<Trajet> trajets = trajetDAO.findAll();
        req.setAttribute("trajets", trajets);
        req.getRequestDispatcher("/trajets.jsp").forward(req, resp);
    }
}

