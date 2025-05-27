<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page Accueil</title>
</head>
<body>

<div class="container mt-5">
    <h1 class="text-primary">Bonjour!</h1>
    <p>Rechercher un trajet</p>
    <form action="recherche" method="get">
        <input type="hidden" name="direction" value="1">
        <label for="date">Date :</label>
        <input type="date" id="date" name="date" required>
        <br>
        <br>

        <label for="ville_depart">Ville de départ :</label>
        <select id="ville_depart" name="ville_depart" required>
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
        <br><br>

        <label for="ville_arrivee">Ville d'arrivée :</label>
        <select id="ville_arrivee" name="ville_arrivee" required>
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
        <br><br>

        <button type="submit">Rechercher</button>
    </form>
</div>

</body>
</html>
