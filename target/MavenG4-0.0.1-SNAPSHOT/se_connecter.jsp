<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Login</title>
</head>
<body>
<h2>Login</h2>
<form action="utilisateurs?action=se_connecter" method="post">
  <label>Email: <input type="email" name="email" required /></label><br/>
  <label>Mot de passe: <input type="password" name="motdepasse" required /></label><br/>
  <input type="submit" value="Login"/>
</form>
</body>
</html>
