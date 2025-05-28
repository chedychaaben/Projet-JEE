<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page d'Accueil</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4 text-primary">Bienvenue sur TrainTicket !</h1>
    <h3 class="text-center mb-4">Rechercher un trajet</h3>
    <form action="recherche" method="get" class="p-3">
        <input type="hidden" name="direction" value="1">
        <div class="mb-3">
            <label for="date" class="form-label">Date :</label>
            <input type="date" id="date" name="date" class="form-control" required>
        </div>
        <div class="mb-3">
            <label for="ville_depart" class="form-label">Ville de départ :</label>
            <select id="ville_depart" name="ville_depart" class="form-select" required>
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
        </div>
        <div class="mb-3">
            <label for="ville_arrivee" class="form-label">Ville d'arrivée :</label>
            <select id="ville_arrivee" name="ville_arrivee" class="form-select" required>
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
        </div>
        <button type="submit" class="btn btn-primary w-100">Rechercher</button>
    </form>
</div>
</body>
</html>