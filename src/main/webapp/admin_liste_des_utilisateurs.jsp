<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Prenom</th>
        <th>Email</th>
        <th>Etat de banissmenet</th>
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
        <td><%= utilisateur.isEstBanned() %></td>
        <td>
            <a href='utilisateurs?action=bloquer_un_utilisateur&id=<%=utilisateur.getId()%>'>Bloquer</a>
            <a href='utilisateurs?action=debloquer_un_utilisateur&id=<%=utilisateur.getId()%>'>Débloquer</a>
        </td>
    </tr>
    <%
        }
    } else {
    %>
    <tr><td colspan="12">Aucun utilisateur trouvé</td></tr>
    <%
        }
    %>
    </tbody>
</table>


</body>
</html>
