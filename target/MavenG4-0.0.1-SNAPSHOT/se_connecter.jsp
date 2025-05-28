<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Se connecter</title>
</head>
<body class="bg-light">
<div class="container d-flex justify-content-center align-items-center vh-100">
  <div class="card p-4">
    <h2 class="card-title text-center mb-4">Se connecter</h2>
    <c:if test="${not empty error}">
      <div class="alert alert-danger">${error}</div>
    </c:if>
    <form action="utilisateurs?action=se_connecter" method="post">
      <div class="mb-3">
        <label for="email" class="form-label">Email</label>
        <input type="email" class="form-control" id="email" name="email" required />
      </div>
      <div class="mb-3">
        <label for="motdepasse" class="form-label">Mot de passe</label>
        <input type="password" class="form-control" id="motdepasse" name="motdepasse" required />
      </div>
      <button type="submit" class="btn btn-primary w-100">Se connecter</button>
    </form>
  </div>
</div>
</body>
</html>