<%-- Created by German Del Rio --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Listado de Categorías</title>
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
            width: 80%;
            margin: auto;
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
        .activo {
            color: green;
        }
        .inactivo {
            color: red;
        }
    </style>
</head>
<body>
<h1>Listado de Categorías</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Nombre</th>
        <th>Estado</th>
        <th>Acciones</th>
    </tr>
    <% for (Categoria c : categorias) { %>
    <tr>
        <td><%= c.getIdCategoria() %></td>
        <td><%= c.getNombre() %></td>
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

<div style="text-align: center; margin-top: 20px;">
    <a href="<%= request.getContextPath() %>/productos"
       style="background-color: #007BFF; color: white; padding: 10px 15px; text-decoration: none; border-radius: 5px;">
        Regresar a Productos
    </a>
</div>

<div class="footer" style="text-align:center; margin-top:20px;">
    Creado por German Del Rio - <%= new java.util.Date().toString() %>
</div>

