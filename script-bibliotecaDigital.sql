-- Script para crear las tablas del sistema de Biblioteca Digital

-- Tabla de Roles
CREATE TABLE Rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de Usuarios
CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    contrasena VARCHAR(255) NOT NULL,
    rol_id INT,
    FOREIGN KEY (rol_id) REFERENCES Rol(id)
);

-- Tabla de Libros
CREATE TABLE Libro (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(100) NOT NULL
);

-- Tabla de Categorías
CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

-- Tabla de relación muchos a muchos entre Libro y Categoría
CREATE TABLE Libro_Categoria (
    libro_id INT,
    categoria_id INT,
    PRIMARY KEY (libro_id, categoria_id),
    FOREIGN KEY (libro_id) REFERENCES Libro(id),
    FOREIGN KEY (categoria_id) REFERENCES Categoria(id)
);

-- Tabla de Favoritos
CREATE TABLE Favorito (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    libro_id INT,
    FOREIGN KEY (usuario_id) REFERENCES Usuario(id),
    FOREIGN KEY (libro_id) REFERENCES Libro(id)
);

-- Poblar la tabla de Roles
INSERT INTO Rol (nombre) VALUES ('BIBLIOTECARIO');
INSERT INTO Rol (nombre) VALUES ('USER');

-- Poblar la tabla de Usuarios
INSERT INTO Usuario (nombre, email, contrasena, rol_id) VALUES ('Bibliotecario', 'admin@biblioteca.com', 'admin123', 1);
INSERT INTO Usuario (nombre, email, contrasena, rol_id) VALUES ('Juan Perez', 'juan@biblioteca.com', 'juan123', 2);

-- Poblar la tabla de Libros
INSERT INTO Libro (titulo, autor) VALUES ('El Quijote', 'Miguel de Cervantes');
INSERT INTO Libro (titulo, autor) VALUES ('Cien años de soledad', 'Gabriel García Márquez');
INSERT INTO Libro (titulo, autor) VALUES ('Don Juan Tenorio', 'José Zorrilla');

-- Poblar la tabla de Categorías
INSERT INTO Categoria (nombre) VALUES ('Ficción');
INSERT INTO Categoria (nombre) VALUES ('Clásicos');
INSERT INTO Categoria (nombre) VALUES ('Drama');

-- Relación entre libros y categorías
INSERT INTO Libro_Categoria (libro_id, categoria_id) VALUES (1, 2); -- El Quijote es Clásico
INSERT INTO Libro_Categoria (libro_id, categoria_id) VALUES (2, 1); -- Cien años de soledad es Ficción
INSERT INTO Libro_Categoria (libro_id, categoria_id) VALUES (3, 3); -- Don Juan Tenorio es Drama

-- Poblar la tabla de Favoritos (Juan marca "El Quijote" como favorito)
INSERT INTO Favorito (usuario_id, libro_id) VALUES (2, 1);

-- Consulta para verificar
SELECT * FROM Usuario;
SELECT * FROM Libro;
SELECT * FROM Categoria;
SELECT * FROM Libro_Categoria;
SELECT * FROM Favorito;