<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cree un compte</title>
</head>
<body>
<h2>Cree un compte</h2>
<form action="utilisateurs?action=cree_un_compte" method="post">
    <label>Nom: <input type="text" name="nom" required /></label><br/>
    <label>Prénom: <input type="text" name="prenom" required /></label><br/>
    <label>Email: <input type="email" name="email" required /></label><br/>
    <label>Mot de passe: <input type="password" name="motdepasse" required /></label><br/>

    <label>
        <input type="checkbox" name="estAdmin" value="false" /> Admin
    </label><br/>
    <input type="submit" value="Cree un compte"/>
</form>
</body>
</html>
