package models;

public class Categoria {
    private Long idCategoria;
    private String nombre;
    private Integer estado;

    public Categoria() {
        this.estado = 1; // Por defecto, el estado será activo (1)
    }

    public Categoria(Long idCategoria, String nombre, Integer estado) {
        this.idCategoria = idCategoria;
        this.nombre = nombre;
        this.estado = estado != null ? estado : 1; // Estado por defecto si no se proporciona
    }

    public Long getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(Long idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Integer getEstado() {
        return estado;
    }

    public void setEstado(Integer estado) {
        this.estado = estado;
    }
}

