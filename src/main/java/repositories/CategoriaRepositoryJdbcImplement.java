package repositories;

import models.Categoria;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoriaRepositoryJdbcImplement implements Repository<Categoria> {
    private Connection conn;

    public CategoriaRepositoryJdbcImplement(Connection conn) {
        this.conn = conn;
    }

    @Override
    public Categoria porId(Long idCategoria) throws SQLException {
        Categoria categoria = null;
        try (PreparedStatement stmt = conn.prepareStatement(
                "SELECT * FROM categoria WHERE idcategoria = ?")) {
            stmt.setLong(1, idCategoria);
            try (ResultSet rs = stmt.executeQuery()) {
                categoria = getCategoria(rs);
            }
        }
        return categoria;
    }

    @Override
    public List<Categoria> listar() throws SQLException {
        List<Categoria> categorias = new ArrayList<>();
        try (Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM categoria")) {
            while (rs.next()) {
                Categoria c = getCategoria(rs);
                categorias.add(c);
            }
        }
        return categorias;
    }

    @Override
    public void guardar(Categoria categoria) throws SQLException {
        String sql;
        if (categoria.getIdCategoria() == null) {
            sql = "INSERT INTO categoria (nombre, estado) VALUES (?, 1)";
        } else {
            sql = "UPDATE categoria SET nombre = ?, estado = ? WHERE idcategoria = ?";
        }

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, categoria.getNombre());
            if (categoria.getIdCategoria() != null) {
                stmt.setInt(2, categoria.getEstado());
                stmt.setLong(3, categoria.getIdCategoria());
            }
            stmt.executeUpdate();
        }
    }

    public void actualizarEstado(Long id, int estado) throws SQLException {
        String sql = "UPDATE categoria SET estado = ? WHERE idcategoria = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, estado);
            stmt.setLong(2, id);
            stmt.executeUpdate();
        }
    }

    @Override
    public void eliminar(Long id) throws SQLException {
        actualizarEstado(id, 0); // Cambia el estado a inactivo en lugar de eliminar
    }

    private static Categoria getCategoria(ResultSet rs) throws SQLException {
        Categoria c = new Categoria();
        c.setIdCategoria(rs.getLong("idcategoria"));
        c.setNombre(rs.getString("nombre"));
        c.setEstado(rs.getInt("estado"));
        return c;
    }
}


