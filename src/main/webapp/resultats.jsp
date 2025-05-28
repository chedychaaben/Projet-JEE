<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<html>
<head>
  <title>Résultats de recherche</title>
</head>
<body>
<div class="card p-4">
  <h1 class="text-center mb-4">Trajets Disponibles</h1>
  <div class="table-responsive">
    <table class="table table-hover">
      <thead>
      <tr>
        <th>Départ</th>
        <th>Arrivée</th>
        <th>Heure départ</th>
        <th>Heure arrivée</th>
        <th>Prix</th>
        <th>Places</th>
        <th>Action</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${trajets}" var="trajet">
        <tr>
          <td>${trajet.villeDepart}</td>
          <td>${trajet.villeArrivee}</td>
          <td>${trajet.heureDepart}</td>
          <td>${trajet.heureArrivee}</td>
          <td>${trajet.prix} TND</td>
          <td>${trajet.placesDisponibles}</td>
          <td><a href="reservation?id=${trajet.id}" class="btn btn-primary btn-sm">Réserver</a></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>
</body>
</html>