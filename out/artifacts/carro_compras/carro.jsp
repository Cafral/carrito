<%--
  Created by German Del Rio
  Date: 15/12/2024
  Time: <%= new java.util.Date().toString().substring(11, 16) %>
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" import="models.*" %>
<%
    Carro carro = (Carro) session.getAttribute("carro");
%>
<html>
<head>
    <title>Carro de compras</title>
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
        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        p {
            text-align: center;
            font-size: 18px;
            color: #555;
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
<h1>Carro de compras</h1>
<%
    if (carro == null || carro.getItems().isEmpty()) {
%>
<p>Lo sentimos, no hay productos en el carro de compras!</p>
<% } else { %>
<table>
    <tr>
        <th>ID PRODUCTO</th>
        <th>NOMBRE</th>
        <th>PRECIO</th>
        <th>CANTIDAD</th>
        <th>TOTAL</th>
    </tr>
    <%
        for (ItemCarro item : carro.getItems()) {
    %>
    <tr>
        <td><%= item.getProductos().getIdProducto() %></td>
        <td><%= item.getProductos().getNombre() %></td>
        <td><%= item.getProductos().getPrecio() %></td>
        <td><%= item.getCantidad() %></td>
        <td><%= item.getSbtotal() %></td>
    </tr>
    <% } %>
    <tr>
        <td colspan="4" style="text-align: right; font-weight: bold;">Total</td>
        <td><%= carro.getTotal() %></td>
    </tr>
</table>
<% } %>
<p><a href="<%= request.getContextPath() %>/productos">Seguir comprando</a></p>
<p><a href="<%= request.getContextPath() %>/index.html">Ir al inicio</a></p>
<div class="footer">
    Creado por German Del Rio - <%= new java.util.Date().toString() %>
</div>
</body>
</html>
