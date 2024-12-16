<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*,models.*" %>
<html>
<%
    List<Categoria> categorias = (List<Categoria>) request.getAttribute("categorias");
    Productos productos = (Productos) request.getAttribute("productos");
%>
<head>
    <title>Ingreso de Productos</title>
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
        form {
            max-width: 500px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"], input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
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
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
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

<h1>Formulario de Productos</h1>
<div>
    <form action="<%=request.getContextPath()%>/productos/form" method="post">
        <div>
            <label>Ingrese el nombre del producto</label>
            <div>
                <input type="hidden" name="idProducto" value="<%=productos.getIdProducto()%>">
                <input type="text" id="nombre" name="nombre" value="<%=productos.getNombre() != null? productos.getNombre():""%>" required>
            </div>
        </div>
        <div>
            <label for="categoria">Seleccione la categoría</label>
            <div>
                <select name="categoria" id="categoria" required>
                    <option value="">---Seleccione la Categoría---</option>
                    <% for (Categoria c : categorias) { %>
                    <option value="<%= c.getIdCategoria() %>" <%=c.getIdCategoria().equals(productos.getCategoria().getIdCategoria())?"selected":""%>><%= c.getNombre() %></option>
                    <% } %>
                </select>
            </div>
        </div>
        <div>
            <label for="precio">Ingrese el precio</label>
            <div>
                <input type="number" name="precio" id="precio" step="0.01" value="<%=productos.getPrecio() != 0 ? productos.getPrecio() : ""%>" required>
            </div>
        </div>
        <div>
            <input type="submit" value="ENVIAR">
        </div>
    </form>

    <!-- Enlace para agregar una nueva categoría -->
    <p>
        ¿No encuentras la categoría que necesitas?
        <a href="<%= request.getContextPath() %>/productos/agregarCategoria">Agregar nueva categoría</a>
    </p>
</div>

<div class="footer">
    Creado por German Del Rio - <%= new java.util.Date().toString() %>
</div>

</body>
</html>

