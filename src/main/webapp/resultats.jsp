<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Résultats de recherche</title>
</head>
<body>
<h2>Trajets disponibles</h2>
<table border="1">
  <tr>
    <th>Départ</th>
    <th>Arrivée</th>
    <th>Heure départ</th>
    <th>Heure arrivée</th>
    <th>Prix</th>
    <th>Places</th>
    <th>Action</th>
  </tr>
  <c:forEach items="${trajets}" var="trajet">
    <tr>
      <td>${trajet.villeDepart}</td>
      <td>${trajet.villeArrivee}</td>
      <td>${trajet.heureDepart}</td>
      <td>${trajet.heureArrivee}</td>
      <td>${trajet.prix} TND</td>
      <td>${trajet.placesDisponibles}</td>
      <td><a href="reservation?id=${trajet.id}">Réserver</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>