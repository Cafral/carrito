package repositories;

import models.Categoria;
import models.Productos;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoRepositoryJdbcImplement implements Repository<Productos> {
    private Connection conn;

    public ProductoRepositoryJdbcImplement(Connection conn) {
        this.conn = conn;
    }

    @Override
    public List<Productos> listar() throws SQLException {
        List<Productos> productos = new ArrayList<>();
        try (Statement stat = conn.createStatement();
             ResultSet rs = stat.executeQuery("SELECT p.*, c.nombre as categoria FROM producto as p " +
                     "INNER JOIN categoria as c ON (p.idcategoria = c.idcategoria) ORDER BY p.idproducto ASC")) {
            while (rs.next()) {
                Productos p = getProductos(rs);
                productos.add(p);
            }
        }
        return productos;
    }

    @Override
    public Productos porId(Long idProducto) throws SQLException {
        Productos productos = null;
        try (PreparedStatement stnt = conn.prepareStatement("SELECT p.*, c.nombre as categoria FROM " +
                "producto as p INNER JOIN categoria as c ON(p.idcategoria=c.idcategoria) WHERE p.idproducto=?")) {
            stnt.setLong(1, idProducto);
            try (ResultSet rs = stnt.executeQuery()) {
                if (rs.next()) {
                    productos = getProductos(rs);
                }
            }
        }
        return productos;
    }

    @Override
    public void guardar(Productos productos) throws SQLException {
        String sql;
        if (productos.getIdProducto() != null && productos.getIdProducto() > 0) {
            sql = "UPDATE producto SET idcategoria=?, nombre=?, precio=?, cantidad=? WHERE idproducto=?";
        } else {
            sql = "INSERT INTO producto(idcategoria, nombre, precio, cantidad) VALUES(?, ?, ?, ?)";
        }
        try (PreparedStatement stnt = conn.prepareStatement(sql)) {
            stnt.setLong(1, productos.getCategoria().getIdCategoria());
            stnt.setString(2, productos.getNombre());
            stnt.setDouble(3, productos.getPrecio());
            stnt.setInt(4, productos.getCantidad());

            if (productos.getIdProducto() != null && productos.getIdProducto() > 0) {
                stnt.setLong(5, productos.getIdProducto());
            }
            stnt.executeUpdate();
        }
    }

    public void actualizarCantidad(Long idProducto, int cantidad) throws SQLException {
        String sql = "UPDATE producto SET cantidad = cantidad + ? WHERE idproducto = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, cantidad);
            stmt.setLong(2, idProducto);
            stmt.executeUpdate();
        }
    }

    @Override
    public void eliminar(Long idProducto) throws SQLException {
        String sql = "DELETE FROM producto WHERE idproducto=?";
        try (PreparedStatement stnt = conn.prepareStatement(sql)) {
            stnt.setLong(1, idProducto);
            stnt.executeUpdate();
        }
    }

    private static Productos getProductos(ResultSet rs) throws SQLException {
        Productos p = new Productos();
        p.setIdProducto(rs.getLong("idproducto"));
        p.setNombre(rs.getString("nombre"));
        p.setPrecio(rs.getDouble("precio"));
        p.setCantidad(rs.getInt("cantidad"));
        Categoria c = new Categoria();
        c.setIdCategoria(rs.getLong("idcategoria"));
        c.setNombre(rs.getString("categoria"));
        p.setCategoria(c);
        return p;
    }
}

