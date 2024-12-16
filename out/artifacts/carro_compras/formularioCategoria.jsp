<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Categorías</title>
    <!-- Agregar Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <h2>Formulario de Categorías</h2>

    <!-- Formulario para Agregar Categoría -->
    <form action="/guardarCategoria" method="POST" id="formCategoria" novalidate>
        <!-- Campo para el nombre de la categoría -->
        <div class="form-group">
            <label for="categoriaNombre">Nombre de la Categoría</label>
            <input type="text" class="form-control" id="categoriaNombre" name="categoriaNombre" required>
            <div class="invalid-feedback">El nombre de la categoría es obligatorio.</div>
        </div>

        <!-- Campo para seleccionar el estado de la categoría -->
        <div class="form-group">
            <label for="categoriaEstado">Estado</label>
            <select class="form-control" id="categoriaEstado" name="categoriaEstado" required>
                <option value="">Seleccione un estado</option>
                <option value="1">Activo</option>
                <option value="0">Inactivo</option>
            </select>
            <div class="invalid-feedback">Debe seleccionar el estado de la categoría.</div>
        </div>

        <button type="submit" class="btn btn-primary">Guardar Categoría</button>
    </form>

    <hr>

    <!-- Tabla para Listar Categorías -->
    <h2>Lista de Categorías</h2>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Estado</th>
        </tr>
        </thead>
        <tbody id="categoria-list">
        <!-- Aquí se cargarían dinámicamente las categorías desde la base de datos -->
        <!-- Ejemplo de categorías estáticas -->
        <tr>
            <td>1</td>
            <td>Electrónica</td>
            <td>Activo</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Ropa</td>
            <td>Inactivo</td>
        </tr>
        </tbody>
    </table>
</div>

<!-- Scripts de Bootstrap -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<!-- Script para validaciones -->
<script>
    // Habilitar la validación de formularios en el frontend
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var form = document.getElementById('formCategoria');
            form.addEventListener('submit', function(event) {
                if (form.checkValidity() === false) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            }, false);
        }, false);
    })();
</script>

</body>
</html>
