<!-- /WEB-INF/includes/header.jsp -->

<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gestion des tickets de train</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="pageacceuil.jsp">Gestion des tickets de train</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarButtons"
                aria-controls="navbarButtons" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse justify-content-end" id="navbarButtons">
            <% if (user == null) { %>
                <a href="se_connecter.jsp" class="btn btn-outline-dark">Se connecter</a>
                <a href="cree_un_compte.jsp" class="btn btn-dark">Creer un compte</a>
            <% } else { %>
            <% if (!user.isEstAdmin()) { %>
                <a href="liste_de_mes_billets.jsp" class="btn btn-outline-dark">Mes Billets</a>
            <% } else { %>
                <a href="admin/admin.jsp" class="btn btn-outline-dark">Admin</a>
            <% } %>
                <a href="utilisateurs?action=se_deconnecter" class="btn btn-dark">Deconnexion</a>
            <% } %>
        </div>
    </div>
</nav>
</body>
</html>
