<%--
  Created by IntelliJ IDEA.
  User: Cafral
  Date: 14/12/2024
  Time: 17.25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Confirmar Eliminación</title>
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


