<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Billet" %>
<%@ page import="model.Trajet" %>
<%@ page import="model.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Billet billet = (Billet) request.getAttribute("billet");
    Trajet trajetAller = billet.getTrajetAller();
    Trajet trajetRetour = billet.getTrajetRetour();
    User user = billet.getUser();
%>

<html>
<head>
    <title>Paiement Reçu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
        }
        .billet {
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 12px;
            max-width: 600px;
            margin: auto;
        }
        h2 {
            text-align: center;
        }
        .actions {
            margin-top: 20px;
            text-align: center;
        }
        .actions a {
            margin: 0 10px;
            text-decoration: none;
            color: white;
            background-color: #007bff;
            padding: 10px 15px;
            border-radius: 6px;
        }
    </style>
</head>
<body>

<div class="billet">
    <h2>Paiement Confirmé</h2>
    <p>Nous avons bien reçu votre paiement. Merci pour votre confiance.</p>

    <h3>Détails du billet</h3>
    <ul>
        <li><strong>ID :</strong> <%= billet.getId() %></li>
        <li><strong>Utilisateur :</strong> <%= user != null ? user.getNom() : "Utilisateur inconnu" %></li>
        <li><strong>Date d'achat :</strong> <%= billet.getDateAchat() %></li>

        <li><strong>Trajet Aller :</strong> <%= trajetAller != null ? trajetAller.toString() : "Non spécifié" %></li>
        <li><strong>Classe :</strong> <%= billet.getTrajetAllerClasse() %></li>
        <li><strong>Fenêtre :</strong> <%= billet.isTrajetAllerPlaceCoteFenetre() ? "Oui" : "Non" %></li>
        <li><strong>Espace famille :</strong> <%= billet.isTrajetAllerEspaceFamille() ? "Oui" : "Non" %></li>
        <li><strong>Non-fumeur :</strong> <%= billet.isTrajetAllerWagonNonFumeur() ? "Oui" : "Non" %></li>

        <c:if test="${billet.trajetRetour != null}">
            <li><strong>Trajet Retour :</strong> <%= trajetRetour.toString() %></li>
            <li><strong>Classe :</strong> <%= billet.getTrajetRetourClasse() %></li>
            <li><strong>Fenêtre :</strong> <%= billet.isTrajetRetourPlaceCoteFenetre() ? "Oui" : "Non" %></li>
            <li><strong>Espace famille :</strong> <%= billet.isTrajetRetourEspaceFamille() ? "Oui" : "Non" %></li>
            <li><strong>Non-fumeur :</strong> <%= billet.isTrajetRetourWagonNonFumeur() ? "Oui" : "Non" %></li>
        </c:if>
    </ul>

    <div class="actions">
        <a href="TelechargerBilletPdfServlet?id=<%= billet.getId() %>">Télécharger le PDF</a>
        <a href="historique.jsp">Voir l'historique</a>
    </div>
</div>

</body>
</html>
