<%--
  Created by IntelliJ IDEA.
  User: German Del Rio
  Date: 15/12/2024
  Time: <%= new java.util.Date().toString().substring(11, 16) %>
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Sesión</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 20px;
        }
        h1 {
            text-align: center;
            color: #007BFF;
        }
        form {
            max-width: 400px;
            margin: auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }
        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        .footer {
            text-align: center;
            margin-top: 30px;
            font-size: 12px;
            color: #555;
        }
    </style>
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
<div class="footer">
    Creado por German Del Rio - <%= new java.util.Date().toString() %>
</div>
</body>
</html>

