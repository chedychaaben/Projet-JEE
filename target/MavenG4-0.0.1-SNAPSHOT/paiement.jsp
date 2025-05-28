<!-- payment.jsp -->
<html>
<head><title>Paiement simulé</title></head>
<body>
<h2>Entrez vos informations de paiement</h2>

<form action="paiement" method="post">
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

    <label>Numéro de carte :</label><br>
    <input type="text" name="numeroCarte" maxlength="19" required /><br><br>

    <label>Date d'expiration (MM/AA) :</label><br>
    <input type="text" name="dateExpiration" maxlength="5" required /><br><br>

    <label>CVV :</label><br>
    <input type="text" name="cvv" maxlength="4" required /><br><br>

    <input type="submit" value="Payer" />
</form>

<h3>Cartes de test valides :</h3>
<ul>
    <li>Carte : 4444455555554444 - Expiration : 12/25 - CVV : 123</li>
    <li>Carte : 5555666677778888 - Expiration : 11/26 - CVV : 456</li>
    <li>Carte : 378282246310005  - Expiration : 10/27 - CVV : 1234</li>
</ul>

<% String message = (String) request.getAttribute("message");
    if (message != null) { %>
<p><strong><%= message %></strong></p>
<% } %>

ID1: ${id1} <br>
C1: ${c1} <br>
PCF1: ${pcf1} <br>
EF1: ${ef1} <br>
WNF1: ${wnf1} <br>

ID2: ${id2} <br>
C2: ${c2} <br>
PCF2: ${pcf2} <br>
EF2: ${ef2} <br>
WNF2: ${wnf2} <br>

</body>
</html>
