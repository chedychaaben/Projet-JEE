<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Créer un compte</title>
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center vh-100">
    <div class="card p-4">
        <h2 class="card-title text-center mb-4">Créer un compte</h2>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>
        <form action="utilisateurs?action=cree_un_compte" method="post">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom</label>
                <input type="text" class="form-control" id="nom" name="nom" required />
            </div>
            <div class="mb-3">
                <label for="prenom" class="form-label">Prénom</label>
                <input type="text" class="form-control" id="prenom" name="prenom" required />
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" required />
            </div>
            <div class="mb-3">
                <label for="motdepasse" class="form-label">Mot de passe</label>
                <input type="password" class="form-control" id="motdepasse" name="motdepasse" required />
            </div>
            <div class="form-check mb-4">
                <input class="form-check-input" type="checkbox" id="estAdmin" name="estAdmin" value="true" />
                <label class="form-check-label" for="estAdmin">Admin</label>
            </div>
            <button type="submit" class="btn btn-dark w-100">Créer un compte</button>
        </form>
    </div>
</div>
</body>
</html>