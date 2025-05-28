<%@ page import="model.User" %>
<%@ include file="header.jsp" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("se_connecter.jsp");
        return;
    }
%>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
<div class="card p-4 text-center">
    <h2 class="mb-4">Bienvenue, <%= user.getPrenom() %>!</h2>
    <p class="mb-4">Votre rôle : <%= user.isEstAdmin() ? "Administrateur" : "Utilisateur" %></p>
    <a href="utilisateurs?action=se_deconnecter" class="btn btn-danger">Se déconnecter</a>
</div>
</body>
</html>