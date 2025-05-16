package controller;

import dao.TrajetDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet("/recherche")
public class RecherchetrajetController extends HttpServlet {

    private TrajetDAO trajetDAO;

    @Override
    public void init() {
        trajetDAO = new TrajetDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/recherche.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String villeDepart = request.getParameter("villeDepart");
        String villeArrivee = request.getParameter("villeArrivee");
        LocalDate date = LocalDate.parse(request.getParameter("date"));

        var trajets = trajetDAO.findByVillesAndDate(villeDepart, villeArrivee, date);
        request.setAttribute("trajets", trajets);
        request.getRequestDispatcher("/resultats.jsp").forward(request, response);
    }
}