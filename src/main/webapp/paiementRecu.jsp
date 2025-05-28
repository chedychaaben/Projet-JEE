<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Billet" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Billet billet = (Billet) request.getAttribute("billet");

    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8" />
    <title>Paiement Reçu - Détails du Billet</title>
</head>
<body>

<div>
    <h2>Paiement Confirmé</h2>
    <p>Nous avons bien reçu votre paiement. Merci pour votre confiance.</p>

    <h3>Détails du billet</h3>
    <ul>
        <li><strong>ID :</strong> <%= billet != null ? billet.getId() : "<span>Non disponible</span>" %></li>
        <li><strong>Utilisateur :</strong>
            <%= (billet != null && billet.getUser() != null) ? billet.getUser().getEmail() : "<span>Utilisateur inconnu</span>" %>
        </li>
        <li><strong>Date d'achat :</strong>
            <%= (billet != null && billet.getDateAchat() != null) ? billet.getDateAchat().format(dateFormatter) : "<span>Non spécifiée</span>" %>
        </li>

        <!-- Trajet Aller details -->
        <li><strong>Trajet Aller :</strong></li>
        <ul>
            <li>
                <strong>De :</strong>
                <%= (billet != null && billet.getTrajetAller() != null) ? billet.getTrajetAller().getVilleDepart() : "<span>Non spécifié</span>" %>
            </li>
            <li>
                <strong>Heure départ :</strong>
                <%= (billet != null && billet.getTrajetAller() != null && billet.getTrajetAller().getHeureDepart() != null) ? billet.getTrajetAller().getHeureDepart().format(timeFormatter) : "<span>Non spécifiée</span>" %>
            </li>
            <li>
                <strong>Vers :</strong>
                <%= (billet != null && billet.getTrajetAller() != null) ? billet.getTrajetAller().getVilleArrivee() : "<span>Non spécifié</span>" %>
            </li>
            <li>
                <strong>Heure arrivée :</strong>
                <%= (billet != null && billet.getTrajetAller() != null && billet.getTrajetAller().getHeureArrivee() != null) ? billet.getTrajetAller().getHeureArrivee().format(timeFormatter) : "<span>Non spécifiée</span>" %>
            </li>
            <li>
                <strong>Date :</strong>
                <%= (billet != null && billet.getTrajetAller() != null && billet.getTrajetAller().getDate() != null) ? billet.getTrajetAller().getDate().format(dateFormatter) : "<span>Non spécifiée</span>" %>
            </li>
            <li>
                <strong>Prix :</strong>
                <%= (billet != null && billet.getTrajetAller() != null) ? String.format("%.2f TND", billet.getTrajetAller().getPrix()) : "<span>Non spécifié</span>" %>
            </li>
            <li><strong>Classe :</strong> <%= billet != null && billet.getTrajetAllerClasse() != null ? billet.getTrajetAllerClasse() : "<span>Non spécifiée</span>" %></li>
            <li><strong>Fenêtre :</strong> <%= billet != null && billet.isTrajetAllerPlaceCoteFenetre() ? "Oui" : "Non" %></li>
            <li><strong>Espace famille :</strong> <%= billet != null && billet.isTrajetAllerEspaceFamille() ? "Oui" : "Non" %></li>
            <li><strong>Non-fumeur :</strong> <%= billet != null && billet.isTrajetAllerWagonNonFumeur() ? "Oui" : "Non" %></li>
        </ul>

        <!-- Trajet Retour details -->
        <c:if test="${billet != null && billet.trajetRetour != null}">
            <li><strong>Trajet Retour :</strong></li>
            <ul>
                <li>
                    <strong>De :</strong> <c:out value="${billet.trajetRetour.villeDepart}" default="Non spécifié"/>
                </li>
                <li>
                    <strong>Heure départ :</strong> <c:out value="${billet.trajetRetour.heureDepart}" default="Non spécifiée"/>
                </li>
                <li>
                    <strong>Vers :</strong> <c:out value="${billet.trajetRetour.villeArrivee}" default="Non spécifié"/>
                </li>
                <li>
                    <strong>Heure arrivée :</strong> <c:out value="${billet.trajetRetour.heureArrivee}" default="Non spécifiée"/>
                </li>
                <li>
                    <strong>Date :</strong> <c:out value="${billet.trajetRetour.date}" default="Non spécifiée"/>
                </li>
                <li>
                    <strong>Prix :</strong> <c:out value="${billet.trajetRetour.prix}" default="Non spécifié"/> TND
                </li>
                <li><strong>Classe :</strong> <c:out value="${billet.trajetRetourClasse}" default="Non spécifiée"/></li>
                <li><strong>Fenêtre :</strong> <c:out value="${billet.trajetRetourPlaceCoteFenetre ? 'Oui' : 'Non'}"/></li>
                <li><strong>Espace famille :</strong> <c:out value="${billet.trajetRetourEspaceFamille ? 'Oui' : 'Non'}"/></li>
                <li><strong>Non-fumeur :</strong> <c:out value="${billet.trajetRetourWagonNonFumeur ? 'Oui' : 'Non'}"/></li>
            </ul>
        </c:if>
    </ul>

    <div>
        <a href="telecharger-ticket-pdf?id=<%= billet != null ? billet.getId() : 0 %>">Télécharger le PDF</a>
        <a href="billets?action=liste_de_mes_billets">Voir l'historique</a>
    </div>
</div>

</body>
</html>
