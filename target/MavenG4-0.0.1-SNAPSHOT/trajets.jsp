<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Trajet" %>

<html>
<head>
    <title>Page Admin - Liste des trajets</title>
</head>
<body>
<h1>Liste des trajets</h1>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Ville Départ</th>
        <th>Heure Départ</th>
        <th>Ville Arrivée</th>
        <th>Heure Arrivée</th>
        <th>Date</th>
        <th>Prix</th>
        <th>Places Disponibles</th>
        <th>Classe de Voyage</th>
        <th>Place Côté Fenêtre</th>
        <th>Espace Famille</th>
        <th>Wagon Non Fumeur</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Trajet> trajets = (List<Trajet>) request.getAttribute("trajets");
        if (trajets != null) {
            for (Trajet trajet : trajets) {
    %>
    <tr>
        <td><%= trajet.getId() %></td>
        <td><%= trajet.getVilleDepart() %></td>
        <td><%= trajet.getHeureDepart() %></td>
        <td><%= trajet.getVilleArrivee() %></td>
        <td><%= trajet.getHeureArrivee() %></td>
        <td><%= trajet.getDate() %></td>
        <td><%= trajet.getPrix() %></td>
        <td><%= trajet.getPlacesDisponibles() %></td>
        <td><%= trajet.getClasseDeVoyage() %></td>
        <td><%= trajet.isPlaceCoteFenetre() ? "Oui" : "Non" %></td>
        <td><%= trajet.isEspaceFamille() ? "Oui" : "Non" %></td>
        <td><%= trajet.isWagonNonFumeur() ? "Oui" : "Non" %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="12">Aucun trajet disponible</td></tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>