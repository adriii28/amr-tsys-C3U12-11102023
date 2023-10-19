CREATE DATABASE Guerra;
USE Guerra;

CREATE TABLE Guerra (
  id_guerra varchar(32) PRIMARY KEY ,
  nombre varchar(120) NOT NULL,
  anio_empieza int NOT NULL,
  anio_termina int,
  CHECK (anio_empieza <= anio_termina )
);

CREATE TABLE Bando (
  id_bando varchar(32) PRIMARY KEY,
  ganador varchar(120)
);


CREATE TABLE Pais (
  nombre varchar(120) PRIMARY KEY 
);


CREATE TABLE Independencia (
  id int auto_increment PRIMARY KEY,
  anio_inicio int NOT NULL,
  anio_finalizacion int,
  nombre_pais varchar(120) NOT NULL,
  FOREIGN KEY (nombre_pais) REFERENCES Pais (nombre) on delete cascade on update cascade,
  CHECK (anio_inicio <= anio_finalizacion )
);

CREATE TABLE Pertenece (
  nombre_pais varchar(120),
  id_bando_bando varchar(32),
  abandona date,
  une date NOT NULL,
  FOREIGN KEY (nombre_pais) REFERENCES Pais (nombre) on delete cascade on update cascade,
  FOREIGN KEY (id_bando_bando) REFERENCES Bando (id_bando) on delete cascade on update cascade,
  PRIMARY KEY (nombre_pais, id_bando_bando)
);


CREATE TABLE ParticipaGuerraBando (
  id_guerra_guerra varchar(32),
  id_bando_bando varchar(32),
  FOREIGN KEY (id_guerra_guerra) REFERENCES Guerra (id_guerra) on delete cascade on update cascade,
  FOREIGN KEY (id_bando_bando) REFERENCES Bando (id_bando) on delete cascade on update cascade,
  PRIMARY KEY (id_guerra_guerra, id_bando_bando)
);

-- Insertar guerra 1
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA001', 'Primera Guerra Mundial', 1914, 1918);

-- Insertar guerra 2
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA002', 'Segunda Guerra Mundial', 1939, 1945);

-- Insertar guerra 3
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA003', 'Guerra Civil Española', 1936, 1939);

-- Insertar guerra 4
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA004', 'Guerra de Vietnam', 1955, 1975);

-- Insertar guerra 5
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA005', 'Guerra de Corea', 1950, 1953);

-- Insertar guerra 6
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA006', 'Guerra de Irak', 2003, 2011);

-- Insertar guerra 7
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA007', 'Guerra de Afganistán', 2001, 2021);

-- Insertar guerra 8
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA008', 'Guerra de las Malvinas', 1982, 1982);

-- Insertar guerra 9
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA009', 'Guerra del Golfo Pérsico', 1990, 1991);

-- Insertar guerra 10
INSERT INTO Guerra (id_guerra, nombre, anio_empieza, anio_termina)
VALUES ('GUERRA010', 'Guerra de Siria', 2011, NULL);

-- Insertar bando 1
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO001', 'Aliados');

-- Insertar bando 2
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO002', 'Eje');

-- Insertar bando 3
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO003', 'Rebeldes');

-- Insertar bando 4
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO004', 'Comunista');

-- Insertar bando 5
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO005', 'Democrático');

-- Insertar bando 6
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO006', 'Coalición');

-- Insertar bando 7
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO007', 'Talibán');

-- Insertar bando 8
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO008', 'Reino Unido');

-- Insertar bando 9
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO009', 'Argentina');

-- Insertar bando 10
INSERT INTO Bando (id_bando, ganador)
VALUES ('BANDO010', 'Coalición Internacional');

-- Insertar país 1
INSERT INTO Pais (nombre)
VALUES ('España');

-- Insertar país 2
INSERT INTO Pais (nombre)
VALUES ('Francia');

-- Insertar país 3
INSERT INTO Pais (nombre)
VALUES ('Alemania');

-- Insertar país 4
INSERT INTO Pais (nombre)
VALUES ('Estados Unidos');

-- Insertar país 5
INSERT INTO Pais (nombre)
VALUES ('Vietnam');

-- Insertar país 6
INSERT INTO Pais (nombre)
VALUES ('Corea del Norte');

-- Insertar país 7
INSERT INTO Pais (nombre)
VALUES ('Irak');

-- Insertar país 8
INSERT INTO Pais (nombre)
VALUES ('Afganistán');

-- Insertar país 9
INSERT INTO Pais (nombre)
VALUES ('Argentina');

-- Insertar país 10
INSERT INTO Pais (nombre)
VALUES ('Reino Unido');

-- Insertar independencia 1
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1776, NULL, 'Estados Unidos');

-- Insertar independencia 2
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1810, 1818, 'Argentina');

-- Insertar independencia 3
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1810, 1821, 'México');

-- Insertar independencia 4
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1818, 1818, 'Chile');

-- Insertar independencia 5
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1825, NULL, 'Bolivia');

-- Insertar independencia 6
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1823, NULL, 'Perú');

-- Insertar independencia 7
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1821, 1823, 'Guatemala');

-- Insertar independencia 8
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1822, 1822, 'Brasil');

-- Insertar independencia 9
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1844, NULL, 'República Dominicana');

-- Insertar independencia 10
INSERT INTO Independencia (anio_inicio, anio_finalizacion, nombre_pais)
VALUES (1820, 1820, 'Ecuador');

-- Insertar pertenencia 1
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Estados Unidos', 'BANDO001', '1776-07-04');

-- Insertar pertenencia 2
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Argentina', 'BANDO003', '1810-05-25');

-- Insertar pertenencia 3
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('México', 'BANDO003', '1810-09-16');

-- Insertar pertenencia 4
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Chile', 'BANDO003', '1810-09-18');

-- Insertar pertenencia 5
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Bolivia', 'BANDO003', '1825-08-06');

-- Insertar pertenencia 6
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Perú', 'BANDO003', '1821-07-28');

-- Insertar pertenencia 7
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Guatemala', 'BANDO003', '1821-09-15');

-- Insertar pertenencia 8
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Brasil', 'BANDO004', '1822-09-07');

-- Insertar pertenencia 9
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('República Dominicana', 'BANDO001', '1844-02-27');

-- Insertar pertenencia 10
INSERT INTO Pertenece (nombre_pais, id_bando_bando, une)
VALUES ('Ecuador', 'BANDO003', '1830-05-13');

-- Insertar participación 1
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA001', 'BANDO001');

-- Insertar participación 2
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA002', 'BANDO001');

-- Insertar participación 3
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA003', 'BANDO003');

-- Insertar participación 4
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA003', 'BANDO006');

-- Insertar participación 5
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA004', 'BANDO002');

-- Insertar participación 6
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA005', 'BANDO004');

-- Insertar participación 7
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA006', 'BANDO001');

-- Insertar participación 8
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA007', 'BANDO006');

-- Insertar participación 9
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA008', 'BANDO008');

-- Insertar participación 10
INSERT INTO ParticipaGuerraBando (id_guerra_guerra, id_bando_bando)
VALUES ('GUERRA009', 'BANDO007');

-- -----------------------------------UPDATE------------------------------------------------
-- Actualizar el año de finalización de 'Guerra de Siria'
UPDATE Guerra
SET anio_termina = 2022
WHERE id_guerra = 'GUERRA010';

-- Actualizar el año de finalización de 'Guerra de Vietnam'
UPDATE Guerra
SET anio_termina = 1975
WHERE id_guerra = 'GUERRA004';

-- Actualizar el ganador del 'BANDO009' a 'Reino Unido'
UPDATE Bando
SET ganador = 'Reino Unido'
WHERE id_bando = 'BANDO009';

-- Actualizar el ganador del 'BANDO003' a 'Gobierno'
UPDATE Bando
SET ganador = 'Gobierno'
WHERE id_bando = 'BANDO003';

-- Actualizar el nombre de 'Reino Unido' a 'United Kingdom'
UPDATE Pais
SET nombre = 'United Kingdom'
WHERE nombre = 'Reino Unido';

-- Actualizar el nombre de 'Corea del Norte' a 'Corea del Sur'
UPDATE Pais
SET nombre = 'Corea del Sur'
WHERE nombre = 'Corea del Norte';

-- Actualizar el año de finalización de la independencia de 'Chile'
UPDATE Independencia
SET anio_finalizacion = 1826
WHERE nombre_pais = 'Chile';

-- Actualizar el año de finalización de la independencia de 'Brasil'
UPDATE Independencia
SET anio_finalizacion = 1823
WHERE nombre_pais = 'Brasil';

-- Actualizar la fecha de unión de 'Argentina' al 'BANDO003'
UPDATE Pertenece
SET une = '1810-07-09'
WHERE nombre_pais = 'Argentina' AND id_bando_bando = 'BANDO003';

-- Actualizar la fecha de unión de 'Ecuador' al 'BANDO003'
UPDATE Pertenece
SET une = '1830-05-24'
WHERE nombre_pais = 'Ecuador' AND id_bando_bando = 'BANDO003';

-- Actualizar el bando del 'GUERRA009' a 'BANDO001'
UPDATE ParticipaGuerraBando
SET id_bando_bando = 'BANDO001'
WHERE id_guerra_guerra = 'GUERRA009' AND id_bando_bando = 'BANDO007';

-- Actualizar el bando del 'GUERRA005' a 'BANDO003'
UPDATE ParticipaGuerraBando
SET id_bando_bando = 'BANDO003'
WHERE id_guerra_guerra = 'GUERRA005' AND id_bando_bando = 'BANDO004';

-- -----------------------------------DELETES------------------------------------------------
-- Eliminar 'Guerra de las Malvinas'
DELETE FROM Guerra
WHERE id_guerra = 'GUERRA008';

-- Eliminar 'Guerra de Irak'
DELETE FROM Guerra
WHERE id_guerra = 'GUERRA006';

-- Eliminar 'BANDO005'
DELETE FROM Bando
WHERE id_bando = 'BANDO005';

-- Eliminar 'BANDO007'
DELETE FROM Bando
WHERE id_bando = 'BANDO007';

-- Eliminar 'Vietnam'
DELETE FROM Pais
WHERE nombre = 'Vietnam';

-- Eliminar 'Irak'
DELETE FROM Pais
WHERE nombre = 'Irak';

-- Eliminar la independencia de 'República Dominicana'
DELETE FROM Independencia
WHERE nombre_pais = 'República Dominicana';

-- Eliminar la independencia de 'Guatemala'
DELETE FROM Independencia
WHERE nombre_pais = 'Guatemala';

-- Eliminar la pertenencia de 'Bolivia' al 'BANDO003'
DELETE FROM Pertenece
WHERE nombre_pais = 'Bolivia' AND id_bando_bando = 'BANDO003';

-- Eliminar la pertenencia de 'Guatemala' al 'BANDO003'
DELETE FROM Pertenece
WHERE nombre_pais = 'Guatemala' AND id_bando_bando = 'BANDO003';

-- Eliminar la participación del 'GUERRA003' en 'BANDO003'
DELETE FROM ParticipaGuerraBando
WHERE id_guerra_guerra = 'GUERRA003' AND id_bando_bando = 'BANDO003';

-- Eliminar la participación del 'GUERRA006' en 'BANDO001'
DELETE FROM ParticipaGuerraBando
WHERE id_guerra_guerra = 'GUERRA006' AND id_bando_bando = 'BANDO001';
