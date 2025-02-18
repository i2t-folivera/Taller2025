package com.taller.verano.biblioteca_digital.service.impl;

import com.taller.verano.biblioteca_digital.model.Libro;
import com.taller.verano.biblioteca_digital.repository.LibroRepository;
import com.taller.verano.biblioteca_digital.service.LibroService;
import org.springframework.stereotype.Service;
import java.lang.RuntimeException;


import java.util.List;
@Service
public class LibroServiceImpl implements LibroService {

    private final LibroRepository libroRepository;

    public LibroServiceImpl(LibroRepository libroRepository) {
        this.libroRepository = libroRepository;
    }

    @Override
    public List<Libro> listarLibros() {
        return libroRepository.findAll();
    }

    @Override
    public Libro agregarLibro(Libro libro) {
        return libroRepository.save(libro); 
    }

    @Override
    public Libro modificarLibro(Integer id, Libro libroModificado) {
        // Buscar el libro por su ID
        Libro libroExistente = libroRepository.findById(id).orElse(null);

        if (libroExistente == null) {
            throw new RuntimeException("El libro con ID " + id + " no existe.");
        }

        libroExistente.setTitulo(libroModificado.getTitulo());
        libroExistente.setAutor(libroModificado.getAutor());

        return libroRepository.save(libroExistente);
    }
}
