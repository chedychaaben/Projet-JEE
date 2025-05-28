<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Historique des Billets</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            padding: 8px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
        }

        h1, h2 {
            text-align: center;
        }
    </style>
</head>
<body>
<h1>demandes dannulation</h1>
<h2>Demandes dannulation</h2>

<table>
    <tr>
        <th>ID</th>
        <th>Utilisateur</th>
        <th>Date Achat</th>
        <th>Date Annulation</th>
        <th>État</th>

        <!-- Infos Trajet Aller -->
        <th>Départ Aller</th>
        <th>Heure Départ Aller</th>
        <th>Arrivée Aller</th>
        <th>Heure Arrivée Aller</th>
        <th>Date Aller</th>
        <th>Prix Aller</th>
        <th>Places Dispo Aller</th>
        <th>Classe Aller</th>
        <th>Fenêtre Aller</th>
        <th>Espace Famille Aller</th>
        <th>Non-Fumeur Aller</th>

        <!-- Infos Trajet Retour -->
        <th>Départ Retour</th>
        <th>Heure Départ Retour</th>
        <th>Arrivée Retour</th>
        <th>Heure Arrivée Retour</th>
        <th>Date Retour</th>
        <th>Prix Retour</th>
        <th>Places Dispo Retour</th>
        <th>Classe Retour</th>
        <th>Fenêtre Retour</th>
        <th>Espace Famille Retour</th>
        <th>Non-Fumeur Retour</th>


        <th>Actions</th>
    </tr>

    <c:forEach var="b" items="${billets}">
        <tr>
            <td>${b.id}</td>
            <td>${b.user.nom}</td>
            <td>${b.dateAchat}</td>
            <td>${b.dateAnnulation}</td>
            <td>${b.etat}</td>

            <!-- Trajet Aller -->
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

            <!-- Trajet Retour -->
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
                <a href="billets?action=accepter&id=${b.id}">
                    Accepter
                </a>
                <a href="billets?action=refuser&id=${b.id}">
                    Refuser
                </a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
