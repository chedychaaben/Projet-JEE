<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page Admin</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Panneau d'Administration</h1>
    <div class="d-flex flex-column align-items-center gap-3">
        <a href="${pageContext.request.contextPath}/trajets?action=lister_tous_les_trajets" class="btn btn-dark w-50">Gérer les trajets</a>
        <a href="${pageContext.request.contextPath}/utilisateurs?action=lister_tous_les_utilisateurs" class="btn btn-dark w-50">Gérer les utilisateurs</a>
        <a href="billets?action=lister_tous_les_demandes_annulation" class="btn btn-dark w-50">Gérer les demandes d'annulation</a>
    </div>
</div>
</div>
</body>
</html>