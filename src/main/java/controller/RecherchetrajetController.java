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
        String directionParam = request.getParameter("direction");
        List<Trajet> trajets = null;

        if (Objects.equals(directionParam, "1")) {
            String villeDepart = request.getParameter("ville_depart");
            String villeArrivee = request.getParameter("ville_arrivee");
            String dateParam = request.getParameter("date");
            LocalDate date = null;
            if (dateParam != null && !dateParam.isEmpty()) {
                date = LocalDate.parse(dateParam);
            }
            trajets = trajetDAO.findByVillesAndDate(villeDepart, villeArrivee, date);
        } else if (Objects.equals(directionParam, "2")) {
            String idAllerStr = request.getParameter("id_aller");
            int idAller = Integer.parseInt(idAllerStr);
            Trajet trajet = trajetDAO.findById(idAller);
            trajets = trajetDAO.findByVilleDepart(trajet.getVilleArrivee());
        }
        request.setAttribute("trajets", trajets);
        request.getRequestDispatcher("/reservation.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
