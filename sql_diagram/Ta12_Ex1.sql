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

-- -----------------------------------INSERTS------------------------------------------------

INSERT INTO Autores (nombre) VALUES
('Autor 1'),
('Autor 2'),
('Autor 3'),
('Autor 4'),
('Autor 5');

INSERT INTO Libros (isbn, editorial, año_escritura, titulo) VALUES
('1234567890123', 'Editorial 1', 2023, 'Libro 1'),
('2345678901234', 'Editorial 2', 2020, 'Libro 2'),
('3456789012345', 'Editorial 3', 2022, 'Libro 3'),
('4567890123456', 'Editorial 4', 2021, 'Libro 4'),
('5678901234567', 'Editorial 5', 2019, 'Libro 5');

INSERT INTO escribir (id_autores, isbn_libros) VALUES
(1, '1234567890123'),
(2, '1234567890123'),
(3, '2345678901234'),
(4, '2345678901234'),
(5, '3456789012345');

INSERT INTO Volumenes (deteriorado, isbn_libro) VALUES
(0, '1234567890123'),
(1, '2345678901234'),
(0, '3456789012345'),
(1, '4567890123456'),
(0, '5678901234567');

INSERT INTO Personas (DNI, cod_socio, telefono, dirección, apellidos, nombre) VALUES
('123456789', 1, '123-456-789', 'Calle 1', 'Apellido 1', 'Nombre 1'),
('234567890', 2, '234-567-890', 'Calle 2', 'Apellido 2', 'Nombre 2'),
('345678901', 3, '345-678-901', 'Calle 3', 'Apellido 3', 'Nombre 3'),
('456789012', 4, '456-789-012', 'Calle 4', 'Apellido 4', 'Nombre 4'),
('567890123', 5, '567-890-123', 'Calle 5', 'Apellido 5', 'Nombre 5');

INSERT INTO Prestamos (fecha_real, fecha_prestamo, dni_personas) VALUES
('2023-10-19', '2023-10-18', '123456789'),
('2023-10-20', '2023-10-19', '234567890'),
('2023-10-21', '2023-10-20', '345678901'),
('2023-10-22', '2023-10-21', '456789012'),
('2023-10-23', '2023-10-22', '567890123');

-- -----------------------------------UPDATES------------------------------------------------
UPDATE Autores SET nombre = 'Nuevo Nombre 1' WHERE id = 1;
UPDATE Autores SET nombre = 'Nuevo Nombre 2' WHERE id = 2;
UPDATE Autores SET nombre = 'Nuevo Nombre 3' WHERE id = 3;

UPDATE Libros SET año_escritura = 2024 WHERE isbn = '1234567890123';
UPDATE Libros SET año_escritura = 2025 WHERE isbn = '2345678901234';
UPDATE Libros SET año_escritura = 2026 WHERE isbn = '3456789012345';

UPDATE Personas SET telefono = '987-654-321' WHERE DNI = '123456789' AND cod_socio = 1;
UPDATE Personas SET telefono = '876-543-210' WHERE DNI = '234567890' AND cod_socio = 2;
UPDATE Personas SET telefono = '765-432-109' WHERE DNI = '345678901' AND cod_socio = 3;

UPDATE escribir SET id_autores = 1 WHERE isbn_libros = '2345678901234';
UPDATE escribir SET id_autores = 2 WHERE isbn_libros = '3456789012345';

UPDATE Volumenes SET deteriorado = 1 WHERE id = 1;
UPDATE Volumenes SET deteriorado = 0 WHERE id = 2;

UPDATE Prestamos SET fecha_real = '2023-10-23' WHERE id = 3;
UPDATE Prestamos SET fecha_prestamo = '2023-10-22' WHERE id = 4;
UPDATE Prestamos SET dni_personas = '666666666' WHERE id = 5;


-- -----------------------------------DELETES------------------------------------------------

DELETE FROM Autores WHERE id = 4;
DELETE FROM Autores WHERE id = 5;

DELETE FROM Libros WHERE isbn = '4567890123456';
DELETE FROM Libros WHERE isbn = '5678901234567';

DELETE FROM Personas WHERE DNI = '456789012' AND cod_socio = 4;
DELETE FROM Personas WHERE DNI = '567890123' AND cod_socio = 5;

DELETE FROM escribir WHERE id_autores = 4 AND isbn_libros = '2345678901234';
DELETE FROM escribir WHERE id_autores = 5 AND isbn_libros = '3456789012345';

DELETE FROM Volumenes WHERE id = 4;
DELETE FROM Volumenes WHERE id = 5;

DELETE FROM Prestamos WHERE id = 1;
DELETE FROM Prestamos WHERE id = 2;
