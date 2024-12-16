<%--
  Created by German Del Rio
  Date: 15/12/2024
  Time: <%= new java.util.Date().toString().substring(11, 16) %>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Confirmar Eliminación</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 20px;
            text-align: center;
        }
        h1 {
            color: #FF0000;
        }
        form {
            margin: 20px auto;
            display: inline-block;
        }
        button {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
        .cancelar {
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 4px;
        }
        .eliminar {
            background-color: #FF0000;
            color: white;
            border: none;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<h1>¿Estás seguro de eliminar este producto?</h1>
<form action="<%= request.getContextPath() %>/productos" method="post">
    <input type="hidden" name="accion" value="confirmarEliminar">
    <input type="hidden" name="idProducto" value="<%= request.getAttribute("idProducto") %>">
    <button type="submit" class="eliminar">Confirmar</button>
    <a href="<%= request.getContextPath() %>/productos"><button type="button" class="cancelar">Cancelar</button></a>
</form>
</body>
</html>


