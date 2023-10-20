CREATE DATABASE Accidentes;

USE Accidentes;

CREATE TABLE Pais(
id int auto_increment PRIMARY KEY,
nombre varchar(20),
extension int,
poblacion int
);

SELECT * FROM Pais;

INSERT INTO Pais (nombre, extension, poblacion) VALUES 
('España', 505992, 46704314),
('Francia', 551695, 67406000),
('Italia', 301338, 60483973),
('Alemania', 357022, 83166711),
('Reino Unido', 242495, 66435600),
('Portugal', 92212, 10295909),
('Grecia', 131957, 10741165),
('Países Bajos', 41526, 17441361),
('Suiza', 41285, 8586550),
('Austria', 83871, 8840521);

UPDATE Pais SET poblacion = 47250000 WHERE id = 1;
UPDATE Pais SET extension = 301000 WHERE id = 2;
UPDATE Pais SET poblacion = 83000000 WHERE id = 3;

DELETE FROM Pais WHERE id = 10;
DELETE FROM Pais WHERE id = 9;
DELETE FROM Pais WHERE id = 8;

CREATE TABLE Sitio(
id int auto_increment PRIMARY KEY
);

SELECT * FROM Sitio;

INSERT INTO Sitio VALUES 
(),
(),
(),
(),
(),
(),
(),
(),
(),
();

CREATE TABLE Montaña(
altura int,
id_sitio int, 
FOREIGN KEY (id_sitio) REFERENCES Sitio(id)
);

SELECT * FROM Montaña;

INSERT INTO Montaña (altura,id_sitio) VALUES 
(3000,1),
(4000,2),
(3500,3);

UPDATE Montaña SET altura = 3100 WHERE id_sitio = 1;
UPDATE Montaña SET altura = 4300 WHERE id_sitio = 2;
UPDATE Montaña SET altura = 3600 WHERE id_sitio = 3;

DELETE FROM Montaña WHERE id_sitio = 1;
DELETE FROM Montaña WHERE id_sitio = 2;
DELETE FROM Montaña WHERE id_sitio = 3;

CREATE TABLE Lago(
extension int,
id_sitio int, 
FOREIGN KEY (id_sitio) REFERENCES Sitio(id)
);

SELECT * FROM Lago;

INSERT INTO Lago (extension,id_sitio) VALUES 
(5000,4),
(3500,5),
(6800,6);

UPDATE Lago SET extension = 5300 WHERE id_sitio = 4;
UPDATE Lago SET extension = 4000 WHERE id_sitio = 5;
UPDATE Lago SET extension = 7000 WHERE id_sitio = 6;

DELETE FROM Lago WHERE id_sitio = 4;
DELETE FROM Lago WHERE id_sitio = 5;
DELETE FROM Lago WHERE id_sitio = 6;

CREATE TABLE Rio(
longitud int,
id_sitio int, 
FOREIGN KEY (id_sitio) REFERENCES Sitio(id)
);

SELECT * FROM Rio;

INSERT INTO Rio (longitud, id_sitio) VALUES 
(200,7),
(350,8),
(500,9),
(680,10);

UPDATE Rio SET longitud = 530 WHERE id_sitio = 7;
UPDATE Rio SET longitud = 400 WHERE id_sitio = 8;
UPDATE Rio SET longitud = 700 WHERE id_sitio = 9;

DELETE FROM Rio WHERE id_sitio = 10;
DELETE FROM Rio WHERE id_sitio = 9;
DELETE FROM Rio WHERE id_sitio = 8;

CREATE TABLE AccidenteGeografico(
id int auto_increment PRIMARY KEY,
nombre varchar(20),
posicion_vertical int,
posicion_horizontal int,
id_sitio int, 
id_pais int, 
FOREIGN KEY (id_sitio) REFERENCES Sitio(id),
FOREIGN KEY (id_pais) REFERENCES Pais(id)
);

SELECT * FROM AccidenteGeografico;

INSERT INTO AccidenteGeografico (nombre, posicion_vertical, posicion_horizontal, id_sitio, id_pais) VALUES
('Accidente 1', 100, 200, 1, 1),
('Accidente 2', 150, 250, 2, 2),
('Accidente 3', 120, 180, 3, 3),
('Accidente 4', 220, 320, 4, 4),
('Accidente 5', 180, 280, 5, 5),
('Accidente 6', 130, 230, 6, 6),
('Accidente 7', 240, 340, 7, 7),
('Accidente 8', 170, 270, 8, 8),
('Accidente 9', 210, 310, 9, 9),
('Accidente 10', 190, 290, 10, 10);

UPDATE AccidenteGeografico SET nombre = 'Accidente 1.2' WHERE id = 1;
UPDATE AccidenteGeografico SET nombre = 'Accidente 2.2' WHERE id = 2;
UPDATE AccidenteGeografico SET nombre = 'Accidente 3.2' WHERE id = 3;

DELETE FROM AccidenteGeografico WHERE id = 10;
DELETE FROM AccidenteGeografico WHERE id = 9;
DELETE FROM AccidenteGeografico WHERE id = 8;

CREATE TABLE Localidad(
id int auto_increment PRIMARY KEY,
nombre varchar(20)
);

SELECT * FROM Localidad;

INSERT INTO Localidad (nombre) VALUES
('Madrid'),
('Barcelona'),
('París'),
('Marsella'),
('Roma'),
('Milán'),
('Berlín'),
('Munich'),
('Londres'),
('Birmingham');

UPDATE Localidad SET nombre = 'Valencia' WHERE id = 1;
UPDATE Localidad SET nombre = 'Lyon' WHERE id = 2;
UPDATE Localidad SET nombre = 'Nápoles' WHERE id = 3;

DELETE FROM Localidad WHERE id = 10;
DELETE FROM Localidad WHERE id = 9;
DELETE FROM Localidad WHERE id = 8;


CREATE TABLE PasarLocalidadRio(
id_sitio_rio int , 
id_localidad int,
FOREIGN KEY (id_sitio_rio) REFERENCES Rio(id_sitio),
FOREIGN KEY (id_localidad) REFERENCES Localidad(id)
);

SELECT * FROM PasarLocalidadRio;

INSERT INTO PasarLocalidadRio (id_sitio_rio, id_localidad) VALUES
(7, 1),
(8, 2),
(9, 2),
(10, 10);

UPDATE PasarLocalidadRio SET id_localidad = 5 WHERE id_localidad = 7;
UPDATE PasarLocalidadRio SET id_localidad = 6 WHERE id_localidad = 8;
UPDATE PasarLocalidadRio SET id_localidad = 3 WHERE id_localidad = 10;

DELETE FROM PasarLocalidadRio WHERE id_localidad = 10;
DELETE FROM PasarLocalidadRio WHERE id_localidad = 9;
DELETE FROM PasarLocalidadRio WHERE id_localidad = 8;


CREATE TABLE ContieneLocalidadPais(
id_localidad int , 
id_pais int,
FOREIGN KEY (id_localidad) REFERENCES Localidad(id),
FOREIGN KEY (id_pais) REFERENCES Pais(id)
);

INSERT INTO ContieneLocalidadPais (id_localidad, id_pais) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5);

DELETE FROM ContieneLocalidadPais  WHERE id_localidad = 4;
DELETE FROM ContieneLocalidadPais WHERE id_localidad = 5;
DELETE FROM ContieneLocalidadPais WHERE id_localidad = 6;

