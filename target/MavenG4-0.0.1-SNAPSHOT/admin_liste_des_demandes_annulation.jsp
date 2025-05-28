<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Demandes d'Annulation</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Demandes d'Annulation</h1>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Utilisateur</th>
                <th>Date Achat</th>
                <th>Date Annulation</th>
                <th>État</th>
                <th>Départ Aller</th>
                <th>Heure Départ</th>
                <th>Arrivée Aller</th>
                <th>Heure Arrivée</th>
                <th>Date Aller</th>
                <th>Prix Aller</th>
                <th>Places Dispo</th>
                <th>Classe Aller</th>
                <th>Fenêtre</th>
                <th>Espace Famille</th>
                <th>Non-Fumeur</th>
                <th>Départ Retour</th>
                <th>Heure Départ</th>
                <th>Arrivée Retour</th>
                <th>Heure Arrivée</th>
                <th>Date Retour</th>
                <th>Prix Retour</th>
                <th>Places Dispo</th>
                <th>Classe Retour</th>
                <th>Fenêtre</th>
                <th>Espace Famille</th>
                <th>Non-Fumeur</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="b" items="${billets}">
                <tr>
                    <td>${b.id}</td>
                    <td>${b.user.nom}</td>
                    <td>${b.dateAchat}</td>
                    <td>${b.dateAnnulation}</td>
                    <td>${b.etat}</td>
                    <td>${b.trajetAller.villeDepart}</td>
                    <td>${b.trajetAller.heureDepart}</td>
                    <td>${b.trajetAller.villeArrivee}</td>
                    <td>${b.trajetAller.heureArrivee}</td>
                    <td>${b.trajetAller.date}</td>
                    <td>${b.trajetAller.prix}</td>
                    <td>${b.trajetAller.placesDisponibles}</td>
                    <td>${b.trajetAllerClasse}</td>
                    <td><c:choose>
                        <c:when test="${b.trajetAllerPlaceCoteFenetre}">Oui</c:when>
                        <c:otherwise>Non</c:otherwise>
                    </c:choose></td>
                    <td><c:choose>
                        <c:when test="${b.trajetAllerEspaceFamille}">Oui</c:when>
                        <c:otherwise>Non</c:otherwise>
                    </c:choose></td>
                    <td><c:choose>
                        <c:when test="${b.trajetAllerWagonNonFumeur}">Oui</c:when>
                        <c:otherwise>Non</c:otherwise>
                    </c:choose></td>
                    <td>${b.trajetRetour.villeDepart}</td>
                    <td>${b.trajetRetour.heureDepart}</td>
                    <td>${b.trajetRetour.villeArrivee}</td>
                    <td>${b.trajetRetour.heureArrivee}</td>
                    <td>${b.trajetRetour.date}</td>
                    <td>${b.trajetRetour.prix}</td>
                    <td>${b.trajetRetour.placesDisponibles}</td>
                    <td>${b.trajetRetourClasse}</td>
                    <td><c:choose>
                        <c:when test="${b.trajetRetourPlaceCoteFenetre}">Oui</c:when>
                        <c:otherwise>Non</c:otherwise>
                    </c:choose></td>
                    <td><c:choose>
                        <c:when test="${b.trajetRetourEspaceFamille}">Oui</c:when>
                        <c:otherwise>Non</c:otherwise>
                    </c:choose></td>
                    <td><c:choose>
                        <c:when test="${b.trajetRetourWagonNonFumeur}">Oui</c:when>
                        <c:otherwise>Non</c:otherwise>
                    </c:choose></td>
                    <td>
                        <a href="billets?action=accepter&id=${b.id}" class="btn btn-success btn-sm">Accepter</a>
                        <a href="billets?action=refuser&id=${b.id}" class="btn btn-danger btn-sm">Refuser</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>