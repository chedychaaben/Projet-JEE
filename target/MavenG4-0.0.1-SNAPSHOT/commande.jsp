<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Commander</title>
</head>
<body>

<form action="paiement" method="post">

    <!-- Trajet 1 -->
    <table border="1">
        <tr>
            <th>Ville de départ</th>
            <th>Ville d'arrivée</th>
            <th>Heure de départ</th>
            <th>Heure d'arrivée</th>
            <th>Prix</th>
        </tr>
        <tr>
            <td>${trajet1.villeDepart}</td>
            <td>${trajet1.villeArrivee}</td>
            <td>${trajet1.heureDepart}</td>
            <td>${trajet1.heureArrivee}</td>
            <td>${trajet1.prix} €</td>
        </tr>
    </table>

    <h3>Choisissez vos préférences pour le trajet aller :</h3>

    <input type="hidden" id="id1" name="id1" value="${trajet1.id}" />

    <label for="c1">Classe :</label>
    <select name="c1" id="c1" required>
        <option value="">--Sélectionnez--</option>
        <option value="premier">Premier</option>
        <option value="deuxieme">Deuxième</option>
        <option value="economique">Économique</option>
    </select>
    <br>

    <input type="checkbox" id="pcf1" name="pcf1" />
    <label for="pcf1">Place côté fenêtre</label>
    <br>

    <input type="checkbox" id="ef1" name="ef1" />
    <label for="ef1">Espace famille</label>
    <br>

    <input type="checkbox" id="wnf1" name="wnf1" />
    <label for="wnf1">Wagon non-fumeur</label>
    <br><br>

    <%
        if (request.getAttribute("trajet2") != null) {
    %>
        <table border="1">
            <tr>
                <th>Ville de départ</th>
                <th>Ville d'arrivée</th>
                <th>Heure de départ</th>
                <th>Heure d'arrivée</th>
                <th>Prix</th>
            </tr>
            <tr>
                <td>${trajet2.villeDepart}</td>
                <td>${trajet2.villeArrivee}</td>
                <td>${trajet2.heureDepart}</td>
                <td>${trajet2.heureArrivee}</td>
                <td>${trajet2.prix} €</td>
            </tr>
        </table>

        <h3>Choisissez vos préférences pour le trajet retour :</h3>

        <input type="hidden" id="id2" name="id2" value="${trajet2.id}" />

        <label for="c2">Classe :</label>
        <select name="c2" id="c2" required>
            <option value="">--Sélectionnez--</option>
            <option value="premier">Premier</option>
            <option value="deuxieme">Deuxième</option>
            <option value="economique">Économique</option>
        </select>
        <br>

        <input type="checkbox" id="pcf2" name="pcf2" />
        <label for="pcf2">Place côté fenêtre</label>
        <br>

        <input type="checkbox" id="ef2" name="ef2" />
        <label for="ef2">Espace famille</label>
        <br>

        <input type="checkbox" id="wnf2" name="wnf2" />
        <label for="wnf2">Wagon non-fumeur</label>
        <br><br>
    <%
        }
    %>

    <button type="submit">Passer au paiement</button>

</form>

</body>
</html>
