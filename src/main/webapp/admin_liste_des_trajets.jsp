<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Trajet" %>
<html>
<head>
    <title>Liste des Trajets</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Liste des Trajets</h1>
    <%
        String message = (String) session.getAttribute("message");
        if (message != null) {
    %>
    <div class="alert alert-success">${message}</div>
    <%
            session.removeAttribute("message");
        }
    %>
    <a href="${pageContext.request.contextPath}/admin_creer_trajet_form.jsp" class="btn btn-dark mb-3">Créer un nouveau trajet</a>
    <div class="table-responsive">
        <table class="table table-hover">
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
                <td><%= trajet.getPrix() %> TND</td>
                <td><%= trajet.getPlacesDisponibles() %></td>
                <td>
                    <a href='trajets?action=modifier_un_trajet&id=<%=trajet.getId()%>' class="btn btn-primary btn-sm">Modifier</a>
                    <a href='trajets?action=supprimer_un_trajet&id=<%=trajet.getId()%>' class="btn btn-danger btn-sm">Supprimer</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="9" class="text-center">Aucun trajet disponible</td></tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>