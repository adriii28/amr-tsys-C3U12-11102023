CREATE DATABASE Biblioteca_v2;
USE Biblioteca_v2;

CREATE TABLE Socio (
  dni varchar(9) PRIMARY KEY,
  codigo_socio varchar(50) NOT NULL UNIQUE,
  direccion varchar(150) NOT NULL,
  nombre varchar(50) NOT NULL,
  apellidos varchar(150) NOT NULL,
  telefono int
);


CREATE TABLE Autor (
  nombre varchar(50) PRIMARY KEY,
  apellidos varchar(150),
  pais varchar(50)
);


CREATE TABLE Deterioro (
  id int auto_increment PRIMARY KEY,
  comentario varchar(255)
);


CREATE TABLE Articulo (
  id int auto_increment PRIMARY KEY,
  nombre varchar(255) UNIQUE NOT NULL,
  resumen varchar(255),
  anio int  NOT NULL,
  nombre_autor varchar(255)  NOT NULL,
  id_deterioro int,
  FOREIGN KEY (nombre_autor) REFERENCES Autor (nombre) on delete cascade on update cascade,
  FOREIGN KEY (id_deterioro) REFERENCES Deterioro (id) on delete cascade on update cascade
);

CREATE TABLE Libro (
  id_articulo int NOT NULL,
  num_paginas int NOT NULL,
  FOREIGN KEY (id_articulo) REFERENCES Articulo (id) on delete cascade on update cascade
);


CREATE TABLE Cd (
  id_articulo int auto_increment PRIMARY KEY,
  num_canciones int NOT NULL,
  FOREIGN KEY (id_articulo) REFERENCES Articulo (id) on delete cascade on update cascade 
);

CREATE TABLE Pelicula (
  id_articulo int auto_increment PRIMARY KEY ,
  duracion int NOT NULL,
  FOREIGN KEY (id_articulo) REFERENCES Articulo (id) on delete cascade on update cascade
);


CREATE TABLE Prestamo (
  id int auto_increment PRIMARY KEY,
  fecha_prestado date,
  fecha_devolucion_real date,
  fecha_tope date  NOT NULL,
  dni_socio varchar(9) NOT NULL,
  id_articulo int NOT NULL,
  FOREIGN KEY (id_articulo) REFERENCES Articulo (id) on delete cascade on update cascade ,
  FOREIGN KEY (dni_socio) REFERENCES Socio (dni) on delete cascade on update cascade ,
  CHECK (fecha_prestado <= fecha_tope )
);

-- -----------------------------------INSERTS------------------------------------------------
-- Insertar socio 1
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('123456789', 'CS001', 'Calle Principal 123', 'Juan', 'Pérez', 123456789);

-- Insertar socio 2
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('987654321', 'CS002', 'Avenida Secundaria 456', 'María', 'Gómez', 987654321);

-- Insertar socio 3
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('555555555', 'CS003', 'Calle Nueva 789', 'Luis', 'Rodríguez', 555555555);

-- Insertar socio 4
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('999888777', 'CS004', 'Avenida Principal 001', 'Ana', 'Martínez', 999888777);

-- Insertar socio 5
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('111222333', 'CS005', 'Calle Secundaria 234', 'Carlos', 'López', 111222333);

-- Insertar socio 6
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('222333444', 'CS006', 'Avenida Nueva 567', 'Laura', 'García', 222333444);

-- Insertar socio 7
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('333444555', 'CS007', 'Calle Principal 789', 'José', 'Ramírez', 333444555);

-- Insertar socio 8
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('444555666', 'CS008', 'Avenida Secundaria 890', 'Marta', 'Díaz', 444555666);

-- Insertar socio 9
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('555666777', 'CS009', 'Calle Nueva 123', 'Roberto', 'Sánchez', 555666777);

-- Insertar socio 10
INSERT INTO Socio (dni, codigo_socio, direccion, nombre, apellidos, telefono)
VALUES ('666777888', 'CS010', 'Avenida Principal 456', 'Sara', 'López', 666777888);

-- Insertar autor 1
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 1', 'Apellido 1', 'País 1');

-- Insertar autor 2
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 2', 'Apellido 2', 'País 2');

-- Insertar autor 3
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 3', 'Apellido 3', 'País 3');

-- Insertar autor 4
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 4', 'Apellido 4', 'País 4');

-- Insertar autor 5
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 5', 'Apellido 5', 'País 5');

-- Insertar autor 6
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 6', 'Apellido 6', 'País 6');

-- Insertar autor 7
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 7', 'Apellido 7', 'País 7');

-- Insertar autor 8
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 8', 'Apellido 8', 'País 8');

-- Insertar autor 9
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 9', 'Apellido 9', 'País 9');

-- Insertar autor 10
INSERT INTO Autor (nombre, apellidos, pais)
VALUES ('Autor 10', 'Apellido 10', 'País 10');

-- Insertar deterioro 1
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 1');

-- Insertar deterioro 2
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 2');

-- Insertar deterioro 3
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 3');

-- Insertar deterioro 4
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 4');

-- Insertar deterioro 5
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 5');

-- Insertar deterioro 6
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 6');

-- Insertar deterioro 7
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 7');

-- Insertar deterioro 8
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 8');

-- Insertar deterioro 9
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 9');

-- Insertar deterioro 10
INSERT INTO Deterioro (comentario)
VALUES ('Deterioro 10');

-- Insertar artículo 1
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 1', 'Resumen 1', 2020, 'Autor 1', 1);

-- Insertar artículo 2
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 2', 'Resumen 2', 2019, 'Autor 2', 2);

-- Insertar artículo 3
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 3', 'Resumen 3', 2018, 'Autor 3', 3);

-- Insertar artículo 4
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 4', 'Resumen 4', 2017, 'Autor 4', 4);

-- Insertar artículo 5
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 5', 'Resumen 5', 2016, 'Autor 5', 5);

-- Insertar artículo 6
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 6', 'Resumen 6', 2015, 'Autor 6', 6);

-- Insertar artículo 7
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 7', 'Resumen 7', 2014, 'Autor 7', 7);

-- Insertar artículo 8
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 8', 'Resumen 8', 2013, 'Autor 8', 8);

-- Insertar artículo 9
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 9', 'Resumen 9', 2012, 'Autor 9', 9);

-- Insertar artículo 10
INSERT INTO Articulo (nombre, resumen, anio, nombre_autor, id_deterioro)
VALUES ('Artículo 10', 'Resumen 10', 2011, 'Autor 10', 10);

-- Insertar libro 1
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (1, 200);

-- Insertar libro 2
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (2, 300);

-- Insertar libro 3
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (3, 250);

-- Insertar libro 4
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (4, 180);

-- Insertar libro 5
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (5, 220);

-- Insertar libro 6
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (6, 270);

-- Insertar libro 7
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (7, 240);

-- Insertar libro 8
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (8, 320);

-- Insertar libro 9
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (9, 280);

-- Insertar libro 10
INSERT INTO Libro (id_articulo, num_paginas)
VALUES (10, 260);

-- Insertar CD 1
INSERT INTO Cd (num_canciones)
VALUES (12);

-- Insertar CD 2
INSERT INTO Cd (num_canciones)
VALUES (15);

-- Insertar CD 3
INSERT INTO Cd (num_canciones)
VALUES (10);

-- Insertar CD 4
INSERT INTO Cd (num_canciones)
VALUES (14);

-- Insertar CD 5
INSERT INTO Cd (num_canciones)
VALUES (11);

-- Insertar CD 6
INSERT INTO Cd (num_canciones)
VALUES (13);

-- Insertar CD 7
INSERT INTO Cd (num_canciones)
VALUES (16);

-- Insertar CD 8
INSERT INTO Cd (num_canciones)
VALUES (9);

-- Insertar CD 9
INSERT INTO Cd (num_canciones)
VALUES (17);

-- Insertar CD 10
INSERT INTO Cd (num_canciones)
VALUES (8);

-- Insertar película 1
INSERT INTO Pelicula (duracion)
VALUES (120);

-- Insertar película 2
INSERT INTO Pelicula (duracion)
VALUES (135);

-- Insertar película 3
INSERT INTO Pelicula (duracion)
VALUES (110);

-- Insertar película 4
INSERT INTO Pelicula (duracion)
VALUES (140);

-- Insertar película 5
INSERT INTO Pelicula (duracion)
VALUES (125);

-- Insertar película 6
INSERT INTO Pelicula (duracion)
VALUES (130);

-- Insertar película 7
INSERT INTO Pelicula (duracion)
VALUES (145);

-- Insertar película 8
INSERT INTO Pelicula (duracion)
VALUES (100);

-- Insertar película 9
INSERT INTO Pelicula (duracion)
VALUES (150);

-- Insertar película 10
INSERT INTO Pelicula (duracion)
VALUES (95);

-- Insertar préstamo 1
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-10-01', '2023-10-15', '2023-10-20', '123456789', 1);

-- Insertar préstamo 2
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-09-15', '2023-09-30', '2023-10-05', '987654321', 2);

-- Insertar préstamo 3
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-08-30', '2023-09-10', '2023-09-15', '555555555', 3);

-- Insertar préstamo 4
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-08-15', '2023-08-25', '2023-08-30', '999888777', 4);

-- Insertar préstamo 5
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-07-30', '2023-08-05', '2023-08-10', '111222333', 5);

-- Insertar préstamo 6
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-07-15', '2023-07-25', '2023-07-30', '222333444', 6);

-- Insertar préstamo 7
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-06-30', '2023-07-10', '2023-07-15', '333444555', 7);

-- Insertar préstamo 8
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-06-15', '2023-06-20', '2023-06-25', '444555666', 8);

-- Insertar préstamo 9
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-05-30', '2023-06-05', '2023-06-10', '555666777', 9);

-- Insertar préstamo 10
INSERT INTO Prestamo (fecha_prestado, fecha_devolucion_real, fecha_tope, dni_socio, id_articulo)
VALUES ('2023-05-15', '2023-05-18', '2023-05-20', '666777888', 10);

-- -----------------------------------UPDATES------------------------------------------------
-- Actualizar el teléfono del socio con dni '123456789'
UPDATE Socio
SET telefono = 555555555
WHERE dni = '123456789';

-- Actualizar la dirección del socio con dni '987654321'
UPDATE Socio
SET direccion = 'Nueva Calle 789'
WHERE dni = '987654321';

-- Actualizar el país del autor 'Autor 1'
UPDATE Autor
SET pais = 'Nuevo País 1'
WHERE nombre = 'Autor 1';

-- Actualizar los apellidos del autor 'Autor 2'
UPDATE Autor
SET apellidos = 'Nuevos Apellidos 2'
WHERE nombre = 'Autor 2';

-- Actualizar el comentario del deterioro 1
UPDATE Deterioro
SET comentario = 'Nuevo Comentario 1'
WHERE id = 1;

-- Actualizar el comentario del deterioro 2
UPDATE Deterioro
SET comentario = 'Nuevo Comentario 2'
WHERE id = 2;

-- Actualizar el resumen del artículo 'Artículo 1'
UPDATE Articulo
SET resumen = 'Nuevo Resumen 1'
WHERE nombre = 'Artículo 1';

-- Actualizar el autor del artículo 'Artículo 2'
UPDATE Articulo
SET nombre_autor = 'Autor Actualizado 2'
WHERE nombre = 'Autor 2';

-- Actualizar el número de páginas del libro 1
UPDATE Libro
SET num_paginas = 250
WHERE id_articulo = 1;

-- Actualizar el número de páginas del libro 2
UPDATE Libro
SET num_paginas = 350
WHERE id_articulo = 2;

-- Actualizar el número de canciones del CD 1
UPDATE Cd
SET num_canciones = 14
WHERE id_articulo = 1;

-- Actualizar el número de canciones del CD 2
UPDATE Cd
SET num_canciones = 18
WHERE id_articulo = 2;

-- Actualizar la duración de la película 1
UPDATE Pelicula
SET duracion = 130
WHERE id_articulo = 1;

-- Actualizar la duración de la película 2
UPDATE Pelicula
SET duracion = 140
WHERE id_articulo = 2;

-- Actualizar la fecha de devolución real del préstamo 1
UPDATE Prestamo
SET fecha_devolucion_real = '2023-10-16'
WHERE id = 1;

-- Actualizar la fecha de devolución real del préstamo 2
UPDATE Prestamo
SET fecha_devolucion_real = '2023-10-01'
WHERE id = 2;

-- -----------------------------------DELETES------------------------------------------------
-- Eliminar el socio con dni '555666777'
DELETE FROM Socio
WHERE dni = '555666777';

-- Eliminar el socio con dni '444555666'
DELETE FROM Socio
WHERE dni = '444555666';

-- Eliminar el autor 'Autor 3'
DELETE FROM Autor
WHERE nombre = 'Autor 3';

-- Eliminar el autor 'Autor 4'
DELETE FROM Autor
WHERE nombre = 'Autor 4';

-- Eliminar el deterioro 3
DELETE FROM Deterioro
WHERE id = 3;

-- Eliminar el deterioro 4
DELETE FROM Deterioro
WHERE id = 4;

-- Eliminar el artículo 'Artículo 3'
DELETE FROM Articulo
WHERE nombre = 'Artículo 3';

-- Eliminar el artículo 'Artículo 4'
DELETE FROM Articulo
WHERE nombre = 'Artículo 4';

-- Eliminar el libro asociado al artículo 3
DELETE FROM Libro
WHERE id_articulo = 3;

-- Eliminar el libro asociado al artículo 4
DELETE FROM Libro
WHERE id_articulo = 4;

-- Eliminar el CD asociado al artículo 3
DELETE FROM Cd
WHERE id_articulo = 3;

-- Eliminar el CD asociado al artículo 4
DELETE FROM Cd
WHERE id_articulo = 4;

-- Eliminar la película asociada al artículo 3
DELETE FROM Pelicula
WHERE id_articulo = 3;

-- Eliminar la película asociada al artículo 4
DELETE FROM Pelicula
WHERE id_articulo = 4;

-- Eliminar el préstamo 3
DELETE FROM Prestamo
WHERE id = 3;

-- Eliminar el préstamo 4
DELETE FROM Prestamo
WHERE id = 4;
