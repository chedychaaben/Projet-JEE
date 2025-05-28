<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html>
<head>
    <title>Modifier un Trajet</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Modifier un Trajet</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form method="post" action="${pageContext.request.contextPath}/trajets?action=modifier_un_trajet" class="p-3">
        <input type="hidden" name="id" value="${trajet.id}"/>
        <div class="mb-3">
            <label for="villeDepart" class="form-label">Ville de départ :</label>
            <select id="villeDepart" name="villeDepart" class="form-select" required>
                <option value="" disabled <c:if test="${empty trajet.villeDepart}">selected</c:if>>-- Sélectionnez une ville --</option>
                <c:forEach var="ville" items="${['Ariana','Beja','Ben Arous','Bizerte','Gabes','Gafsa','Jendouba','Kairouan','Kasserine','Kebili','Kef','Mahdia','Manouba','Medenine','Monastir','Nabeul','Sfax','Sidi Bouzid','Siliana','Sousse','Tataouine','Tozeur','Tunis','Zaghouan']}">
                    <option value="${ville}" <c:if test="${trajet.villeDepart == ville}">selected</c:if>>${ville}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="heureDepart" class="form-label">Heure de départ :</label>
            <input type="time" id="heureDepart" name="heureDepart" value="${trajet.heureDepart}" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="villeArrivee" class="form-label">Ville d'arrivée :</label>
            <select id="villeArrivee" name="villeArrivee" class="form-select" required>
                <option value="" disabled <c:if test="${empty trajet.villeArrivee}">selected</c:if>>-- Sélectionnez une ville --</option>
                <c:forEach var="ville" items="${['Ariana','Beja','Ben Arous','Bizerte','Gabes','Gafsa','Jendouba','Kairouan','Kasserine','Kebili','Kef','Mahdia','Manouba','Medenine','Monastir','Nabeul','Sfax','Sidi Bouzid','Siliana','Sousse','Tataouine','Tozeur','Tunis','Zaghouan']}">
                    <option value="${ville}" <c:if test="${trajet.villeArrivee == ville}">selected</c:if>>${ville}</option>
                </c:forEach>
            </select>
        </div>
        <div class="mb-3">
            <label for="heureArrivee" class="form-label">Heure d'arrivée :</label>
            <input type="time" id="heureArrivee" name="heureArrivee" value="${trajet.heureArrivee}" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="date" class="form-label">Date :</label>
            <fmt:formatDate value="${trajet.date}" pattern="yyyy-MM-dd" var="formattedDate"/>
            <input type="date" id="date" name="date" value="${formattedDate}" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="prix" class="form-label">Prix (TND) :</label>
            <input type="number" step="0.01" id="prix" name="prix" value="${trajet.prix}" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="placesDisponibles" class="form-label">Places disponibles :</label>
            <input type="number" id="placesDisponibles" name="placesDisponibles" value="${trajet.placesDisponibles}" class="form-control" required/>
        </div>
        <button type="submit" class="btn btn-dark w-100">Modifier</button>
    </form>
</div>
</body>
</html>