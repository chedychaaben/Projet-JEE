<%@ page import="model.User" %>
<% User user = (User) session.getAttribute("user"); %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gestion des tickets de train</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container-fluid">
        <a class="navbar-brand fw-bold" href="pageacceuil.jsp">Gestion des Tickets de Train</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarButtons"
                aria-controls="navbarButtons" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarButtons">
            <% if (user == null) { %>
            <a href="se_connecter.jsp" class="btn btn-outline-light me-2">Se connecter</a>
            <a href="cree_un_compte.jsp" class="btn btn-light">Creer un compte</a>
            <% } else { %>
            <% if (!user.isEstAdmin()) { %>
            <a href="billets?action=liste_de_mes_billets" class="btn btn-outline-light me-2">Mes Billets</a>
            <% } else { %>
            <a href="admin.jsp" class="btn btn-outline-light me-2">Admin</a>
            <% } %>
            <span class="navbar-text text-light me-3">Bienvenue, <%= user.getPrenom() %></span>
            <a href="utilisateurs?action=se_deconnecter" class="btn btn-light">Deconnexion</a>
            <% } %>
        </div>
    </div>
</nav>
<div class="container container-main py-4">