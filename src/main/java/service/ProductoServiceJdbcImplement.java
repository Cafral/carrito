package service;

import models.Categoria;
import models.Productos;
import repositories.CategoriaRepositoryJdbcImplement;
import repositories.ProductoRepositoryJdbcImplement;
import repositories.Repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

public class ProductoServiceJdbcImplement implements ProductoService {
    private Repository<Productos> repositoryJdbc;
    private Repository<Categoria> repositoryCategoriaJdbc;

    public ProductoServiceJdbcImplement(Connection connection) {
        this.repositoryJdbc = new ProductoRepositoryJdbcImplement(connection);
        this.repositoryCategoriaJdbc = new CategoriaRepositoryJdbcImplement(connection);
    }

    @Override
    public List<Productos> listar() {
        try {
            return repositoryJdbc.listar();
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public Optional<Productos> agregarPorId(Long idProducto) {
        try {
            return Optional.ofNullable(repositoryJdbc.porId(idProducto));
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public void guardar(Productos producto) {
        try {
            repositoryJdbc.guardar(producto);
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public void eliminar(Long id) {
        try {
            repositoryJdbc.eliminar(id);
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public List<Categoria> listarCategorias() {
        try {
            return repositoryCategoriaJdbc.listar();
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public void actualizarCantidad(Long idProducto, int cantidad) {
        try {
            ((ProductoRepositoryJdbcImplement) repositoryJdbc).actualizarCantidad(idProducto, cantidad);
        } catch (SQLException throwables) {
            throw new ServiceJdbcException(throwables.getMessage(), throwables.getCause());
        }
    }

    @Override
    public Optional<Categoria> agregarPorIdCate(Long idCategoria) {
        String sql = "SELECT * FROM categoria WHERE idCategoria = ?";
        Connection conn = null;
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setLong(1, idCategoria);
            ResultSet resultSet = stmt.executeQuery();

            // Verificar si el resultado tiene filas
            if (resultSet.next()) {
                Categoria categoria = new Categoria();
                categoria.setIdCategoria(resultSet.getLong("idCategoria"));
                categoria.setNombre(resultSet.getString("nombre"));
                categoria.setEstado(resultSet.getInt("estado"));
                return Optional.of(categoria); // Devolver la categoría encontrada
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al buscar categoría por ID", e);
        }
        return Optional.empty(); // Devolver vacío si no se encuentra nada
    }
}

