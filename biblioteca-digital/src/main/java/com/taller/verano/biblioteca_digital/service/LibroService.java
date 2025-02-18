package com.taller.verano.biblioteca_digital.service;

import com.taller.verano.biblioteca_digital.model.Libro;
import java.util.List;

public interface LibroService {
    List<Libro> listarLibros();
    Libro agregarLibro(Libro nuevoLibro);
    Libro modificarLibro(Integer id, Libro libroModificado);
}
