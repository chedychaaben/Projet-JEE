<%@ page import="model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head><title>Dashboard</title></head>
<body>
<h2>Bienvenue, <%= user.getPrenom() %>!</h2>
<p>Votre rôle: <%= user.getRole() %></p>
<a href="logout">Se déconnecter</a>
</body>
</html>
