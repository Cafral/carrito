<%--
  Created by IntelliJ IDEA.
  User: Cafral
  Date: 14/12/2024
  Time: 17.25
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
</head>
<body>
<h1>Listado de Productos</h1>
<% if (username.isPresent()) { %>
<div style="color: red;">Hola <%= username.get() %>, bienvenido a la aplicación</div>
<div>
    <p><a href="<%= request.getContextPath() %>/productos/form">Ingrese el producto</a></p>
</div>
<% } %>
<table>
    <tr>
        <th>ID PRODUCTO</th>
        <th>NOMBRE PRODUCTO</th>
        <th>CATEGORIA</th>
        <% if (username.isPresent()) { %>
        <th>PRECIO</th>
        <th>CANTIDAD</th>
        <th>OPCIONES</th>
        <% } %>
    </tr>
    <%
        for (Productos p : productos) { %>
    <tr>
        <td><%= p.getIdProducto() %></td>
        <td><%= p.getNombre() %></td>
        <td><%= p.getCategoria().getNombre() %></td>
        <% if (username.isPresent()) { %>
        <td><%= p.getPrecio() %></td>
        <td><%= p.getCantidad() %></td> <!-- Mostrar cantidad disponible -->
        <td>
            <a href="<%= request.getContextPath() %>/agregar-carro?idProducto=<%= p.getIdProducto() %>">Agregar al carrito</a>
            <a href="<%= request.getContextPath() %>/productos/form?idProducto=<%= p.getIdProducto() %>">Editar</a>
            <a href="<%= request.getContextPath() %>/productos?accion=eliminar&id=<%= p.getIdProducto() %>"
               onclick="">Eliminar</a>
        </td>
        <% } %>
    </tr>
    <% } %>
</table>
</body>
</html>