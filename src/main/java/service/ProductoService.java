package service;

import models.Categoria;
import models.Productos;

import java.util.List;
import java.util.Optional;

public interface ProductoService {
    List<Productos> listar();
    // Método para buscar producto por ID
    Optional<Productos> agregarPorId(Long idProducto);
    // Métodos guardar y eliminar
    void guardar(Productos producto);
    void eliminar(Long id);
    // Listar categorías
    List<Categoria> listarCategorias();
    Optional<Categoria> buscarPorIdCategoria(Long idCategoria);
    // Método para actualizar cantidad de producto
    void actualizarCantidad(Long idProducto, int cantidad);
}

