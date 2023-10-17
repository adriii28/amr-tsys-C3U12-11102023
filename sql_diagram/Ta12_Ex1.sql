CREATE DATABASE Prestamos; 
USE Prestamos;

CREATE TABLE Autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Libros (
    isbn CHAR(13) PRIMARY KEY,
    editorial VARCHAR(100) NOT NULL,
    año_escritura INT NOT NULL,
    titulo VARCHAR(100) NOT NULL
);

CREATE TABLE escribir (
    id_autores INT NOT NULL,
    isbn_libros CHAR(13) NOT NULL,
    PRIMARY KEY (id_autores, isbn_libros),
    FOREIGN KEY (id_autores) REFERENCES Autores(id) ON DELETE CASCADE,
    FOREIGN KEY (isbn_libros) REFERENCES Libros(isbn) ON DELETE CASCADE
);

CREATE TABLE Volumenes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    deteriorado BOOLEAN NOT NULL,
    isbn_libro CHAR(13) NOT NULL,
    FOREIGN KEY (isbn_libro) REFERENCES Libros(isbn) ON DELETE CASCADE
);

CREATE TABLE Personas (
    DNI CHAR(9),
    cod_socio INT NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    dirección VARCHAR(255) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (DNI,cod_socio)
);

CREATE TABLE Prestamos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_real DATE NOT NULL,
    fecha_prestamo DATE NOT NULL,
    dni_personas CHAR(9) NOT NULL,
    FOREIGN KEY (dni_personas) REFERENCES Personas(DNI) ON DELETE CASCADE
);