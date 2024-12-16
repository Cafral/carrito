<%--
  Created by IntelliJ IDEA.
  User: Cafral
  Date: 14/12/2024
  Time: 17.25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Sesión</title>
</head>
<body>
<h1>Formulario de Login</h1>
<form action="/carro_compras/login" method="post">
    <div>
        <label for="username">Username</label>
        <div>
            <input type="text" name="username" id="username" required>
        </div>
    </div>
    <div>
        <label for="password">Password</label>
        <div>
            <input type="password" name="password" id="password" required>
        </div>
    </div>
    <div>
        <input type="submit" value="Enviar">
    </div>
</form>
</body>
</html>

