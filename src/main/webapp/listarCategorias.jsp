<%--
  Created by IntelliJ IDEA.
  User: Cafral
  Date: 14/12/2024
  Time: 17.25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Listado de Categorías</title>
</head>
<body>
<h1>Listado de Categorías</h1>
<br>
<br>
<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Estado</th>
        <th>Acciones</th>
    </tr>
    <% for (Categoria c : categorias) { %>
    <tr>
        <td><%= c.getIdCategoria() %>
        </td>
        <td><%= c.getNombre() %>
        </td>
        <td class="<%= c.getEstado() == 1 ? "activo" : "inactivo" %>">
            <%= c.getEstado() == 1 ? "Activo" : "Inactivo" %>
        </td>
        <td>
            <% if (c.getEstado() == 1) { %>
            <a href="<%= request.getContextPath() %>/categorias?accion=desactivar&id=<%= c.getIdCategoria() %>">Desactivar</a>
            <% } else { %>
            <a href="<%= request.getContextPath() %>/categorias?accion=activar&id=<%= c.getIdCategoria() %>">Activar</a>
            <% } %>
        </td>
    </tr>
    <% } %>
</table>
</body>
</html>