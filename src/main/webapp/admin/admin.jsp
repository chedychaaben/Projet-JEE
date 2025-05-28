<%@ include file="../header.jsp" %>
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


<a href="billets?action=lister_tous_les_demandes_annulation">
    Gerer les demandes d'annulation
</a>



</body>
</html>
