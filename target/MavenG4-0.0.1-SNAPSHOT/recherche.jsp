<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Recherche de trajets</title>
</head>
<body>
<h2>Rechercher un trajet</h2>
<form action="recherche" method="post">
    Ville de départ: <input type="text" name="villeDepart" required><br>
    Ville d'arrivée: <input type="text" name="villeArrivee" required><br>
    Date: <input type="date" name="date" required><br>
    <button type="submit">Rechercher</button>
</form>
</body>
</html>