<%--
  Created by German Del Rio
  Date: 15/12/2024
  Time: <%= new java.util.Date().toString().substring(11, 16) %>
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<%
    List<Productos> productos = (List<Productos>) request.getAttribute("productos");
    Optional<String> username = (Optional<String>) request.getAttribute("username");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Lista de Productos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            color: #333;
            margin: 20px;
        }
        h1 {
            text-align: center;
            color: #007BFF;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        a {
            text-decoration: none;
            color: #007BFF;
        }
        a:hover {
            text-decoration: underline;
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
<h1>Listado de Productos</h1>
<% if (username.isPresent()) { %>
<div style="color: red;">Hola <%= username.get() %>, bienvenido a la aplicación</div>
<div>
    <p><a href="<%= request.getContextPath() %>/productos/form">Ingrese el producto</a></p>
    <p><a href="<%= request.getContextPath() %>/categorias">Ver Categorías</a></p> <!-- Nuevo enlace -->
</div>
<% } %>
<table>
    <tr>
        <th>ID PRODUCTO</th>
        <th>NOMBRE PRODUCTO</th>
        <th>CATEGORIA</th>
        <th>PRECIO</th>
        <th>CANTIDAD</th> <!-- Nueva columna para cantidad -->
        <% if (username.isPresent()) { %>
        <th>OPCIONES</th>
        <% } %>
    </tr>
    <%
        for (Productos p : productos) { %>
    <tr>
        <td><%= p.getIdProducto() %></td>
        <td><%= p.getNombre() %></td>
        <td><%= p.getCategoria().getNombre() %></td>
        <td><%= p.getPrecio() %></td>
        <td><%= p.getCantidad() %></td> <!-- Mostrar cantidad disponible -->
        <% if (username.isPresent()) { %>
        <td>
            <a href="<%= request.getContextPath() %>/agregar-carro?idProducto=<%= p.getIdProducto() %>">Agregar</a>
            <a href="<%= request.getContextPath() %>/productos/form?idProducto=<%= p.getIdProducto() %>">Editar</a>
            <a href="<%= request.getContextPath() %>/productos?accion=eliminar&id=<%= p.getIdProducto() %>"
               onclick="return confirm('¿Estás seguro de que deseas eliminar este producto?');">Eliminar</a>
        </td>
        <% } %>
    </tr>
    <% } %>
</table>

<div class="footer">
    Creado por German Del Rio - <%= new java.util.Date().toString() %>
</div>
</body>
</html>




