<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Trajet" %>

<html>
<head>
    <title>Page Admin - Liste des trajets</title>
</head>
<body>

Message :)
<%
    String message = (String) session.getAttribute("message");
    if (message != null) {
%>
<div class="alert alert-success"><%= message %></div>
<%
        session.removeAttribute("message"); // Important to remove after displaying
    }
%>

<h1>Liste des trajets</h1>

<a href="${pageContext.request.contextPath}/admin/creer_trajet_form.jsp">Creer un nouveau trajet</a>


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
        <th>Actions</th>
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
        <td>
            <a href='trajets?action=modifier_un_trajet&id=<%=trajet.getId()%>'>Modifier</a>
            <a href='trajets?action=supprimer_un_trajet&id=<%=trajet.getId()%>'>Supprimer (soft lezem)</a>
        </td>
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