<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Commander</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Confirmer votre réservation</h1>
    <form action="paiement" method="post">
        <div class="trajet-info">
            <h3>Trajet Aller</h3>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Ville de départ</th>
                        <th>Ville d'arrivée</th>
                        <th>Heure de départ</th>
                        <th>Heure d'arrivée</th>
                        <th>Prix</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${trajet1.villeDepart}</td>
                        <td>${trajet1.villeArrivee}</td>
                        <td>${trajet1.heureDepart}</td>
                        <td>${trajet1.heureArrivee}</td>
                        <td>${trajet1.prix} TND</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h4 class="mt-3">Préférences pour le trajet aller :</h4>
            <input type="hidden" id="id1" name="id1" value="${trajet1.id}" />
            <div class="mb-3">
                <label for="c1" class="form-label">Classe :</label>
                <select name="c1" id="c1" class="form-select" required>
                    <option value="">-- Sélectionnez --</option>
                    <option value="premier">Premier</option>
                    <option value="deuxieme">Deuxième</option>
                    <option value="economique">Économique</option>
                </select>
            </div>
            <div class="form-check mb-2">
                <input type="checkbox" id="pcf1" name="pcf1" class="form-check-input" />
                <label for="pcf1" class="form-check-label">Place côté fenêtre</label>
            </div>
            <div class="form-check mb-2">
                <input type="checkbox" id="ef1" name="ef1" class="form-check-input" />
                <label for="ef1" class="form-check-label">Espace famille</label>
            </div>
            <div class="form-check mb-2">
                <input type="checkbox" id="wnf1" name="wnf1" class="form-check-input" />
                <label for="wnf1" class="form-check-label">Wagon non-fumeur</label>
            </div>
        </div>
        <%
            if (request.getAttribute("trajet2") != null) {
        %>
        <div class="trajet-info">
            <h3>Trajet Retour</h3>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                    <tr>
                        <th>Ville de départ</th>
                        <th>Ville d'arrivée</th>
                        <th>Heure de départ</th>
                        <th>Heure d'arrivée</th>
                        <th>Prix</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>${trajet2.villeDepart}</td>
                        <td>${trajet2.villeArrivee}</td>
                        <td>${trajet2.heureDepart}</td>
                        <td>${trajet2.heureArrivee}</td>
                        <td>${trajet2.prix} TND</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <h4 class="mt-3">Préférences pour le trajet retour :</h4>
            <input type="hidden" id="id2" name="id2" value="${trajet2.id}" />
            <div class="mb-3">
                <label for="c2" class="form-label">Classe :</label>
                <select name="c2" id="c2" class="form-select" required>
                    <option value="">-- Sélectionnez --</option>
                    <option value="premier">Premier</option>
                    <option value="deuxieme">Deuxième</option>
                    <option value="economique">Économique</option>
                </select>
            </div>
            <div class="form-check mb-2">
                <input type="checkbox" id="pcf2" name="pcf2" class="form-check-input" />
                <label for="pcf2" class="form-check-label">Place côté fenêtre</label>
            </div>
            <div class="form-check mb-2">
                <input type="checkbox" id="ef2" name="ef2" class="form-check-input" />
                <label for="ef2" class="form-check-label">Espace famille</label>
            </div>
            <div class="form-check mb-2">
                <input type="checkbox" id="wnf2" name="wnf2" class="form-check-input" />
                <label for="wnf2" class="form-check-label">Wagon non-fumeur</label>
            </div>
        </div>
        <%
            }
        %>
        <button type="submit" class="btn btn-primary w-100 mt-3">Passer au paiement</button>
    </form>
</div>
</body>
</html>