<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>Gérer les Utilisateurs</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Liste des Utilisateurs</h1>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Email</th>
                <th>État de Bannissement</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<User> utilisateurs = (List<User>) request.getAttribute("utilisateurs");
                if (utilisateurs != null) {
                    for (User utilisateur : utilisateurs) {
            %>
            <tr>
                <td><%= utilisateur.getId() %></td>
                <td><%= utilisateur.getNom() %></td>
                <td><%= utilisateur.getPrenom() %></td>
                <td><%= utilisateur.getEmail() %></td>
                <td><%= utilisateur.isEstBanned() ? "Banni" : "Actif" %></td>
                <td>
                    <a href='utilisateurs?action=bloquer_un_utilisateur&id=<%=utilisateur.getId()%>' class="btn btn-danger btn-sm">Bloquer</a>
                    <a href='utilisateurs?action=debloquer_un_utilisateur&id=<%=utilisateur.getId()%>' class="btn btn-success btn-sm">Débloquer</a>
                </td>
            </tr>
            <%
                }
            } else {
            %>
            <tr><td colspan="6" class="text-center">Aucun utilisateur trouvé</td></tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>