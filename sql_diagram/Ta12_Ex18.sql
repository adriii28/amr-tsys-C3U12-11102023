CREATE DATABASE Inmuebles; 
USE Inmuebles;

CREATE TABLE Persona (
    id INT PRIMARY KEY,
    DNI VARCHAR(8) NOT NULL,
    telefono_fijo VARCHAR(15),
    movil VARCHAR(15),
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(255) NOT NULL
);

CREATE TABLE Cliente (
    codigo_personal INT PRIMARY KEY,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Trabajador (
    codigo_personal INT PRIMARY KEY,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Compra (
    codigo_compra INT PRIMARY KEY,
    fecha DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Alquiler (
    id INT PRIMARY KEY,
    codigo_inmueble INT NOT NULL,
    persona_alquilando INT,
    nombre_agente_empresa VARCHAR(255),
    FOREIGN KEY (codigo_inmueble) REFERENCES Inmueble(codigo_inmueble) ON DELETE CASCADE,
    FOREIGN KEY (persona_alquilando) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Alquilar (
    id_alquiler INT PRIMARY KEY,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Comprar (
    codigo_compra INT PRIMARY KEY,
    codigo_inmueble INT NOT NULL,
    id_persona INT NOT NULL,
    FOREIGN KEY (codigo_inmueble) REFERENCES Inmueble(codigo_inmueble) ON DELETE CASCADE,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE PagosAlquiler (
    id INT PRIMARY KEY,
    año INT NOT NULL,
    mes INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    id_alquiler INT NOT NULL,
    FOREIGN KEY (id_alquiler) REFERENCES Alquiler(id) ON DELETE CASCADE
);

CREATE TABLE Inmueble (
    codigo_inmueble INT PRIMARY KEY,
    direccion NVARCHAR(255) NOT NULL,
    metros_cuadrados DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Garajes (
    codigo_inmueble INT PRIMARY KEY,
    numero_garaje INT NOT NULL,
    planta INT NOT NULL
);

CREATE TABLE Pisos (
    codigo_inmueble INT PRIMARY KEY,
    codigo_especial VARCHAR(100) NOT NULL
);

CREATE TABLE Locales (
    codigo_inmueble INT PRIMARY KEY,
    uso VARCHAR(100) NOT NULL,
    servicio VARCHAR(255) NOT NULL
);

CREATE TABLE OtroTipo (
    codigo_inmueble INT PRIMARY KEY,
    uso VARCHAR(100) NOT NULL,
    servicio VARCHAR(255) NOT NULL
);

CREATE TABLE AsociarGarajePiso (
    codigo_inmueble_garaje INT,
    codigo_inmueble_piso INT,
    PRIMARY KEY (codigo_inmueble_garaje, codigo_inmueble_piso),
    FOREIGN KEY (codigo_inmueble_garaje) REFERENCES Garajes(codigo_inmueble) ON DELETE CASCADE,
    FOREIGN KEY (codigo_inmueble_piso) REFERENCES Pisos(codigo_inmueble) ON DELETE CASCADE
);
-- -----------------------------------INSERTS------------------------------------------------
INSERT INTO Persona (id, DNI, telefono_fijo, movil, nombre, apellidos) VALUES
(1, '12345678', '123-456-789', '987-654-321', 'Juan', 'Pérez'),
(2, '23456789', '234-567-890', '876-543-219', 'María', 'González'),
(3, '34567890', '345-678-901', '765-432-198', 'Carlos', 'López'),
(4, '45678901', '456-789-012', '654-321-987', 'Laura', 'Martínez'),
(5, '56789012', '567-890-123', '543-219-876', 'Pedro', 'Sánchez'),
(6, '67890123', '678-901-234', '432-198-765', 'Elena', 'Rodríguez'),
(7, '78901234', '789-012-345', '321-987-654', 'Sara', 'Gómez'),
(8, '89012345', '890-123-456', '219-876-543', 'José', 'Fernández'),
(9, '90123456', '901-234-567', '198-765-432', 'Manuel', 'López'),
(10, '01234567', '012-345-678', '987-654-321', 'Ana', 'Martínez');

INSERT INTO Cliente (codigo_personal, id_persona) VALUES
(101, 1),
(102, 2),
(103, 3),
(104, 4),
(105, 5),
(106, 6),
(107, 7),
(108, 8),
(109, 9),
(110, 10);

INSERT INTO Trabajador (codigo_personal, id_persona) VALUES
(201, 1),
(202, 2),
(203, 3),
(204, 4),
(205, 5),
(206, 6),
(207, 7),
(208, 8),
(209, 9),
(210, 10);

INSERT INTO Compra (codigo_compra, fecha, valor) VALUES
(1001, '2023-09-01', 150000.00),
(1002, '2023-09-02', 200000.00),
(1003, '2023-09-03', 180000.00),
(1004, '2023-09-04', 210000.00),
(1005, '2023-09-05', 220000.00),
(1006, '2023-09-06', 240000.00),
(1007, '2023-09-07', 250000.00),
(1008, '2023-09-08', 230000.00),
(1009, '2023-09-09', 260000.00),
(1010, '2023-09-10', 270000.00);

INSERT INTO Alquiler (id, codigo_inmueble, persona_alquilando, nombre_agente_empresa) VALUES
(1, 1, 2, 'Inmobiliaria XYZ'),
(2, 2, 1, 'Agente ABC'),
(3, 3, 4, 'Inmobiliaria 123'),
(4, 4, 3, 'Agente 456'),
(5, 5, 5, 'Inmobiliaria ZZZ'),
(6, 6, 6, 'Inmobiliaria A1'),
(7, 7, 7, 'Agente B2'),
(8, 8, 8, 'Inmobiliaria C3'),
(9, 9, 9, 'Agente D4'),
(10, 10, 10, 'Inmobiliaria E5');

INSERT INTO Alquilar (id_alquiler, id_persona) VALUES
(1, 2),
(2, 1),
(3, 4),
(4, 3),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

INSERT INTO Comprar (codigo_compra, codigo_inmueble, id_persona) VALUES
(1011, 3, 2),
(1012, 5, 1),
(1013, 1, 3),
(1014, 4, 5),
(1015, 2, 4),
(1016, 6, 6),
(1017, 7, 7),
(1018, 8, 8),
(1019, 9, 9),
(1020, 10, 10);

INSERT INTO PagosAlquiler (id, año, mes, valor, id_alquiler) VALUES
(11, 2023, 9, 1200.00, 1),
(12, 2023, 9, 1500.00, 2),
(13, 2023, 9, 1300.00, 3),
(14, 2023, 9, 1600.00, 4),
(15, 2023, 9, 1400.00, 5),
(16, 2023, 9, 1700.00, 6),
(17, 2023, 9, 1800.00, 7),
(18, 2023, 9, 1900.00, 8),
(19, 2023, 9, 2200.00, 9),
(20, 2023, 9, 2100.00, 10);

INSERT INTO Inmueble (codigo_inmueble, direccion, metros_cuadrados) VALUES
(1, 'Calle 123', 120.50),
(2, 'Avenida XYZ', 150.25),
(3, 'Plaza 789', 110.75),
(4, 'Carretera 456', 130.00),
(5, 'Calle ABC', 160.75),
(6, 'Avenida 567', 140.25),
(7, 'Plaza 234', 100.00),
(8, 'Carretera 890', 170.50),
(9, 'Calle 678', 180.25),
(10, 'Avenida 012', 190.00);

INSERT INTO Garajes (codigo_inmueble, numero_garaje, planta) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2),
(5, 5, 3),
(6, 6, 1),
(7, 7, 2),
(8, 8, 3),
(9, 9, 1),
(10, 10, 2);

INSERT INTO Pisos (codigo_inmueble, codigo_especial) VALUES
(1, 'Especial 101'),
(2, 'Especial 102'),
(3, 'Especial 103'),
(4, 'Especial 104'),
(5, 'Especial 105'),
(6, 'Especial 106'),
(7, 'Especial 107'),
(8, 'Especial 108'),
(9, 'Especial 109'),
(10, 'Especial 110');

INSERT INTO Locales (codigo_inmueble, uso, servicio) VALUES
(1, 'Comercial', 'Luz y agua'),
(2, 'Oficina', 'Limpieza incluida'),
(3, 'Comercial', 'Aire acondicionado'),
(4, 'Oficina', 'Internet y teléfono'),
(5, 'Comercial', 'Alarma de seguridad'),
(6, 'Oficina', 'Servicio de recepción'),
(7, 'Comercial', 'Aparcamiento'),
(8, 'Oficina', 'Baño privado'),
(9, 'Comercial', 'Escaparate'),
(10, 'Oficina', 'Cocina');

INSERT INTO OtroTipo (codigo_inmueble, uso, servicio) VALUES
(1, 'Residencial', 'Piscina comunitaria'),
(2, 'Residencial', 'Zonas verdes'),
(3, 'Industrial', 'Acceso a camiones'),
(4, 'Industrial', 'Almacenamiento en frío'),
(5, 'Residencial', 'Seguridad 24/7'),
(6, 'Industrial', 'Maquinaria incluida'),
(7, 'Residencial', 'Gimnasio'),
(8, 'Industrial', 'Oficinas incluidas'),
(9, 'Residencial', 'Vistas al mar'),
(10, 'Industrial', 'Muelles de carga');

INSERT INTO AsociarGarajePiso (codigo_inmueble_garaje, codigo_inmueble_piso) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 6),
(6, 7),
(7, 8),
(8, 9),
(9, 10),
(10, 1);

-- -----------------------------------UPDATES------------------------------------------------

UPDATE Persona SET telefono_fijo = '111-111-1111' WHERE id = 1;
UPDATE Persona SET movil = '999-999-9999' WHERE id = 2;
UPDATE Persona SET nombre = 'Javier' WHERE id = 3;

UPDATE Cliente SET id_persona = 6 WHERE codigo_personal = 101;
UPDATE Cliente SET id_persona = 7 WHERE codigo_personal = 102;
UPDATE Cliente SET id_persona = 8 WHERE codigo_personal = 103;

UPDATE Trabajador SET id_persona = 9 WHERE codigo_personal = 201;
UPDATE Trabajador SET id_persona = 10 WHERE codigo_personal = 202;
UPDATE Trabajador SET id_persona = 1 WHERE codigo_personal = 203;

UPDATE Compra SET fecha = '2023-09-15' WHERE codigo_compra = 1001;
UPDATE Compra SET valor = 180000.00 WHERE codigo_compra = 1002;
UPDATE Compra SET fecha = '2023-09-20' WHERE codigo_compra = 1003;

UPDATE Alquiler SET nombre_agente_empresa = 'Nueva Inmobiliaria' WHERE id = 1;
UPDATE Alquiler SET persona_alquilando = 10 WHERE id = 2;
UPDATE Alquiler SET nombre_agente_empresa = 'Agente Actualizado' WHERE id = 3;

UPDATE Alquilar SET id_persona = 4 WHERE id_alquiler = 1;
UPDATE Alquilar SET id_persona = 3 WHERE id_alquiler = 2;
UPDATE Alquilar SET id_persona = 2 WHERE id_alquiler = 3;

UPDATE Comprar SET codigo_inmueble = 8 WHERE codigo_compra = 1011;
UPDATE Comprar SET id_persona = 5 WHERE codigo_compra = 1012;
UPDATE Comprar SET codigo_inmueble = 7 WHERE codigo_compra = 1013;

UPDATE PagosAlquiler SET valor = 1400.00 WHERE id = 11;
UPDATE PagosAlquiler SET mes = 10 WHERE id = 12;
UPDATE PagosAlquiler SET año = 2024 WHERE id = 13;

UPDATE Inmueble SET direccion = 'Calle Nueva 456' WHERE codigo_inmueble = 1;
UPDATE Inmueble SET metros_cuadrados = 170.00 WHERE codigo_inmueble = 2;
UPDATE Inmueble SET direccion = 'Avenida Principal 789' WHERE codigo_inmueble = 3;

UPDATE Garajes SET planta = 2 WHERE codigo_inmueble = 1;
UPDATE Garajes SET numero_garaje = 3 WHERE codigo_inmueble = 2;
UPDATE Garajes SET planta = 3 WHERE codigo_inmueble = 3;

UPDATE Pisos SET codigo_especial = 'Especial 201' WHERE codigo_inmueble = 6;
UPDATE Pisos SET codigo_especial = 'Especial 202' WHERE codigo_inmueble = 7;
UPDATE Pisos SET codigo_especial = 'Especial 203' WHERE codigo_inmueble = 8;

UPDATE Locales SET servicio = 'Aire acondicionado y calefacción' WHERE codigo_inmueble = 1;
UPDATE Locales SET uso = 'Comercial y Oficina' WHERE codigo_inmueble = 2;
UPDATE Locales SET servicio = 'Internet de alta velocidad' WHERE codigo_inmueble = 3;

UPDATE OtroTipo SET servicio = 'Transporte público cercano' WHERE codigo_inmueble = 6;
UPDATE OtroTipo SET uso = 'Residencial y Comercial' WHERE codigo_inmueble = 7;
UPDATE OtroTipo SET servicio = 'Vigilancia 24/7' WHERE codigo_inmueble = 8;

UPDATE AsociarGarajePiso SET codigo_inmueble_piso = 6 WHERE codigo_inmueble_garaje = 1;
UPDATE AsociarGarajePiso SET codigo_inmueble_garaje = 9 WHERE codigo_inmueble_piso = 10;
UPDATE AsociarGarajePiso SET codigo_inmueble_piso = 2 WHERE codigo_inmueble_garaje = 3;


-- -----------------------------------DELETES------------------------------------------------
DELETE FROM Persona WHERE id = 4;
DELETE FROM Persona WHERE id = 5;

DELETE FROM Cliente WHERE codigo_personal = 104;
DELETE FROM Cliente WHERE codigo_personal = 105;

DELETE FROM Trabajador WHERE codigo_personal = 204;
DELETE FROM Trabajador WHERE codigo_personal = 205;

DELETE FROM Compra WHERE codigo_compra = 1004;
DELETE FROM Compra WHERE codigo_compra = 1005;

DELETE FROM Alquiler WHERE id = 4;
DELETE FROM Alquiler WHERE id = 5;

DELETE FROM Alquilar WHERE id_alquiler = 4;
DELETE FROM Alquilar WHERE id_alquiler = 5;

DELETE FROM Comprar WHERE codigo_compra = 1014;
DELETE FROM Comprar WHERE codigo_compra = 1015;

DELETE FROM PagosAlquiler WHERE id = 14;
DELETE FROM PagosAlquiler WHERE id = 15;

DELETE FROM Inmueble WHERE codigo_inmueble = 4;
DELETE FROM Inmueble WHERE codigo_inmueble = 5;

DELETE FROM Garajes WHERE codigo_inmueble = 4;
DELETE FROM Garajes WHERE codigo_inmueble = 5;

DELETE FROM Pisos WHERE codigo_inmueble = 9;
DELETE FROM Pisos WHERE codigo_inmueble = 10;

DELETE FROM Locales WHERE codigo_inmueble = 4;
DELETE FROM Locales WHERE codigo_inmueble = 5;

DELETE FROM OtroTipo WHERE codigo_inmueble = 9;
DELETE FROM OtroTipo WHERE codigo_inmueble = 10;

DELETE FROM AsociarGarajePiso WHERE codigo_inmueble_garaje = 4;
DELETE FROM AsociarGarajePiso WHERE codigo_inmueble_piso = 5;
