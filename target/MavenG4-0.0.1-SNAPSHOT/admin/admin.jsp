<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 5/16/2025
  Time: 10:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page Admin</title>
</head>
<body>

<a href="${pageContext.request.contextPath}/trajets?action=lister_tous_les_trajets">
    Gerer les trajets
</a>




<a href="${pageContext.request.contextPath}/utilisateurs?action=lister_tous_les_utilisateurs">
    Gerer les utilisateurs
</a>


<a href="annulation_des_billets?action=lister_tous_les_demandes_annulation">
    Gerer les demandes d'annulation
</a>



</body>
</html>
