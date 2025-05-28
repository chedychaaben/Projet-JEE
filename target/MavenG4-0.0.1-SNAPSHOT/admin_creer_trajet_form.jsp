<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Créer un Trajet</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Créer un Nouveau Trajet</h1>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    <form method="post" action="${pageContext.request.contextPath}/trajets?action=creer_un_trajet" class="p-3">
        <div class="mb-3">
            <label for="villeDepart" class="form-label">Ville de départ :</label>
            <select id="villeDepart" name="villeDepart" class="form-select" required>
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
            <label for="heureDepart" class="form-label">Heure de départ :</label>
            <input type="time" id="heureDepart" name="heureDepart" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="villeArrivee" class="form-label">Ville d'arrivée :</label>
            <select id="villeArrivee" name="villeArrivee" class="form-select" required>
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
            <label for="heureArrivee" class="form-label">Heure d'arrivée :</label>
            <input type="time" id="heureArrivee" name="heureArrivee" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="date" class="form-label">Date :</label>
            <input type="date" id="date" name="date" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="prix" class="form-label">Prix (TND) :</label>
            <input type="number" step="0.01" id="prix" name="prix" class="form-control" required/>
        </div>
        <div class="mb-3">
            <label for="placesDisponibles" class="form-label">Places disponibles :</label>
            <input type="number" id="placesDisponibles" name="placesDisponibles" class="form-control" required/>
        </div>
        <button type="submit" class="btn btn-dark w-100">Créer</button>
    </form>
</div>
</body>
</html>