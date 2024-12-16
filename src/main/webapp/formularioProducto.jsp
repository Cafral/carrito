<%--
  Created by IntelliJ IDEA.
  User: Cafral
  Date: 14/12/2024
  Time: 17.25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<html>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    Productos productos = (Productos) request.getAttribute("productos");
%>
<head>
    <title>Ingreso de Productos</title>
</head>
<body>

<h1>Formulario de Productos</h1>
<div>
    <form action="<%=request.getContextPath()%>/productos/form" method="post">
        <div>
            <label>Ingrese el nombre del producto</label>
            <br>
            <div>
                <input type="hidden" name="idProducto" value="<%=productos.getIdProducto()%>">
                <input type="text" id="nombre" name="nombre" value="<%=productos.getNombre() != null? productos.getNombre():""%>" required>
            </div>
        </div>
        <div>
            <label for="categoria">Seleccione la categoría</label>
            <div>
                <br>
                <select name="categoria" id="categoria" required>
                    <option value="">---Seleccione la Categoría---</option>
                    <% for (Categoria c : categorias) { %>
                    <option value="<%= c.getIdCategoria() %>" <%=c.getIdCategoria().equals(productos.getCategoria().getIdCategoria())?"selected":""%>><%= c.getNombre() %></option>
                    <% } %>
                </select>
            </div>
        </div>
        <div>
            <br>
            <label for="precio">Ingrese el precio</label>
            <div>
                <input type="number" name="precio" id="precio" step="0.01" value="<%=productos.getPrecio() != 0 ? productos.getPrecio() : ""%>" required>
            </div>
        </div>
        <div>
            <br>
            <input type="submit" value="ENVIAR">
        </div>
    </form>
</div>
</body>
</html>

