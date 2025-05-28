<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Billet" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Paiement Reçu</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Paiement Confirmé</h1>
    <p class="text-center">Nous avons bien reçu votre paiement. Merci pour votre confiance.</p>
    <h3 class="mt-4">Détails du billet</h3>
    <%
        Billet billet = (Billet) request.getAttribute("billet");
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");
    %>
    <ul class="list-group mb-4">
        <li class="list-group-item"><strong>ID :</strong> <%= billet != null ? billet.getId() : "<span>Non disponible</span>" %></li>
        <li class="list-group-item"><strong>Utilisateur :</strong> <%= (billet != null && billet.getUser() != null) ? billet.getUser().getEmail() : "<span>Utilisateur inconnu</span>" %></li>
        <li class="list-group-item"><strong>Date d'achat :</strong> <%= (billet != null && billet.getDateAchat() != null) ? billet.getDateAchat().format(dateFormatter) : "<span>Non spécifiée</span>" %></li>
        <li class="list-group-item">
            <strong>Trajet Aller :</strong>
            <ul class="list-group list-group-flush">
                <li class="list-group-item">De : <%= (billet != null && billet.getTrajetAller() != null) ? billet.getTrajetAller().getVilleDepart() : "<span>Non spécifié</span>" %></li>
                <li class="list-group-item">Heure départ : <%= (billet != null && billet.getTrajetAller() != null && billet.getTrajetAller().getHeureDepart() != null) ? billet.getTrajetAller().getHeureDepart().format(timeFormatter) : "<span>Non spécifiée</span>" %></li>
                <li class="list-group-item">Vers : <%= (billet != null && billet.getTrajetAller() != null) ? billet.getTrajetAller().getVilleArrivee() : "<span>Non spécifié</span>" %></li>
                <li class="list-group-item">Heure arrivée : <%= (billet != null && billet.getTrajetAller() != null && billet.getTrajetAller().getHeureArrivee() != null) ? billet.getTrajetAller().getHeureArrivee().format(timeFormatter) : "<span>Non spécifiée</span>" %></li>
                <li class="list-group-item">Date : <%= (billet != null && billet.getTrajetAller() != null && billet.getTrajetAller().getDate() != null) ? billet.getTrajetAller().getDate().format(dateFormatter) : "<span>Non spécifiée</span>" %></li>
                <li class="list-group-item">Prix : <%= (billet != null && billet.getTrajetAller() != null) ? String.format("%.2f TND", billet.getTrajetAller().getPrix()) : "<span>Non spécifié</span>" %></li>
                <li class="list-group-item">Classe : <%= billet != null && billet.getTrajetAllerClasse() != null ? billet.getTrajetAllerClasse() : "<span>Non spécifiée</span>" %></li>
                <li class="list-group-item">Fenêtre : <%= billet != null && billet.isTrajetAllerPlaceCoteFenetre() ? "Oui" : "Non" %></li>
                <li class="list-group-item">Espace famille : <%= billet != null && billet.isTrajetAllerEspaceFamille() ? "Oui" : "Non" %></li>
                <li class="list-group-item">Non-fumeur : <%= billet != null && billet.isTrajetAllerWagonNonFumeur() ? "Oui" : "Non" %></li>
            </ul>
        </li>
        <c:if test="${billet != null && billet.trajetRetour != null}">
            <li class="list-group-item">
                <strong>Trajet Retour :</strong>
                <ul class="list-group list-group-flush">
                    <li class="list-group-item">De : <c:out value="${billet.trajetRetour.villeDepart}" default="Non spécifié"/></li>
                    <li class="list-group-item">Heure départ : <c:out value="${billet.trajetRetour.heureDepart}" default="Non spécifiée"/></li>
                    <li class="list-group-item">Vers : <c:out value="${billet.trajetRetour.villeArrivee}" default="Non spécifié"/></li>
                    <li class="list-group-item">Heure arrivée : <c:out value="${billet.trajetRetour.heureArrivee}" default="Non spécifiée"/></li>
                    <li class="list-group-item">Date : <c:out value="${billet.trajetRetour.date}" default="Non spécifiée"/></li>
                    <li class="list-group-item">Prix : <c:out value="${billet.trajetRetour.prix}" default="Non spécifié"/> TND</li>
                    <li class="list-group-item">Classe : <c:out value="${billet.trajetRetourClasse}" default="Non spécifiée"/></li>
                    <li class="list-group-item">Fenêtre : <c:out value="${billet.trajetRetourPlaceCoteFenetre ? 'Oui' : 'Non'}"/></li>
                    <li class="list-group-item">Espace famille : <c:out value="${billet.trajetRetourEspaceFamille ? 'Oui' : 'Non'}"/></li>
                    <li class="list-group-item">Non-fumeur : <c:out value="${billet.trajetRetourWagonNonFumeur ? 'Oui' : 'Non'}"/></li>
                </ul>
            </li>
        </c:if>
    </ul>
    <div class="d-flex justify-content-center gap-3">
        <a href="telecharger-ticket-pdf?id=<%= billet != null ? billet.getId() : 0 %>" class="btn btn-primary">Télécharger le PDF</a>
        <a href="billets?action=liste_de_mes_billets" class="btn btn-secondary">Voir l'historique</a>
    </div>
</div>
</body>
</html>