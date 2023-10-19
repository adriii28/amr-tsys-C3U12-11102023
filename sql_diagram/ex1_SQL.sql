CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Persona (
  dni varchar(9) PRIMARY KEY,
  codigo_socio varchar(6) UNIQUE NOT NULL,
  telefono int,
  direccion varchar(255)  NOT NULL,
  nombre varchar(50) NOT NULL,
  apellidos varchar(125) NOT NULL
);

CREATE TABLE Volumen (
  id varchar(50) PRIMARY KEY,
  deteriorado varchar (200)
);

CREATE TABLE Libro (
  isbn varchar(15) PRIMARY KEY,
  editorial varchar(50) NOT NULL,
  anio_escritura INT NOT NULL,
  titulo varchar(120) NOT NULL,
  autor varchar(60) NOT NULL,
  anio_edicion INT NOT NULL,
  id_volumen varchar(50) NOT NULL,
  id_autor int NOT NULL,
  FOREIGN KEY (id_volumen) REFERENCES Volumen (id)  on delete cascade on update cascade,
  CHECK (anio_escritura  <= anio_edicion )
);

CREATE TABLE Prestamo (
  id int auto_increment PRIMARY KEY,
  fecha_inicio date NOT NULL,
  fecha_tope date NOT NULL,
  fecha_real_devolucion date ,
  dni_persona varchar(9) NOT NULL,
  isbn_libro varchar(15) NOT NULL,
  FOREIGN KEY (dni_persona) REFERENCES Persona (dni) on delete cascade on update cascade,
  FOREIGN KEY (isbn_libro) REFERENCES Libro (isbn) on delete cascade on update cascade,
  CHECK (fecha_tope  >= fecha_inicio )
);

CREATE DATABASE Biblioteca;
USE Biblioteca;

CREATE TABLE Persona (
  dni varchar(9) PRIMARY KEY,
  codigo_socio varchar(6) UNIQUE NOT NULL,
  telefono int,
  direccion varchar(255)  NOT NULL,
  nombre varchar(50) NOT NULL,
  apellidos varchar(125) NOT NULL
);

CREATE TABLE Volumen (
  id varchar(50) PRIMARY KEY,
  deteriorado varchar (200)
);

CREATE TABLE Libro (
  isbn varchar(15) PRIMARY KEY,
  editorial varchar(50) NOT NULL,
  anio_escritura INT NOT NULL,
  titulo varchar(120) NOT NULL,
  autor varchar(60) NOT NULL,
  anio_edicion INT NOT NULL,
  id_volumen varchar(50) NOT NULL,
  id_autor int NOT NULL,
  FOREIGN KEY (id_volumen) REFERENCES Volumen (id)  on delete cascade on update cascade,
  CHECK (anio_escritura  <= anio_edicion )
);

CREATE TABLE Prestamo (
  id int auto_increment PRIMARY KEY,
  fecha_inicio date NOT NULL,
  fecha_tope date NOT NULL,
  fecha_real_devolucion date ,
  dni_persona varchar(9) NOT NULL,
  isbn_libro varchar(15) NOT NULL,
  FOREIGN KEY (dni_persona) REFERENCES Persona (dni) on delete cascade on update cascade,
  FOREIGN KEY (isbn_libro) REFERENCES Libro (isbn) on delete cascade on update cascade,
  CHECK (fecha_tope  >= fecha_inicio )
);

-- -----------------------------------INSERTS------------------------------------------------

INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('12345678C', 'CS001', 1234567890, 'Calle Principal 123', 'Juan', 'Pérez');

-- Insertar persona 2
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('98765432X', 'CS002', 987754321, 'Avenida Secundaria 456', 'María', 'Gómez');

-- Insertar persona 3
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('55555555V', 'CS003', 557655556, 'Calle Nueva 789', 'Luis', 'Rodríguez');

-- Insertar persona 4
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('99988877R', 'CS004', 999888777, 'Avenida Principal 001', 'Ana', 'Martínez Chic');

-- Insertar persona 5
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('11122233D', 'CS005', 111222333, 'Calle Secundaria 234', 'Carlos', 'López Machuca');

-- Insertar persona 6
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('98767676D', 'CS006', 456456456, 'Calle Prat 45', 'Alfonso', 'Calvo Urge');

-- Insertar persona 7
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('987987987D', 'CS007', 897897897, 'Calle Urdangarin 11', 'Robert', 'Martinez Salva');

-- Insertar persona 8
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('48154612D', 'CS008', 098098089, 'Avenida Figueres 15', 'Manel', 'Cerezuela');

-- Insertar persona 9
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('11122233D', 'CS009', 101112131, 'Calle Avuador', 'Adrian', 'Castello');

-- Insertar persona 10
INSERT INTO Persona (dni, codigo_socio, telefono, direccion, nombre, apellidos) 
VALUES ('11122233D', 'CS0010', 111222333, 'Calle Amarillo', 'Olga', 'Mateo');

-- Insertar volumen 1
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL001', 'Algunos daños menores');

-- Insertar volumen 2
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL002', 'En buen estado');

-- Insertar volumen 3
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL003', 'Necesita reparación');

-- Insertar volumen 4
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL004', 'Sin daños aparentes');

-- Insertar volumen 5
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL005', 'Desgaste en la cubierta');

-- Insertar volumen 6
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL006', 'Algunos daños menores');

-- Insertar volumen 7
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL007', 'En buen estado');

-- Insertar volumen 8
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL008', 'Algunos daños menores');

-- Insertar volumen 9
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL009', 'Desgaste en la cubierta');

-- Insertar volumen 10
INSERT INTO Volumen (id, deteriorado) 
VALUES ('VOL0010', 'Necesita reparación');

-- Insertar libro 1
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN001', 'Editorial A', 2000, 'Libro 1', 'Autor 1', 2005, 'VOL001', 1);

-- Insertar libro 2
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN002', 'Editorial B', 2010, 'Libro 2', 'Autor 2', 2015, 'VOL002', 2);

-- Insertar libro 3
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN003', 'Editorial A', 2005, 'Libro 3', 'Autor 3', 2010, 'VOL003', 3);

-- Insertar libro 4
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN004', 'Editorial C', 1995, 'Libro 4', 'Autor 1', 2000, 'VOL002', 1);

-- Insertar libro 5
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN005', 'Editorial B', 2015, 'Libro 5', 'Autor 4', 2020, 'VOL003', 4);

-- Insertar libro 6
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN006', 'Editorial F', 2000, 'Libro 6', 'Autor 6', 2005, 'VOL004', 7);

-- Insertar libro 7
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN007', 'Editorial G', 2004, 'Libro 7', 'Autor 5', 2005, 'VOL006', 6);

-- Insertar libro 8
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN008', 'Editorial H', 2002, 'Libro 8', 'Autor 9', 2005, 'VOL008', 9);

-- Insertar libro 9
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN009', 'Editorial J', 2001, 'Libro 9', 'Autor 10', 2005, 'VOL009', 4);

-- Insertar libro 10
INSERT INTO Libro (isbn, editorial, anio_escritura, titulo, autor, anio_edicion, id_volumen, id_autor)
VALUES ('ISBN0010', 'Editorial L', 2013, 'Libro 10', 'Autor 11', 2005, 'VOL0012', 8);


-- Insertar préstamo 1
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-01', '2023-10-15', NULL, '12345678C', 'ISBN001');

-- Insertar préstamo 2
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-09-15', '2023-09-30', '2023-09-25', '987654321', 'ISBN002');

-- Insertar préstamo 3
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-05', '2023-10-20', NULL, '555555555', 'ISBN003');

-- Insertar préstamo 4
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-09-20', '2023-10-05', NULL, '123456789', 'ISBN004');

-- Insertar préstamo 5
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-10', '2023-10-25', NULL, '987654321', 'ISBN005');

-- Insertar préstamo 6
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-11', '2023-10-26', NULL, '987654321', 'ISBN006');

-- Insertar préstamo 7
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-12', '2023-11-27', NULL, '48154612D', 'ISBN007');

-- Insertar préstamo 8
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-13', '2023-12-28', NULL, '987654321', 'ISBN008');

-- Insertar préstamo 9
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-14', '2023-10-29', NULL, '48154612D', 'ISBN009');

-- Insertar préstamo 10
INSERT INTO Prestamo (fecha_inicio, fecha_tope, fecha_real_devolucion, dni_persona, isbn_libro)
VALUES ('2023-10-15', '2023-12-31', NULL, '987987987D', 'ISBN0010');

-- -----------------------------------UPDATES------------------------------------------------

-- 1. Actualizar el teléfono de la persona con dni '12345678C':
UPDATE Persona
SET telefono = 987654321
WHERE dni = '12345678C';

-- 2. Actualizar la dirección de la persona con dni '98765432X':
UPDATE Persona
SET direccion = 'Avenida Principal 789'
WHERE dni = '98765432X';

-- 3. Actualizar el nombre de la persona con dni '55555555V':
UPDATE Persona
SET nombre = 'Marta'
WHERE dni = '55555555V';

-- 4. Actualizar el apellidos de la persona con dni '99988877R':
UPDATE Persona
SET apellidos = 'González Martínez'
WHERE dni = '99988877R';

-- 5. Actualizar el teléfono de la persona con dni '11122233D':
UPDATE Persona
SET telefono = 111111111
WHERE dni = '11122233D';

-- 6. Actualizar la dirección de la persona con dni '98767676D':
UPDATE Persona
SET direccion = 'Calle Barcelona 12'
WHERE dni = '98767676D';

-- 7. Actualizar el nombre de la persona con dni '987987987D':
UPDATE Persona
SET nombre = 'Laura'
WHERE dni = '987987987D';

-- 8. Actualizar el apellidos de la persona con dni '48154612D':
UPDATE Persona
SET apellidos = 'Pérez Gómez'
WHERE dni = '48154612D';

-- 9. Actualizar el teléfono de la persona con dni '11122233D':
UPDATE Persona
SET telefono = 222222222
WHERE dni = '11122233D';

-- 10. Actualizar la dirección de la persona con dni '11122233D':
UPDATE Persona
SET direccion = 'Calle Naranja 567'
WHERE dni = '11122233D';

-- 10 Updates para la tabla Volumen
-- 1. Actualizar el estado del volumen con id 'VOL001':
UPDATE Volumen
SET deteriorado = 'Necesita reparación severa'
WHERE id = 'VOL001';

-- 2. Actualizar el estado del volumen con id 'VOL002':
UPDATE Volumen
SET deteriorado = 'En buen estado'
WHERE id = 'VOL002';

-- 3. Actualizar el estado del volumen con id 'VOL003':
UPDATE Volumen
SET deteriorado = 'Muy deteriorado'
WHERE id = 'VOL003';

-- 4. Actualizar el estado del volumen con id 'VOL004':
UPDATE Volumen
SET deteriorado = 'Requiere restauración'
WHERE id = 'VOL004';

-- 5. Actualizar el estado del volumen con id 'VOL005':
UPDATE Volumen
SET deteriorado = 'Desgaste significativo'
WHERE id = 'VOL005';

-- 6. Actualizar el estado del volumen con id 'VOL006':
UPDATE Volumen
SET deteriorado = 'En proceso de restauración'
WHERE id = 'VOL006';

-- 7. Actualizar el estado del volumen con id 'VOL007':
UPDATE Volumen
SET deteriorado = 'Daños menores'
WHERE id = 'VOL007';

-- 8. Actualizar el estado del volumen con id 'VOL008':
UPDATE Volumen
SET deteriorado = 'En buen estado'
WHERE id = 'VOL008';

-- 9. Actualizar el estado del volumen con id 'VOL009':
UPDATE Volumen
SET deteriorado = 'Daños leves'
WHERE id = 'VOL009';

-- 10. Actualizar el estado del volumen con id 'VOL0010':
UPDATE Volumen
SET deteriorado = 'En reparación moderada'
WHERE id = 'VOL0010';

-- 10 Updates para la tabla Libro
-- 1. Actualizar el autor del libro con ISBN 'ISBN001':
UPDATE Libro
SET autor = 'Nuevo Autor 1'
WHERE isbn = 'ISBN001';

-- 2. Actualizar el año de edición del libro con ISBN 'ISBN002':
UPDATE Libro
SET anio_edicion = 2018
WHERE isbn = 'ISBN002';

-- 3. Actualizar la editorial del libro con ISBN 'ISBN003':
UPDATE Libro
SET editorial = 'Editorial D'
WHERE isbn = 'ISBN003';

-- 4. Actualizar el autor del libro con ISBN 'ISBN004':
UPDATE Libro
SET autor = 'Nuevo Autor 3'
WHERE isbn = 'ISBN004';

-- 5. Actualizar el año de edición del libro con ISBN 'ISBN005':
UPDATE Libro
SET anio_edicion = 2021
WHERE isbn = 'ISBN005';

-- 6. Actualizar la editorial del libro con ISBN 'ISBN006':
UPDATE Libro
SET editorial = 'Editorial X'
WHERE isbn = 'ISBN006';

-- 7. Actualizar el autor del libro con ISBN 'ISBN007':
UPDATE Libro
SET autor = 'Nuevo Autor 4'
WHERE isbn = 'ISBN007';

-- 8. Actualizar el año de edición del libro con ISBN 'ISBN008':
UPDATE Libro
SET anio_edicion = 2019
WHERE isbn = 'ISBN008';

-- 9. Actualizar la editorial del libro con ISBN 'ISBN009':
UPDATE Libro
SET editorial = 'Editorial Y'
WHERE isbn = 'ISBN009';

-- 10. Actualizar el autor del libro con ISBN 'ISBN0010':
UPDATE Libro
SET autor = 'Nuevo Autor 5'
WHERE isbn = 'ISBN0010';

-- 10 Updates para la tabla Prestamo
-- 1. Actualizar la fecha de inicio del préstamo con ID 1:
UPDATE Prestamo
SET fecha_inicio = '2023-10-05'
WHERE id = 1;

-- 2. Actualizar la fecha de tope del préstamo con ID 2:
UPDATE Prestamo
SET fecha_tope = '2023-09-28'
WHERE id = 2;

-- 3. Actualizar la fecha de inicio del préstamo con ID 3:
UPDATE Prestamo
SET fecha_inicio = '2023-10-10'
WHERE id = 3;

-- 4. Actualizar la fecha de tope del préstamo con ID 4:
UPDATE Prestamo
SET fecha_tope = '2023-10-15'
WHERE id = 4;

-- 5. Actualizar la fecha de inicio del préstamo con ID 5:
UPDATE Prestamo
SET fecha_inicio = '2023-10-11'
WHERE id = 5;

-- 6. Actualizar la fecha de tope del préstamo con ID 6:
UPDATE Prestamo
SET fecha_tope = '2023-10-27'
WHERE id = 6;

-- 7. Actualizar la fecha de inicio del préstamo con ID 7:
UPDATE Prestamo
SET fecha_inicio = '2023-10-14'
WHERE id = 7;

-- 8. Actualizar la fecha de tope del préstamo con ID 8:
UPDATE Prestamo
SET fecha_tope = '2023-12-15'
WHERE id = 8;

-- 9. Actualizar la fecha de inicio del préstamo con ID 9:
UPDATE Prestamo
SET fecha_inicio = '2023-10-18'
WHERE id = 9;

-- 10. Actualizar la fecha de tope del préstamo con ID 10:
UPDATE Prestamo
SET fecha_tope = '2023-12-15'
WHERE id = 10;


-- -----------------------------------DELETES------------------------------------------------
DELETE FROM Persona WHERE dni = '12345678C';

-- 2. Eliminar la persona con dni '98765432X':
DELETE FROM Persona WHERE dni = '98765432X';

-- 3. Eliminar la persona con dni '55555555V':
DELETE FROM Persona WHERE dni = '55555555V';

-- 4. Eliminar la persona con dni '99988877R':
DELETE FROM Persona WHERE dni = '99988877R';

-- 5. Eliminar la persona con dni '11122233D':
DELETE FROM Persona WHERE dni = '11122233D';

-- 6. Eliminar la persona con dni '98767676D':
DELETE FROM Persona WHERE dni = '98767676D';

-- 7. Eliminar la persona con dni '987987987D':
DELETE FROM Persona WHERE dni = '987987987D';

-- 8. Eliminar la persona con dni '48154612D':
DELETE FROM Persona WHERE dni = '48154612D';

-- 9. Eliminar la persona con dni '11122233D':
DELETE FROM Persona WHERE dni = '11122233D';

-- 10. Eliminar la persona con dni '11122233D':
DELETE FROM Persona WHERE dni = '11122233D';

-- 10 Deletes para la tabla Volumen
-- 1. Eliminar el volumen con id 'VOL001':
DELETE FROM Volumen WHERE id = 'VOL001';

-- 2. Eliminar el volumen con id 'VOL002':
DELETE FROM Volumen WHERE id = 'VOL002';

-- 3. Eliminar el volumen con id 'VOL003':
DELETE FROM Volumen WHERE id = 'VOL003';

-- 4. Eliminar el volumen con id 'VOL004':
DELETE FROM Volumen WHERE id = 'VOL004';

-- 5. Eliminar el volumen con id 'VOL005':
DELETE FROM Volumen WHERE id = 'VOL005';

-- 6. Eliminar el volumen con id 'VOL006':
DELETE FROM Volumen WHERE id = 'VOL006';

-- 7. Eliminar el volumen con id 'VOL007':
DELETE FROM Volumen WHERE id = 'VOL007';

-- 8. Eliminar el volumen con id 'VOL008':
DELETE FROM Volumen WHERE id = 'VOL008';

-- 9. Eliminar el volumen con id 'VOL009':
DELETE FROM Volumen WHERE id = 'VOL009';

-- 10. Eliminar el volumen con id 'VOL0010':
DELETE FROM Volumen WHERE id = 'VOL0010';

-- 10 Deletes para la tabla Libro
-- 1. Eliminar el libro con ISBN 'ISBN001':
DELETE FROM Libro WHERE isbn = 'ISBN001';

-- 2. Eliminar el libro con ISBN 'ISBN002':
DELETE FROM Libro WHERE isbn = 'ISBN002';

-- 3. Eliminar el libro con ISBN 'ISBN003':
DELETE FROM Libro WHERE isbn = 'ISBN003';

-- 4. Eliminar el libro con ISBN 'ISBN004':
DELETE FROM Libro WHERE isbn = 'ISBN004';

-- 5. Eliminar el libro con ISBN 'ISBN005':
DELETE FROM Libro WHERE isbn = 'ISBN005';

-- 6. Eliminar el libro con ISBN 'ISBN006':
DELETE FROM Libro WHERE isbn = 'ISBN006';

-- 7. Eliminar el libro con ISBN 'ISBN007':
DELETE FROM Libro WHERE isbn = 'ISBN007';

-- 8. Eliminar el libro con ISBN 'ISBN008':
DELETE FROM Libro WHERE isbn = 'ISBN008';

-- 9. Eliminar el libro con ISBN 'ISBN009':
DELETE FROM Libro WHERE isbn = 'ISBN009';

-- 10. Eliminar el libro con ISBN 'ISBN0010':
DELETE FROM Libro WHERE isbn = 'ISBN0010';

-- 10 Deletes para la tabla Prestamo
-- 1. Eliminar el préstamo con ID 1:
DELETE FROM Prestamo WHERE id = 1;

-- 2. Eliminar el préstamo con ID 2:
DELETE FROM Prestamo WHERE id = 2;

-- 3. Eliminar el préstamo con ID 3:
DELETE FROM Prestamo WHERE id = 3;

-- 4. Eliminar el préstamo con ID 4:
DELETE FROM Prestamo WHERE id = 4;

-- 5. Eliminar el préstamo con ID 5:
DELETE FROM Prestamo WHERE id = 5;

-- 6. Eliminar el préstamo con ID 6:
DELETE FROM Prestamo WHERE id = 6;

-- 7. Eliminar el préstamo con ID 7:
DELETE FROM Prestamo WHERE id = 7;

-- 8. Eliminar el préstamo con ID 8:
DELETE FROM Prestamo WHERE id = 8;

-- 9. Eliminar el préstamo con ID 9:
DELETE FROM Prestamo WHERE id = 9;

-- 10. Eliminar el préstamo con ID 10:
DELETE FROM Prestamo WHERE id = 10;
