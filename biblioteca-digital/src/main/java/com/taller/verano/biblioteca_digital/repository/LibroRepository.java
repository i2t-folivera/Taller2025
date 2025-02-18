package com.taller.verano.biblioteca_digital.repository;

import com.taller.verano.biblioteca_digital.model.Libro;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface LibroRepository extends JpaRepository<Libro, Integer> {
}
