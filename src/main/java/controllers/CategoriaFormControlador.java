package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Categoria;
import repositories.CategoriaRepositoryJdbcImplement;
import service.ProductoService;
import service.ProductoServiceJdbcImplement;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@WebServlet("/categorias/form")
public class CategoriaFormControlador extends HttpServlet {
    private CategoriaRepositoryJdbcImplement categoriaRepo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        Connection conn = (Connection) request.getAttribute("conn");
        ProductoService service = new ProductoServiceJdbcImplement(conn);
        request.setAttribute("categorias", service.listarCategorias());
        //Declaramos una variable de tipo Long para guardar el idProducto
        Long id;
        try {
            //En la variable id guardamos lo que estamos mandando por el metodo get idProducto
            id = Long.parseLong(request.getParameter("idCategoria"));
        }catch (NumberFormatException e) {
            id = 0L;
        }
        //Creamos un objeto vacio de tipo categoria
        Categoria categorias = new Categoria();
        //Seteamos la categoria
        categorias.setIdCategoria(id);
        //Si el id>0
        if (id>0) {
            //Creamos una variable de tipo optional para obtener el producto por id
            Optional<Categoria> o = service.agregarPorIdCate(id);
            //Si la variable optional esta presente obtenemos todos los valores
            if (o.isPresent()) {
                categorias = o.get();
            }
        }
        request.setAttribute("categorias", categorias);
        // Mostrar formulario para agregar nueva categoría
        request.getRequestDispatcher("/formularioCategoria.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener la conexión
        Connection conn = (Connection) request.getAttribute("conn");
        ProductoService service = new ProductoServiceJdbcImplement(conn);

        String nombreCategoria = request.getParameter("nombreCategoria");
        List<String> errores = new ArrayList<>();

        // Validación de campos
        if (nombreCategoria == null || nombreCategoria.trim().isEmpty()) {
            errores.add("El nombre de la categoria es obligatorio.");
        }
        if (nombreCategoria != null && !nombreCategoria.matches("^[a-zA-Z\\s]+$")) {
            errores.add("El nombre de la categoría solo puede contener letras.");
        }

        // Si hay errores, redirigir de nuevo al formulario con los errores
        if (!errores.isEmpty()) {
            request.setAttribute("errores", errores);
            request.setAttribute("nombreCategoria", nombreCategoria); // Mantener el valor ingresado
            request.getRequestDispatcher("/formularioCategoria.jsp").forward(request, response);
            return;
        }

        // Crear y guardar la nueva categoría
        categoriaRepo = new CategoriaRepositoryJdbcImplement(conn);
        Categoria categoria = new Categoria();
        categoria.setNombre(nombreCategoria);
        categoria.setEstado(1);
        try {
            categoriaRepo.guardar(categoria);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath() + "/categorias");

    }
}

