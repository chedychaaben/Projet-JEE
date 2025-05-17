<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Créer un Trajet</title></head>
<body>
<h1>Créer un nouveau trajet</h1>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/trajets?action=creer_un_trajet">
    Ville départ: <input type="text" name="villeDepart" required/><br/>
    Heure départ (HH:mm): <input type="time" name="heureDepart" required/><br/>
    Ville arrivée: <input type="text" name="villeArrivee" required/><br/>
    Heure arrivée (HH:mm): <input type="time" name="heureArrivee" required/><br/>
    Date: <input type="date" name="date" required/><br/>
    Prix: <input type="number" step="0.01" name="prix" required/><br/>
    Places disponibles: <input type="number" name="placesDisponibles" required/><br/>

    <input type="submit" value="Créer"/>
</form>

</body>
</html>
