package models;

public class Productos {
    private Long idProducto;
    private String nombre;
    private Categoria categoria;
    private double precio;
    private int cantidad; // Nuevo atributo cantidad

    public Productos() {}

    public Productos(Long idProducto, String nombre, Categoria categoria, double precio, int cantidad) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.categoria = categoria;
        this.precio = precio;
        this.cantidad = cantidad;
    }

    public Long getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(Long idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Categoria getCategoria() {
        return categoria;
    }

    public void setCategoria(Categoria categoria) {
        this.categoria = categoria;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getCantidad() {  // Nuevo getter
        return cantidad;
    }

    public void setCantidad(int cantidad) {  // Nuevo setter
        this.cantidad = cantidad;
    }
}


