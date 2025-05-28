<%@ include file="header.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Résultats de recherche</title>
</head>
<body>
<div class="card p-4">
    <h1 class="text-center mb-4">Trajets Disponibles</h1>
    <div class="table-responsive">
        <table class="table table-hover">
            <thead>
            <tr>
                <th>Départ</th>
                <th>Arrivée</th>
                <th>Heure départ</th>
                <th>Heure arrivée</th>
                <th>Prix</th>
                <th>Places</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${trajets}" var="trajet">
                <tr>
                    <td>${trajet.villeDepart}</td>
                    <td>${trajet.villeArrivee}</td>
                    <td>${trajet.heureDepart}</td>
                    <td>${trajet.heureArrivee}</td>
                    <td>${trajet.prix} TND</td>
                    <td>${trajet.placesDisponibles}</td>
                    <td>
                        <c:choose>
                            <c:when test="${param.direction == '1'}">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal${trajet.id}">
                                    Réserver
                                </button>
                                <div class="modal fade" id="modal${trajet.id}" tabindex="-1" aria-labelledby="modalLabel${trajet.id}" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="modalLabel${trajet.id}">Réservation retour</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <strong>Voulez-vous réserver un ticket pour le retour ?</strong>
                                            </div>
                                            <div class="modal-footer">
                                                <a href="commande?nb=1&id=${trajet.id}" class="btn btn-secondary">Non</a>
                                                <a href="recherche?direction=2&amp;id_aller=${trajet.id}" class="btn btn-success">Oui</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:when test="${param.direction == '2'}">
                                <a href="commande?nb=2&id_aller=${param.id_aller}&amp;id_retour=${trajet.id}" class="btn btn-success">
                                    Réserver
                                </a>
                            </c:when>
                            <c:otherwise>
                                N/A
                            </c:otherwise>
                        </c:choose>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>