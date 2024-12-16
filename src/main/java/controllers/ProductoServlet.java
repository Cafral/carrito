package controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import models.Productos;
import service.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;
import java.util.Optional;

@WebServlet("/productos")
public class ProductoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        Connection conn = (Connection) req.getAttribute("conn");
        ProductoService service = new ProductoServiceJdbcImplement(conn);

        try {
            if ("aumentar".equals(accion)) {
                Long id = Long.parseLong(req.getParameter("id"));
                service.actualizarCantidad(id, 1);
                resp.sendRedirect(req.getContextPath() + "/productos");
            } else if ("disminuir".equals(accion)) {
                Long id = Long.parseLong(req.getParameter("id"));
                service.actualizarCantidad(id, -1);
                resp.sendRedirect(req.getContextPath() + "/productos");
            } else if ("eliminar".equals(accion)) {
                Long id = Long.parseLong(req.getParameter("id"));
                req.setAttribute("idProducto", id);
                getServletContext().getRequestDispatcher("/confirmarEliminar.jsp").forward(req, resp);
            } else {
                // Listar productos
                List<Productos> productos = service.listar();
                LoginService auth = new LoginServiceSessionImplement();
                Optional<String> usernameOptional = auth.getUsername(req);

                req.setAttribute("productos", productos);
                req.setAttribute("username", usernameOptional);

                getServletContext().getRequestDispatcher("/listar.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            throw new ServletException("Error al procesar la solicitud de productos", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        Connection conn = (Connection) req.getAttribute("conn");
        ProductoService service = new ProductoServiceJdbcImplement(conn);

        try {
            if ("confirmarEliminar".equals(accion)) {
                Long id = Long.parseLong(req.getParameter("idProducto"));
                service.eliminar(id);
                resp.sendRedirect(req.getContextPath() + "/productos");
            }
        } catch (Exception e) {
            throw new ServletException("Error al confirmar la eliminación del producto", e);
        }
    }
}


