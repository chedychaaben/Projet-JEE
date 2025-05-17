<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("se_connecter.jsp");
        return;
    }
%>

<html>
<head><title>Dashboard</title></head>
<body>
<h2>Bienvenue, <%= user.getPrenom() %>!</h2>
<p>Votre rôle: <%= user.isEstAdmin() %></p>
<a href="utilisateurs?action=se_deconnecter">Se déconnecter</a>
</body>
</html>
