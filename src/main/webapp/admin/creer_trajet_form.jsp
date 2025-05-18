<%@ include file="../header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Créer un Trajet</title></head>
<body>
<h1>Créer un nouveau trajet</h1>

<c:if test="${not empty error}">
    <p style="color:red">${error}</p>
</c:if>

<form method="post" action="${pageContext.request.contextPath}/trajets?action=creer_un_trajet">

    <label for="villeDepart">Ville de départ :</label>
    <select id="villeDepart" name="villeDepart" required>
        <option value="" disabled selected>-- Sélectionnez une ville --</option>
        <option value="Ariana">Ariana</option>
        <option value="Beja">Béja</option>
        <option value="Ben Arous">Ben Arous</option>
        <option value="Bizerte">Bizerte</option>
        <option value="Gabes">Gabès</option>
        <option value="Gafsa">Gafsa</option>
        <option value="Jendouba">Jendouba</option>
        <option value="Kairouan">Kairouan</option>
        <option value="Kasserine">Kasserine</option>
        <option value="Kebili">Kebili</option>
        <option value="Kef">Kef</option>
        <option value="Mahdia">Mahdia</option>
        <option value="Manouba">Manouba</option>
        <option value="Medenine">Médenine</option>
        <option value="Monastir">Monastir</option>
        <option value="Nabeul">Nabeul</option>
        <option value="Sfax">Sfax</option>
        <option value="Sidi Bouzid">Sidi Bouzid</option>
        <option value="Siliana">Siliana</option>
        <option value="Sousse">Sousse</option>
        <option value="Tataouine">Tataouine</option>
        <option value="Tozeur">Tozeur</option>
        <option value="Tunis">Tunis</option>
        <option value="Zaghouan">Zaghouan</option>
    </select>


    Heure départ (HH:mm): <input type="time" name="heureDepart" required/><br/>

    <label for="villeArrivee">Ville de arrivée :</label>
    <select id="villeArrivee" name="villeArrivee" required>
        <option value="" disabled selected>-- Sélectionnez une ville --</option>
        <option value="Ariana">Ariana</option>
        <option value="Beja">Béja</option>
        <option value="Ben Arous">Ben Arous</option>
        <option value="Bizerte">Bizerte</option>
        <option value="Gabes">Gabès</option>
        <option value="Gafsa">Gafsa</option>
        <option value="Jendouba">Jendouba</option>
        <option value="Kairouan">Kairouan</option>
        <option value="Kasserine">Kasserine</option>
        <option value="Kebili">Kebili</option>
        <option value="Kef">Kef</option>
        <option value="Mahdia">Mahdia</option>
        <option value="Manouba">Manouba</option>
        <option value="Medenine">Médenine</option>
        <option value="Monastir">Monastir</option>
        <option value="Nabeul">Nabeul</option>
        <option value="Sfax">Sfax</option>
        <option value="Sidi Bouzid">Sidi Bouzid</option>
        <option value="Siliana">Siliana</option>
        <option value="Sousse">Sousse</option>
        <option value="Tataouine">Tataouine</option>
        <option value="Tozeur">Tozeur</option>
        <option value="Tunis">Tunis</option>
        <option value="Zaghouan">Zaghouan</option>
    </select>

    Heure arrivée (HH:mm): <input type="time" name="heureArrivee" required/><br/>
    Date: <input type="date" name="date" required/><br/>
    Prix: <input type="number" step="0.01" name="prix" required/><br/>
    Places disponibles: <input type="number" name="placesDisponibles" required/><br/>

    <input type="submit" value="Créer"/>
</form>

</body>
</html>
