<%--
  Created by German Del Rio
  Date: 15/12/2024
  Time: <%= new java.util.Date().toString().substring(11, 16) %>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Agregar Categoría</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 20px;
        }
        h1 {
            color: #007BFF;
            text-align: center;
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
        input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        button[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button[type="submit"]:hover {
            background-color: #218838;
        }
        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #555;
        }
    </style>
</head>
<body>
<h1>Agregar Nueva Categoría</h1>
<form action="<%=request.getContextPath()%>/productos/agregarCategoria" method="post">
    <label for="nombreCategoria">Nombre de la Categoría:</label>
    <input type="text" id="nombreCategoria" name="nombreCategoria" required>
    <button type="submit">Guardar</button>
</form>
<div class="footer">
    Creado por German Del Rio - <%= new java.util.Date().toString() %>
</div>
</body>
</html>
