<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Sign Up</title>
</head>
<body>
<h2>Create an Account</h2>
<form action="signup" method="post">
    <label>Nom: <input type="text" name="nom" required /></label><br/>
    <label>Prénom: <input type="text" name="prenom" required /></label><br/>
    <label>Email: <input type="email" name="email" required /></label><br/>
    <label>Mot de passe: <input type="password" name="motdepasse" required /></label><br/>
    <label>Role:
        <select name="role">
            <option value="USER">User</option>
            <option value="ADMIN">Admin</option>
        </select>
    </label><br/>
    <input type="submit" value="Sign Up"/>
</form>
</body>
</html>
