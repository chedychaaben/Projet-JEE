package controller;

import dao.TrajetDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reservation")
public class ReservationController extends HttpServlet {

    private TrajetDAO trajetDAO;

    @Override
    public void init() {
        trajetDAO = new TrajetDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int trajetId = Integer.parseInt(request.getParameter("id"));
        var trajet = trajetDAO.findById(trajetId);
        request.setAttribute("trajet", trajet);
        request.getRequestDispatcher("/reservation.jsp").forward(request, response);
    }
}