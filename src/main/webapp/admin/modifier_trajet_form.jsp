<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head><title>Modifier un Trajet</title></head>
<body>
<h1>Modifier un trajet</h1>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/trajets?action=modifier_un_trajet">
    <input type="hidden" name="id" value="${trajet.id}"/>

    Ville départ: <input type="text" name="villeDepart" value="${trajet.villeDepart}" required/><br/>
    Heure départ: <input type="time" name="heureDepart" value="${trajet.heureDepart}" required/><br/>
    Ville arrivée: <input type="text" name="villeArrivee" value="${trajet.villeArrivee}" required/><br/>
    Heure arrivée: <input type="time" name="heureArrivee" value="${trajet.heureArrivee}" required/><br/>
    Date: <input type="date" name="date" value="${trajet.date}" required/><br/>
    Prix: <input type="number" step="0.01" name="prix" value="${trajet.prix}" required/><br/>
    Places disponibles: <input type="number" name="placesDisponibles" value="${trajet.placesDisponibles}" required/><br/>


    <input type="submit" value="Modifier"/>
</form>

</body>
</html>
