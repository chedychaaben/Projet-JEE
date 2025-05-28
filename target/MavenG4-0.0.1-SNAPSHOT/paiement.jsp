<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<html>
<head>
    <title>Paiement</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Informations de Paiement</h1>
    <form action="paiement" method="post">
        <div class="mb-3">
            <label for="numeroCarte" class="form-label">Numéro de carte :</label>
            <input type="text" id="numeroCarte" name="numeroCarte" class="form-control" required />
        </div>
        <div class="mb-3">
            <label for="dateExpiration" class="form-label">Date d'expiration (MM/AA) :</label>
            <input type="text" id="dateExpiration" name="dateExpiration" class="form-control" placeholder="MM/AA" required />
        </div>
        <div class="mb-3">
            <label for="cvv" class="form-label">CVV :</label>
            <input type="text" id="cvv" name="cvv" class="form-control" required />
        </div>
        <input type="hidden" name="id1" value="${id1}" />
        <input type="hidden" name="c1" value="${c1}" />
        <input type="hidden" name="pcf1" value="${pcf1}" />
        <input type="hidden" name="ef1" value="${ef1}" />
        <input type="hidden" name="wnf1" value="${wnf1}" />
        <input type="hidden" name="id2" value="${id2}" />
        <input type="hidden" name="c2" value="${c2}" />
        <input type="hidden" name="pcf2" value="${pcf2}" />
        <input type="hidden" name="ef2" value="${ef2}" />
        <input type="hidden" name="wnf2" value="${wnf2}" />
        <div class="alert alert-info">
            <strong>Cartes de test valides :</strong><br>
            Carte : 4444455555554444 - Expiration : 12/25 - CVV : 123<br>
            Carte : 5555666677778888 - Expiration : 11/26 - CVV : 456<br>
            Carte : 378282246310005 - Expiration : 10/27 - CVV : 1234
        </div>
        <button type="submit" class="btn btn-primary w-100">Confirmer le paiement</button>
    </form>
</div>
</body>
</html>