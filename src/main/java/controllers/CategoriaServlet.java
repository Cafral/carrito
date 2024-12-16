package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Categoria;
import repositories.CategoriaRepositoryJdbcImplement;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/categorias")
public class CategoriaServlet extends HttpServlet {
    private CategoriaRepositoryJdbcImplement categoriaRepo;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        Connection conn = (Connection) request.getAttribute("conn");
        categoriaRepo = new CategoriaRepositoryJdbcImplement(conn);

        try {
            Long id;
            if ("desactivar".equals(accion)) {
                id = Long.parseLong(request.getParameter("id"));
                categoriaRepo.actualizarEstado(id, 0); // Cambia estado a 0
                response.sendRedirect(request.getContextPath() + "/categorias");
            } else if ("activar".equals(accion)) {
                id = Long.parseLong(request.getParameter("id"));
                categoriaRepo.actualizarEstado(id, 1); // Cambia estado a 1
                response.sendRedirect(request.getContextPath() + "/categorias");
            } else {
                // Listar todas las categorías
                request.setAttribute("categorias", categoriaRepo.listar());
                request.getRequestDispatcher("/listarCategorias.jsp").forward(request, response);
            }
        } catch (Exception e) {
            throw new ServletException("Error al procesar la solicitud de categorías", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreCategoria = request.getParameter("nombreCategoria");
        Connection conn = (Connection) request.getAttribute("conn");

        if (conn != null) {
            try {
                categoriaRepo = new CategoriaRepositoryJdbcImplement(conn);
                Categoria categoria = new Categoria();
                categoria.setNombre(nombreCategoria);
                categoria.setEstado(1);
                categoriaRepo.guardar(categoria);
                response.sendRedirect(request.getContextPath() + "/categorias");
            } catch (Exception e) {
                throw new ServletException("Error al guardar la categoría", e);
            }
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo obtener la conexión a la base de datos.");
        }
    }
}


