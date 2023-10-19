CREATE DATABASE HorarioEscolar; 
USE HorarioEscolar;
-- -----------------------------------CREATE TABLE------------------------------------------------

CREATE TABLE Profesor (
    DNI VARCHAR(8) PRIMARY KEY,
    direccion VARCHAR(255),
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo_electronico VARCHAR(255),
    num_seg_social VARCHAR(15),
    codigo_interno INT,
    años_antiguedad INT
);

CREATE TABLE Asignatura (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo_interno_centro INT,
    codigo_europeo VARCHAR(15),
    curso_ciclo INT,
    entidad VARCHAR(100),
    id_profesor VARCHAR(8),
    fecha_inicio DATE,
    fecha_finalizacion DATE,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(DNI) ON DELETE CASCADE
);

CREATE TABLE Requiere (
    id_asignatura_pedido INT,
    id_asignatura_nuevo INT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_asignatura_pedido, id_asignatura_nuevo),
    FOREIGN KEY (id_asignatura_pedido) REFERENCES Asignatura(id) ON DELETE CASCADE,
    FOREIGN KEY (id_asignatura_nuevo) REFERENCES Asignatura(id) ON DELETE CASCADE
);

CREATE TABLE Ciclo (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    codigo_interno INT,
    id_curso INT
);

CREATE TABLE Importe (
    id_asignatura INT,
    id_ciclo INT,
    PRIMARY KEY (id_asignatura, id_ciclo),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id) ON DELETE CASCADE,
    FOREIGN KEY (id_ciclo) REFERENCES Ciclo(id)
);

CREATE TABLE Aula (
    id INT PRIMARY KEY,
    codigo VARCHAR(15),
    nombre VARCHAR(100) NOT NULL,
    numero_aula INT,
    metros_cuadrados DECIMAL(10, 2)
);

CREATE TABLE Ocupa (
    id_asignatura INT,
    id_aula INT,
    PRIMARY KEY (id_asignatura, id_aula),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id) ON DELETE CASCADE,
    FOREIGN KEY (id_aula) REFERENCES Aula(id)
);

CREATE TABLE Curso (
    id INT PRIMARY KEY,
    dia_semana VARCHAR(15),
    hora_dia DATE
);

CREATE TABLE HorarioEscolar (
    id INT PRIMARY KEY,
    dia_semana VARCHAR(15) NOT NULL,
    hora_dia DATE NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id) ON DELETE CASCADE
);
-- -----------------------------------INSERTS------------------------------------------------
INSERT INTO Profesor (DNI, direccion, nombre, telefono, correo_electronico, num_seg_social, codigo_interno, años_antiguedad) VALUES
('11111111', 'Calle 1, Ciudad', 'Juan Pérez', '123-456-789', 'juan.perez@email.com', '111111111A', 101, 5),
('22222222', 'Avenida 2, Pueblo', 'Pedro Sánchez', '234-567-890', 'pedro.sanchez@email.com', '222222222B', 102, 8),
('33333333', 'Plaza 3, Villa', 'Luis Rodríguez', '345-678-901', 'luis.rodriguez@email.com', '333333333C', 103, 3),
('44444444', 'Carretera 4, Ciudad', 'Ana Martínez', '456-789-012', 'ana.martinez@email.com', '444444444D', 104, 6),
('55555555', 'Calle 5, Pueblo', 'María García', '567-890-123', 'maria.garcia@email.com', '555555555E', 105, 7),
('66666666', 'Avenida 6, Villa', 'Luisa López', '678-901-234', 'luisa.lopez@email.com', '666666666F', 106, 4),
('77777777', 'Carretera 7, Ciudad', 'Miguel Fernández', '789-012-345', 'miguel.fernandez@email.com', '777777777G', 107, 9),
('88888888', 'Calle 8, Pueblo', 'Sara Pérez', '890-123-456', 'sara.perez@email.com', '888888888H', 108, 11),
('99999999', 'Plaza 9, Villa', 'Carlos Rodríguez', '901-234-567', 'carlos.rodriguez@email.com', '999999999I', 109, 2),
('12345678', 'Avenida 10, Ciudad', 'Laura Martínez', '345-678-901', 'laura.martinez@email.com', '123456789J', 110, 7);

INSERT INTO Asignatura (id, nombre, codigo_interno_centro, codigo_europeo, curso_ciclo, entidad, id_profesor, fecha_inicio, fecha_finalizacion) VALUES
(1, 'Matemáticas', 1001, 'ES-MATH-101', 1, 'Centro A', '11111111', '2023-09-01', '2023-12-15'),
(2, 'Historia', 1002, 'ES-HIST-102', 1, 'Centro B', '22222222', '2023-09-01', '2023-12-15'),
(3, 'Física', 1003, 'ES-PHYS-103', 2, 'Centro A', '33333333', '2023-09-01', '2023-12-15'),
(4, 'Química', 1004, 'ES-CHEM-104', 2, 'Centro B', '44444444', '2023-09-01', '2023-12-15'),
(5, 'Literatura', 1005, 'ES-LIT-105', 3, 'Centro A', '55555555', '2023-09-01', '2023-12-15'),
(6, 'Biología', 1006, 'ES-BIO-106', 3, 'Centro B', '66666666', '2023-09-01', '2023-12-15'),
(7, 'Inglés', 1007, 'ES-ENG-107', 4, 'Centro A', '77777777', '2023-09-01', '2023-12-15'),
(8, 'Economía', 1008, 'ES-ECON-108', 4, 'Centro B', '88888888', '2023-09-01', '2023-12-15'),
(9, 'Música', 1009, 'ES-MUS-109', 5, 'Centro A', '99999999', '2023-09-01', '2023-12-15'),
(10, 'Arte', 1010, 'ES-ART-110', 5, 'Centro B', '12345678', '2023-09-01', '2023-12-15');

INSERT INTO Requiere (id_asignatura_pedido, id_asignatura_nuevo, nombre) VALUES
(1, 2, 'Prerrequisito 1'),
(3, 4, 'Prerrequisito 2'),
(2, 5, 'Prerrequisito 3'),
(4, 1, 'Prerrequisito 4'),
(5, 3, 'Prerrequisito 5'),
(6, 7, 'Prerrequisito 6'),
(7, 8, 'Prerrequisito 7'),
(8, 9, 'Prerrequisito 8'),
(9, 10, 'Prerrequisito 9'),
(10, 1, 'Prerrequisito 10');

INSERT INTO Ciclo (id, nombre, tipo, codigo_interno, id_curso) VALUES
(101, 'Ciclo 1', 'Tipo 1', 10001, 1),
(102, 'Ciclo 2', 'Tipo 2', 10002, 2),
(103, 'Ciclo 3', 'Tipo 3', 10003, 3),
(104, 'Ciclo 4', 'Tipo 4', 10004, 4),
(105, 'Ciclo 5', 'Tipo 5', 10005, 5),
(106, 'Ciclo 6', 'Tipo 1', 10006, 1),
(107, 'Ciclo 7', 'Tipo 2', 10007, 2),
(108, 'Ciclo 8', 'Tipo 3', 10008, 3),
(109, 'Ciclo 9', 'Tipo 4', 10009, 4),
(110, 'Ciclo 10', 'Tipo 5', 10010, 5);

INSERT INTO Importe (id_asignatura, id_ciclo) VALUES
(1, 101),
(2, 102),
(3, 103),
(4, 104),
(5, 105),
(6, 106),
(7, 107),
(8, 108),
(9, 109),
(10, 110);

INSERT INTO Aula (id, codigo, nombre, numero_aula, metros_cuadrados) VALUES
(1, 'Aula101', 'Aula 101', 101, 100),
(2, 'Aula102', 'Aula 102', 102, 110),
(3, 'Aula103', 'Aula 103', 103, 120),
(4, 'Aula104', 'Aula 104', 104, 130),
(5, 'Aula105', 'Aula 105', 105, 140),
(6, 'Aula106', 'Aula 106', 106, 150),
(7, 'Aula107', 'Aula 107', 107, 160),
(8, 'Aula108', 'Aula 108', 108, 170),
(9, 'Aula109', 'Aula 109', 109, 180),
(10, 'Aula110', 'Aula 110', 110, 190);

INSERT INTO Ocupa (id_asignatura, id_aula) VALUES
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

INSERT INTO Curso (id, dia_semana, hora_dia) VALUES
(1, 'Lunes', '09:00:00'),
(2, 'Martes', '10:00:00'),
(3, 'Miércoles', '11:00:00'),
(4, 'Jueves', '12:00:00'),
(5, 'Viernes', '13:00:00'),
(6, 'Sábado', '14:00:00'),
(7, 'Domingo', '15:00:00'),
(8, 'Lunes', '16:00:00'),
(9, 'Martes', '17:00:00'),
(10, 'Miércoles', '18:00:00');

INSERT INTO HorarioEscolar (id, dia_semana, hora_dia, id_curso) VALUES
(1, 'Lunes', '09:00:00', 1),
(2, 'Martes', '10:00:00', 2),
(3, 'Miércoles', '11:00:00', 3),
(4, 'Jueves', '12:00:00', 4),
(5, 'Viernes', '13:00:00', 5),
(6, 'Sábado', '14:00:00', 6),
(7, 'Domingo', '15:00:00', 7),
(8, 'Lunes', '16:00:00', 8),
(9, 'Martes', '17:00:00', 9),
(10, 'Miércoles', '18:00:00', 10);

-- -----------------------------------UPDATES------------------------------------------------

UPDATE Profesor SET direccion = 'Nueva dirección 1' WHERE DNI = '11111111';
UPDATE Profesor SET telefono = '999-999-9999' WHERE DNI = '22222222';
UPDATE Profesor SET años_antiguedad = 10 WHERE DNI = '33333333';

UPDATE Asignatura SET nombre = 'Nueva Asignatura 1' WHERE id = 1;
UPDATE Asignatura SET fecha_finalizacion = '2023-12-30' WHERE id = 2;
UPDATE Asignatura SET curso_ciclo = 2 WHERE id = 3;

UPDATE Requiere SET nombre = 'Nuevo Requisito 1' WHERE id_asignatura_pedido = 1 AND id_asignatura_nuevo = 2;
UPDATE Requiere SET nombre = 'Nuevo Requisito 2' WHERE id_asignatura_pedido = 3 AND id_asignatura_nuevo = 4;
UPDATE Requiere SET nombre = 'Nuevo Requisito 3' WHERE id_asignatura_pedido = 2 AND id_asignatura_nuevo = 5;

UPDATE Ciclo SET nombre = 'Ciclo Modificado 1' WHERE id = 101;
UPDATE Ciclo SET tipo = 'Tipo Modificado 2' WHERE id = 102;
UPDATE Ciclo SET codigo_interno = 10010 WHERE id = 103;
UPDATE Ciclo SET id_curso = 10 WHERE id = 104;

UPDATE Importe SET id_ciclo = 102 WHERE id_asignatura = 1;
UPDATE Importe SET id_asignatura = 3 WHERE id_ciclo = 103;

UPDATE Aula SET nombre = 'Aula Modificada 1' WHERE id = 1;
UPDATE Aula SET numero_aula = 103 WHERE id = 2;
UPDATE Aula SET codigo = 'AulaMod' WHERE id = 3;
UPDATE Aula SET metros_cuadrados = 150 WHERE id = 4;

UPDATE Ocupa SET id_aula = 1 WHERE id_asignatura = 1;
UPDATE Ocupa SET id_asignatura = 3 WHERE id_aula = 3;

UPDATE Curso SET dia_semana = 'Nuevo Día 1' WHERE id = 1;
UPDATE Curso SET hora_dia = '10:00:00' WHERE id = 2;

UPDATE HorarioEscolar SET dia_semana = 'Lunes' WHERE id = 1;
UPDATE HorarioEscolar SET hora_dia = '08:00:00' WHERE id = 2;

-- -----------------------------------DELETES------------------------------------------------

DELETE FROM Profesor WHERE DNI = '44444444';
DELETE FROM Profesor WHERE DNI = '55555555';

DELETE FROM Asignatura WHERE id = 3;
DELETE FROM Asignatura WHERE id = 4;

DELETE FROM Requiere WHERE id_asignatura_pedido = 1 AND id_asignatura_nuevo = 2;
DELETE FROM Requiere WHERE id_asignatura_pedido = 2 AND id_asignatura_nuevo = 3;

DELETE FROM Ciclo WHERE id = 1;
DELETE FROM Ciclo WHERE id = 2;

DELETE FROM Importe WHERE id_asignatura = 1 AND id_ciclo = 2;
DELETE FROM Importe WHERE id_asignatura = 3 AND id_ciclo = 4;

DELETE FROM Aula WHERE id = 1;
DELETE FROM Aula WHERE id = 2;

DELETE FROM Ocupa WHERE id_asignatura = 1 AND id_aula = 2;
DELETE FROM Ocupa WHERE id_asignatura = 2 AND id_aula = 3;

DELETE FROM Curso WHERE id = 1;
DELETE FROM Curso WHERE id = 2;

DELETE FROM HorarioEscolar WHERE id = 1;
DELETE FROM HorarioEscolar WHERE id = 2;


