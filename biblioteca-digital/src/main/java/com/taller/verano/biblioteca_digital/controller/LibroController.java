package com.taller.verano.biblioteca_digital.controller;

import com.taller.verano.biblioteca_digital.model.Libro;
import com.taller.verano.biblioteca_digital.service.LibroService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.lang.RuntimeException;

import java.util.List;

@RestController
@RequestMapping("/api/libros")
public class LibroController {

    private final LibroService libroService;

    public LibroController(LibroService libroService) {
        this.libroService = libroService;
    }

    @GetMapping
    public List<Libro> listarLibros() {
        return libroService.listarLibros();
    }

    @PostMapping
    public ResponseEntity<Libro> agregarLibro(@RequestBody Libro libro) {
        Libro nuevoLibro = libroService.agregarLibro(libro);
        return new ResponseEntity<>(nuevoLibro, HttpStatus.CREATED);
    }

    @PutMapping("{id}")
    public ResponseEntity<?> modificarLibro(@PathVariable Integer id, @RequestBody Libro libroExistente) {
        try{
            Libro libro = libroService.modificarLibro(id, libroExistente);
            return ResponseEntity.ok(libro);
        }
        catch (RuntimeException e){
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Error: " + e.getMessage());
        }
    }

}
