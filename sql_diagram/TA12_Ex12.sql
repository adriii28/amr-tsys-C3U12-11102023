CREATE DATABASE EmpresaSoftware;

USE EmpresaSoftware;

CREATE TABLE Trabajador (
dni varchar(9),
nombre varchar(20) not null,
apellidos varchar(20) not null,
PRIMARY KEY (dni)
);

SELECT * FROM Trabajador;

INSERT INTO Trabajador (dni, nombre, apellidos) VALUES
('123456789', 'Juan', 'Perez'),
('234567890', 'Maria', 'Gomez'),
('345678901', 'Carlos', 'Lopez'),
('456789012', 'Laura', 'Sanchez'),
('567890123', 'Pedro', 'Martinez'),
('678901234', 'Sara', 'Rodriguez'),
('789012345', 'David', 'Fernandez'),
('890123456', 'Ana', 'Lopez'),
('901234567', 'Miguel', 'Garcia'),
('012345678', 'Elena', 'Jimenez');

UPDATE Trabajador SET nombre = 'Carlos' WHERE dni = '123456789';
UPDATE Trabajador SET nombre = 'Maria' WHERE dni = '234567890';
UPDATE Trabajador SET nombre = 'Juan' WHERE dni = '345678901';

DELETE FROM Trabajador WHERE dni = '456789012';
DELETE FROM Trabajador WHERE dni = '567890123';
DELETE FROM Trabajador WHERE dni = '678901234';

CREATE TABLE Profesion (
id int auto_increment,
codigo_profesion int not null,
nombre varchar(50) not null,
PRIMARY KEY (id)
);

SELECT * FROM Profesion;

INSERT INTO Profesion (codigo_profesion, nombre) VALUES
(1001, 'Desarrollador de Software'),
(1002, 'Ingeniero de Software'),
(1003, 'Analista de Sistemas'),
(1004, 'Arquitecto de Software'),
(1005, 'Especialista en Seguridad Informática'),
(1006, 'Diseñador de Experiencia de Usuario (UX)'),
(1007, 'Diseñador de Interfaces de Usuario (UI)'),
(1008, 'Ingeniero de Redes'),
(1009, 'Administrador de Bases de Datos'),
(1010, 'Especialista en Inteligencia Artificial');

UPDATE Profesion SET nombre = 'Ingeniero de Software Senior' WHERE id = 1;
UPDATE Profesion SET nombre = 'Arquitecto de Soluciones' WHERE id = 2;
UPDATE Profesion SET nombre = 'Especialista en Ciberseguridad' WHERE id = 3;

DELETE FROM Profesion WHERE id = 10;
DELETE FROM Profesion WHERE id = 9;
DELETE FROM Profesion WHERE id = 8;



CREATE TABLE TrabajadorTieneProfesion (
id_profesion int,
dni_trabajador varchar(20),
PRIMARY KEY (id_profesion,dni_trabajador),
FOREIGN KEY (id_profesion) REFERENCES Profesion(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (dni_trabajador) REFERENCES Trabajador(dni)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM TrabajadorTieneProfesion;

INSERT INTO TrabajadorTieneProfesion (id_profesion, dni_trabajador) VALUES
(1, '123456789'),
(2, '234567890'),
(3, '345678901'),
(4, '456789012'),
(5, '567890123'),
(6, '678901234'),
(7, '789012345'),
(8, '890123456'),
(9, '901234567'),
(10, '012345678');

DELETE FROM TrabajadorTieneProfesion WHERE dni_trabajador = '456789012';
DELETE FROM TrabajadorTieneProfesion WHERE dni_trabajador = '567890123';
DELETE FROM TrabajadorTieneProfesion WHERE dni_trabajador = '678901234';


CREATE TABLE Proyecto(
id int auto_increment,
nombre varchar(20) not null,
fecha_inicio date,
fecha_fin date,
PRIMARY KEY (id)
);

SELECT * FROM Proyecto;

INSERT INTO Proyecto (nombre, fecha_inicio, fecha_fin) VALUES
('Proyecto 1', '2023-10-01', '2023-11-30'),
('Proyecto 2', '2023-09-15', '2023-12-15'),
('Proyecto 3', '2023-11-05', '2023-12-31'),
('Proyecto 4', '2023-10-10', '2023-11-15'),
('Proyecto 5', '2023-12-01', '2023-12-31'),
('Proyecto 6', '2023-09-01', '2023-10-30'),
('Proyecto 7', '2023-11-01', '2023-12-20'),
('Proyecto 8', '2023-10-05', '2023-11-10'),
('Proyecto 9', '2023-11-15', '2023-12-25'),
('Proyecto 10', '2023-09-20', '2023-10-25');

UPDATE Proyecto SET nombre = 'Proyecto 1.2' WHERE id = 1;
UPDATE Proyecto SET nombre = 'Proyecto 2.2' WHERE id = 2;
UPDATE Proyecto SET nombre = 'Proyecto 3.3' WHERE id = 3;

DELETE FROM Proyecto WHERE id = 10;
DELETE FROM Proyecto WHERE id = 9;
DELETE FROM Proyecto WHERE id = 8;


CREATE TABLE ProyectoAsignado(
dni_trabajador varchar(20),
id_proyecto int,
horas_trabajadas time,
PRIMARY KEY (dni_trabajador,id_proyecto),
FOREIGN KEY (dni_trabajador) REFERENCES Trabajador(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM ProyectoAsignado;

INSERT INTO ProyectoAsignado (dni_trabajador, id_proyecto, horas_trabajadas) VALUES
('123456789', 1, '40:00:00'),
('234567890', 2, '45:00:00'),
('345678901', 3, '50:00:00'),
('456789012', 4, '55:00:00'),
('567890123', 5, '60:00:00'),
('678901234', 6, '65:00:00'),
('789012345', 7, '70:00:00'),
('890123456', 8, '75:00:00'),
('901234567', 9, '80:00:00'),
('012345678', 10, '85:00:00');

UPDATE ProyectoAsignado SET horas_trabajadas = '20:30:00' WHERE id_proyecto = 1;
UPDATE ProyectoAsignado SET horas_trabajadas = '25:45:00' WHERE id_proyecto = 2;
UPDATE ProyectoAsignado SET horas_trabajadas = '30:15:00' WHERE id_proyecto = 3;

DELETE FROM ProyectoAsignado WHERE id_proyecto = 10;
DELETE FROM ProyectoAsignado WHERE id_proyecto = 9;
DELETE FROM ProyectoAsignado WHERE id_proyecto = 8;


CREATE TABLE Empresa (
cif varchar(20),
nombre varchar(20) not null,
direccion varchar(20),
codigo_interno int not null,
telefono int,
PRIMARY KEY (cif)
);

SELECT * FROM Empresa;

INSERT INTO Empresa (cif, nombre, direccion, codigo_interno, telefono) VALUES
('CIF1', 'Empresa 1', 'Dirección 1', 10, 111111111),
('CIF2', 'Empresa 2', 'Dirección 2', 20, 222222222),
('CIF3', 'Empresa 3', 'Dirección 3', 30, 333333333),
('CIF4', 'Empresa 4', 'Dirección 4', 40, 444444444),
('CIF5', 'Empresa 5', 'Dirección 5', 50, 555555555),
('CIF6', 'Empresa 6', 'Dirección 6', 60, 666666666),
('CIF7', 'Empresa 7', 'Dirección 7', 70, 777777777),
('CIF8', 'Empresa 8', 'Dirección 8', 80, 888888888),
('CIF9', 'Empresa 9', 'Dirección 9', 90, 999999999),
('CIF10', 'Empresa 10', 'Dirección 10', 100, 101010101);


UPDATE Empresa SET nombre = 'Empresa 1.2', telefono = 111111111 WHERE cif = 'CIF1';
UPDATE Empresa SET nombre = 'Empresa 2.2', telefono = 222222222 WHERE cif = 'CIF2';
UPDATE Empresa SET nombre = 'Empresa 3.2', telefono = 333333333 WHERE cif = 'CIF3';

DELETE FROM Empresa WHERE cif = 'CIF10';
DELETE FROM Empresa WHERE cif = 'CIF9';
DELETE FROM Empresa WHERE cif = 'CIF8';


CREATE TABLE Realiza (
id_proyecto int,
cif_empresa varchar(20),
PRIMARY KEY (id_proyecto,cif_empresa),
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (cif_empresa) REFERENCES Empresa(cif)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Realiza;

INSERT INTO Realiza (id_proyecto, cif_empresa) VALUES
(1, 'CIF1'),
(2, 'CIF2'),
(3, 'CIF3'),
(4, 'CIF4'),
(5, 'CIF5'),
(6, 'CIF6'),
(7, 'CIF7'),
(8, 'CIF8'),
(9, 'CIF9'),
(10, 'CIF10');

DELETE FROM Realiza WHERE id_proyecto = 10;
DELETE FROM Realiza WHERE id_proyecto = 9;
DELETE FROM Realiza WHERE id_proyecto = 8;


CREATE TABLE Fecha (
id int auto_increment,
fecha date,
PRIMARY KEY (id)
);

SELECT * FROM Fecha;

INSERT INTO Fecha (fecha) VALUES
('2023-01-01'),
('2023-02-15'),
('2023-03-10'),
('2023-04-05'),
('2023-05-20'),
('2023-06-15'),
('2023-07-10'),
('2023-08-25'),
('2023-09-30'),
('2023-10-05');

UPDATE Fecha SET fecha = '2023-11-01' WHERE id = 1;
UPDATE Fecha SET fecha = '2023-12-15' WHERE id = 2;
UPDATE Fecha SET fecha = '2023-01-20' WHERE id = 3;

DELETE FROM Fecha WHERE id = 10;
DELETE FROM Fecha WHERE id = 9;
DELETE FROM Fecha WHERE id = 8;


CREATE TABLE Asocia (
id_fecha int,
id_proyecto int,
PRIMARY KEY (id_fecha,id_proyecto),
FOREIGN KEY (id_fecha) REFERENCES Fecha(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Asocia;

INSERT INTO Asocia (id_fecha, id_proyecto) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

UPDATE Asocia SET id_proyecto = 10 WHERE id_fecha = 1;
UPDATE Asocia SET id_proyecto = 9 WHERE id_fecha = 2;
UPDATE Asocia SET id_proyecto = 8 WHERE id_fecha = 3;

DELETE FROM Asocia WHERE id_fecha = 10;
DELETE FROM Asocia WHERE id_fecha = 9;
DELETE FROM Asocia WHERE id_fecha = 8;

