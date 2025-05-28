<%@ include file="header.jsp" %>
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

    <label for="villeDepart">Ville de départ :</label>
    <select id="villeDepart" name="villeDepart" required>
        <option value="" disabled <c:if test="${empty trajet.villeDepart}">selected</c:if>>-- Sélectionnez une ville --</option>
        <c:forEach var="ville" items="${['Ariana','Beja','Ben Arous','Bizerte','Gabes','Gafsa','Jendouba','Kairouan','Kasserine','Kebili','Kef','Mahdia','Manouba','Medenine','Monastir','Nabeul','Sfax','Sidi Bouzid','Siliana','Sousse','Tataouine','Tozeur','Tunis','Zaghouan']}">
            <option value="${ville}" <c:if test="${trajet.villeDepart == ville}">selected</c:if>>${ville}</option>
        </c:forEach>
    </select>



    Heure départ: <input type="time" name="heureDepart" value="${trajet.heureDepart}" required/><br/>



    <label for="villeArrivee">Ville d'arrivee :</label>
    <select id="villeArrivee" name="villeArrivee" required>
        <option value="" disabled <c:if test="${empty trajet.villeArrivee}">selected</c:if>>-- Sélectionnez une ville --</option>
        <c:forEach var="ville" items="${['Ariana','Beja','Ben Arous','Bizerte','Gabes','Gafsa','Jendouba','Kairouan','Kasserine','Kebili','Kef','Mahdia','Manouba','Medenine','Monastir','Nabeul','Sfax','Sidi Bouzid','Siliana','Sousse','Tataouine','Tozeur','Tunis','Zaghouan']}">
            <option value="${ville}" <c:if test="${trajet.villeArrivee == ville}">selected</c:if>>${ville}</option>
        </c:forEach>
    </select>

    Heure arrivée: <input type="time" name="heureArrivee" value="${trajet.heureArrivee}" required/><br/>
    Date: <input type="date" name="date" value="${trajet.date}" required/><br/>
    Prix: <input type="number" step="0.01" name="prix" value="${trajet.prix}" required/><br/>
    Places disponibles: <input type="number" name="placesDisponibles" value="${trajet.placesDisponibles}" required/><br/>


    <input type="submit" value="Modifier"/>
</form>

</body>
</html>
