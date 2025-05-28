package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/billets")
public class BilletController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        action=lister_tous_les_demandes_annulation?
                for admin list all billets  that have etat == ENCOURSDANNULATION

                action = liste_de_mes_billets    get user id from logged in user (Protect connected only)
                        list this user billets


                lezem fel liste de mes billes yedhehro 4 tableau,
        acheté
            utilisé
                    annulé
                    en cours d'annulation
    

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        action
                annuler mon billet = change etat vers en cours dannulation

                action accepter_annulation user=id
                        action refuser_annulation   user=id
                action utiliste billet=id

    }
}
