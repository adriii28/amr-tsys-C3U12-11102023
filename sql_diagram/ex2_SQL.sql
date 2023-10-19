CREATE DATABASE AcademiaClases;
USE AcademiaClases;

CREATE TABLE Profesor(
dni varchar(9) PRIMARY KEY,
nombre varchar(40),
direccion varchar(110),
telefono int not null,
apellidos varchar(100)
);


CREATE TABLE Curso(
codigo_curso varchar(20) PRIMARY KEY,
horas_duracion int not null,
fecha_inicio date not null,
fecha_final date not null, 
programa varchar(40) not null,
titulo varchar(30) not null,
dni_profesor varchar(9) not null,
FOREIGN KEY (dni_profesor) REFERENCES Profesor(dni) on delete cascade on update cascade,
CHECK (fecha_inicio <= fecha_final)
);


CREATE TABLE Empresa(
cif varchar(9) primary key,
direccion varchar(80) not null,
telefono int not null,
nombre varchar(40) not null
);

CREATE TABLE Alumno(
dni varchar(9) PRIMARY KEY,
edad int not null,
direccion varchar(150),
telefono int not null,
nombre varchar(40) not null,
cif_empresa varchar(9),
FOREIGN KEY (cif_empresa) REFERENCES Empresa(cif),
CHECK (edad >= 16)
);

CREATE TABLE AssistirAlumnoCurso(
dni_alumno varchar(9),
codigo_curso varchar(20),
nota decimal(5, 2),
FOREIGN KEY (dni_alumno) REFERENCES Alumno(dni),
FOREIGN KEY (codigo_curso) REFERENCES Curso(codigo_curso),
PRIMARY KEY(dni_alumno,codigo_curso),
CHECK (nota BETWEEN 0 AND 10)
);

-- -----------------------------------INSERTS------------------------------------------------

-- Insertar profesor 1
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('77777777X', 'Javier', 'Calle Principal 111', 777777777, 'González');

-- Insertar profesor 2
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('88888888A', 'Elena', 'Avenida Secundaria 222', 888888888, 'Hernández');

-- Insertar profesor 3
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('99999999D', 'Alejandro', 'Calle Nueva 333', 999999999, 'Fernández');

-- Insertar profesor 4
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('10101010E', 'Isabel', 'Avenida Principal 444', 1010101010, 'Jiménez');

-- Insertar profesor 5
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('11111111Q', 'Miguel', 'Calle Secundaria 555', 1111111111, 'Gómez');

-- Insertar profesor 6
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('12121212U', 'Carmen', 'Avenida Nueva 666', 1212121212, 'López');

-- Insertar profesor 7
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('13131313L', 'Luis', 'Calle Principal 777', 1313131313, 'Ramírez');

-- Insertar profesor 8
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('14141414F', 'Ana', 'Avenida Secundaria 888', 141414141, 'Martínez');

-- Insertar profesor 9
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('15151515R', 'Carlos', 'Calle Nueva 999', 1515151515, 'Sánchez');

-- Insertar profesor 10
INSERT INTO Profesor (dni, nombre, direccion, telefono, apellidos)
VALUES ('16161616R', 'Marta', 'Avenida Principal 1010', 1616161616, 'Díaz');

-- Insertar curso 1
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR021', 80, '2023-05-01', '2023-08-01', 'Programa 2', 'Curso 2', '77777777X');

-- Insertar curso 2
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR022', 60, '2023-03-15', '2023-06-15', 'Programa 3', 'Curso 3', '88888888A');

-- Insertar curso 3
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR023', 90, '2023-07-01', '2023-10-01', 'Programa 4', 'Curso 4', '99999999D');

-- Insertar curso 4
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR024', 70, '2023-04-15', '2023-07-15', 'Programa 5', 'Curso 5', '10101010E');

-- Insertar curso 5
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR025', 85, '2023-06-01', '2023-09-01', 'Programa 6', 'Curso 6', '11111111Q');

-- Insertar curso 6
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR026', 75, '2023-05-15', '2023-08-15', 'Programa 7', 'Curso 7', '12121212U');

-- Insertar curso 7
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR027', 65, '2023-04-01', '2023-07-01', 'Programa 8', 'Curso 8', '13131313L');

-- Insertar curso 8
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR028', 55, '2023-03-15', '2023-06-15', 'Programa 9', 'Curso 9', '14141414F');

-- Insertar curso 9
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR029', 95, '2023-08-01', '2023-11-01', 'Programa 10', 'Curso 10', '15151515R');

-- Insertar curso 10
INSERT INTO Curso (codigo_curso, horas_duracion, fecha_inicio, fecha_final, programa, titulo, dni_profesor)
VALUES ('CUR030', 80, '2023-05-01', '2023-08-01', 'Programa 11', 'Curso 11', '16161616R');

-- Insertar empresa 1
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('123456789', 'Calle Empresa 1', 123456789, 'Empresa A');

-- Insertar empresa 2
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('987654321', 'Avenida Empresa 2', 987654321, 'Empresa B');

-- Insertar empresa 3
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('555555555', 'Calle Empresa 3', 555555555, 'Empresa C');

-- Insertar empresa 4
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('999888777', 'Avenida Empresa 4', 999888777, 'Empresa D');

-- Insertar empresa 5
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('111222333', 'Calle Empresa 5', 111222333, 'Empresa E');

-- Insertar empresa 6
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('222333444', 'Avenida Empresa 6', 222333444, 'Empresa F');

-- Insertar empresa 7
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('333444555', 'Calle Empresa 7', 333444555, 'Empresa G');

-- Insertar empresa 8
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('444555666', 'Avenida Empresa 8', 444555666, 'Empresa H');

-- Insertar empresa 9
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('555666777', 'Calle Empresa 9', 555666777, 'Empresa I');

-- Insertar empresa 10
INSERT INTO Empresa (cif, direccion, telefono, nombre)
VALUES ('666777888', 'Avenida Empresa 10', 666777888, 'Empresa J');

-- Insertar alumno 1
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('123456789', 20, 'Calle Alumno 1', 123456789, 'Alumno A', '123456789');

-- Insertar alumno 2
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('987654321', 21, 'Avenida Alumno 2', 987654321, 'Alumno B', '987654321');

-- Insertar alumno 3
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('555555555', 22, 'Calle Alumno 3', 555555555, 'Alumno C', '555555555');

-- Insertar alumno 4
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('999888777', 23, 'Avenida Alumno 4', 999888777, 'Alumno D', '999888777');

-- Insertar alumno 5
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('111222333', 24, 'Calle Alumno 5', 111222333, 'Alumno E', '111222333');

-- Insertar alumno 6
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('222333444', 25, 'Avenida Alumno 6', 222333444, 'Alumno F', '222333444');

-- Insertar alumno 7
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('333444555', 26, 'Calle Alumno 7', 333444555, 'Alumno G', '333444555');

-- Insertar alumno 8
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('444555666', 27, 'Avenida Alumno 8', 444555666, 'Alumno H', '444555666');

-- Insertar alumno 9
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('555666777', 28, 'Calle Alumno 9', 555666777, 'Alumno I', '555666777');

-- Insertar alumno 10
INSERT INTO Alumno (dni, edad, direccion, telefono, nombre, cif_empresa)
VALUES ('666777888', 29, 'Avenida Alumno 10', 666777888, 'Alumno J', '666777888');

-- Insertar relación entre alumno y curso 1
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('111222333', 'CUR021', 8.5);

-- Insertar relación entre alumno y curso 2
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('987654321', 'CUR022', 9.0);

-- Insertar relación entre alumno y curso 3
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('555555555', 'CUR023', 7.2);

-- Insertar relación entre alumno y curso 4
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('999888777', 'CUR024', 6.8);

-- Insertar relación entre alumno and curso 5
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('111222333', 'CUR025', 8.9);

-- Insertar relación entre alumno and curso 6
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('222333444', 'CUR026', 7.5);

-- Insertar relación entre alumno and curso 7
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('333444555', 'CUR027', 9.2);

-- Insertar relación entre alumno and curso 8
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('444555666', 'CUR028', 6.0);

-- Insertar relación entre alumno and curso 9
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('555666777', 'CUR029', 7.8);

-- Insertar relación entre alumno and curso 10
INSERT INTO AssistirAlumnoCurso (dni_alumno, codigo_curso, nota)
VALUES ('666777888', 'CUR030', 8.3);

-- -----------------------------------UPDATES------------------------------------------------

-- Actualizar la dirección del profesor con DNI '77777777X'
UPDATE Profesor
SET direccion = 'Nueva Dirección 1'
WHERE dni = '77777777X';

-- Actualizar el nombre del profesor con DNI '88888888A'
UPDATE Profesor
SET nombre = 'Elena María'
WHERE dni = '88888888A';

-- Actualizar el teléfono del profesor con DNI '99999999D'
UPDATE Profesor
SET telefono = 666666666
WHERE dni = '99999999D';

-- Actualizar la dirección del profesor con DNI '10101010E'
UPDATE Profesor
SET direccion = 'Nueva Calle 999'
WHERE dni = '10101010E';

-- Actualizar el apellido del profesor con DNI '11111111Q'
UPDATE Profesor
SET apellidos = 'Gómez Pérez'
WHERE dni = '11111111Q';

-- Actualizar el nombre del profesor con DNI '12121212U'
UPDATE Profesor
SET nombre = 'Luisa'
WHERE dni = '12121212U';

-- Actualizar el teléfono del profesor con DNI '13131313L'
UPDATE Profesor
SET telefono = 777777777
WHERE dni = '13131313L';

-- Actualizar la dirección del profesor con DNI '14141414F'
UPDATE Profesor
SET direccion = 'Nueva Dirección 2'
WHERE dni = '14141414F';

-- Actualizar el apellido del profesor con DNI '15151515R'
UPDATE Profesor
SET apellidos = 'Sánchez González'
WHERE dni = '15151515R';

-- Actualizar el nombre del profesor con DNI '16161616R'
UPDATE Profesor
SET nombre = 'Carlos José'
WHERE dni = '16161616R';

-- Actualizar el programa del curso con código 'CUR021'
UPDATE Curso
SET programa = 'Nuevo Programa 1'
WHERE codigo_curso = 'CUR021';

-- Actualizar el título del curso con código 'CUR022'
UPDATE Curso
SET titulo = 'Nuevo Título 2'
WHERE codigo_curso = 'CUR022';

-- Actualizar las horas de duración del curso con código 'CUR023'
UPDATE Curso
SET horas_duracion = 100
WHERE codigo_curso = 'CUR023';

-- Actualizar la fecha de inicio del curso con código 'CUR024'
UPDATE Curso
SET fecha_inicio = '2023-03-01'
WHERE codigo_curso = 'CUR024';

-- Actualizar la fecha final del curso con código 'CUR025'
UPDATE Curso
SET fecha_final = '2023-09-15'
WHERE codigo_curso = 'CUR025';

-- Actualizar el programa del curso con código 'CUR026'
UPDATE Curso
SET programa = 'Nuevo Programa 7'
WHERE codigo_curso = 'CUR026';

-- Actualizar el título del curso con código 'CUR027'
UPDATE Curso
SET titulo = 'Nuevo Título 8'
WHERE codigo_curso = 'CUR027';

-- Actualizar las horas de duración del curso con código 'CUR028'
UPDATE Curso
SET horas_duracion = 110
WHERE codigo_curso = 'CUR028';

-- Actualizar la fecha de inicio del curso con código 'CUR029'
UPDATE Curso
SET fecha_inicio = '2023-07-01'
WHERE codigo_curso = 'CUR029';

-- Actualizar la fecha final del curso con código 'CUR030'
UPDATE Curso
SET fecha_final = '2023-11-15'
WHERE codigo_curso = 'CUR030';

-- Actualizar la dirección de la empresa con CIF '123456789'
UPDATE Empresa
SET direccion = 'Nueva Calle Empresa 1'
WHERE cif = '123456789';

-- Actualizar el nombre de la empresa con CIF '987654321'
UPDATE Empresa
SET nombre = 'Nueva Empresa B'
WHERE cif = '987654321';

-- Actualizar el teléfono de la empresa con CIF '555555555'
UPDATE Empresa
SET telefono = 777777777
WHERE cif = '555555555';

-- Actualizar la dirección de la empresa con CIF '999888777'
UPDATE Empresa
SET direccion = 'Nueva Avenida Empresa 4'
WHERE cif = '999888777';

-- Actualizar el nombre de la empresa con CIF '111222333'
UPDATE Empresa
SET nombre = 'Nueva Empresa E'
WHERE cif = '111222333';

-- Actualizar el teléfono de la empresa con CIF '222333444'
UPDATE Empresa
SET telefono = 888888888
WHERE cif = '222333444';

-- Actualizar la dirección de la empresa con CIF '333444555'
UPDATE Empresa
SET direccion = 'Nueva Calle Empresa 7'
WHERE cif = '333444555';

-- Actualizar el nombre de la empresa con CIF '444555666'
UPDATE Empresa
SET nombre = 'Nueva Empresa H'
WHERE cif = '444555666';

-- Actualizar el teléfono de la empresa con CIF '555666777'
UPDATE Empresa
SET telefono = 999999999
WHERE cif = '555666777';

-- Actualizar la dirección de la empresa con CIF '666777888'
UPDATE Empresa
SET direccion = 'Nueva Avenida Empresa 10'
WHERE cif = '666777888';

-- Actualizar la dirección del alumno con DNI '123456789'
UPDATE Alumno
SET direccion = 'Nueva Calle Alumno 1'
WHERE dni = '123456789';

-- Actualizar el nombre del alumno con DNI '987654321'
UPDATE Alumno
SET nombre = 'Nuevo Alumno B'
WHERE dni = '987654321';

-- Actualizar el teléfono del alumno con DNI '555555555'
UPDATE Alumno
SET telefono = 777777777
WHERE dni = '555555555';

-- Actualizar la dirección del alumno con DNI '999888777'
UPDATE Alumno
SET direccion = 'Nueva Avenida Alumno 4'
WHERE dni = '999888777';

-- Actualizar el nombre del alumno con DNI '111222333'
UPDATE Alumno
SET nombre = 'Nuevo Alumno E'
WHERE dni = '111222333';

-- Actualizar el teléfono del alumno con DNI '222333444'
UPDATE Alumno
SET telefono = 888888888
WHERE dni = '222333444';

-- Actualizar la dirección del alumno con DNI '333444555'
UPDATE Alumno
SET direccion = 'Nueva Calle Alumno 7'
WHERE dni = '333444555';

-- Actualizar el nombre del alumno con DNI '444555666'
UPDATE Alumno
SET nombre = 'Nuevo Alumno H'
WHERE dni = '444555666';

-- Actualizar el teléfono del alumno con DNI '555666777'
UPDATE Alumno
SET telefono = 999999999
WHERE dni = '555666777';

-- Actualizar la dirección del alumno con DNI '666777888'
UPDATE Alumno
SET direccion = 'Nueva Avenida Alumno 10'
WHERE dni = '666777888';

-- Actualizar la nota de la relación entre alumno y curso (DNI '123456789' y código 'CUR001')
UPDATE AssistirAlumnoCurso
SET nota = 9.5
WHERE dni_alumno = '123456789' AND codigo_curso = 'CUR021';

-- Actualizar la nota de la relación entre alumno y curso (DNI '987654321' y código 'CUR002')
UPDATE AssistirAlumnoCurso
SET nota = 8.8
WHERE dni_alumno = '987654321' AND codigo_curso = 'CUR022';

-- Actualizar la nota de la relación entre alumno y curso (DNI '555555555' y código 'CUR003')
UPDATE AssistirAlumnoCurso
SET nota = 7.9
WHERE dni_alumno = '555555555' AND codigo_curso = 'CUR023';

-- Actualizar la nota de la relación entre alumno y curso (DNI '999888777' y código 'CUR004')
UPDATE AssistirAlumnoCurso
SET nota = 7.0
WHERE dni_alumno = '999888777' AND codigo_curso = 'CUR024';

-- Actualizar la nota de la relación entre alumno y curso (DNI '111222333' y código 'CUR005')
UPDATE AssistirAlumnoCurso
SET nota = 8.0
WHERE dni_alumno = '111222333' AND codigo_curso = 'CUR025';

-- Actualizar la nota de la relación entre alumno y curso (DNI '222333444' y código 'CUR006')
UPDATE AssistirAlumnoCurso
SET nota = 7.2
WHERE dni_alumno = '222333444' AND codigo_curso = 'CUR026';

-- Actualizar la nota de la relación entre alumno y curso (DNI '333444555' y código 'CUR007')
UPDATE AssistirAlumnoCurso
SET nota = 9.0
WHERE dni_alumno = '333444555' AND codigo_curso = 'CUR027';

-- Actualizar la nota de la relación entre alumno y curso (DNI '444555666' y código 'CUR008')
UPDATE AssistirAlumnoCurso
SET nota = 6.5
WHERE dni_alumno = '444555666' AND codigo_curso = 'CUR028';

-- Actualizar la nota de la relación entre alumno y curso (DNI '555666777' y código 'CUR009')
UPDATE AssistirAlumnoCurso
SET nota = 8.7
WHERE dni_alumno = '555666777' AND codigo_curso = 'CUR029';

-- Actualizar la nota de la relación entre alumno y curso (DNI '666777888' y código 'CUR010')
UPDATE AssistirAlumnoCurso
SET nota = 7.7
WHERE dni_alumno = '666777888' AND codigo_curso = 'CUR030';

-- -----------------------------------DELETE------------------------------------------------

-- Eliminar la relación entre alumno y curso (DNI '123456789' y código 'CUR001')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '111222333' AND codigo_curso = 'CUR021';

-- Eliminar la relación entre alumno y curso (DNI '987654321' y código 'CUR002')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '987654321' AND codigo_curso = 'CUR022';

-- Eliminar la relación entre alumno y curso (DNI '555555555' y código 'CUR003')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '555555555' AND codigo_curso = 'CUR023';

-- Eliminar la relación entre alumno y curso (DNI '999888777' y código 'CUR004')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '999888777' AND codigo_curso = 'CUR024';

-- Eliminar la relación entre alumno y curso (DNI '111222333' y código 'CUR005')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '111222333' AND codigo_curso = 'CUR025';

-- Eliminar la relación entre alumno y curso (DNI '222333444' y código 'CUR006')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '222333444' AND codigo_curso = 'CUR026';

-- Eliminar la relación entre alumno y curso (DNI '333444555' y código 'CUR007')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '333444555' AND codigo_curso = 'CUR027';

-- Eliminar la relación entre alumno y curso (DNI '444555666' y código 'CUR008')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '444555666' AND codigo_curso = 'CUR028';

-- Eliminar la relación entre alumno y curso (DNI '555666777' y código 'CUR009')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '555666777' AND codigo_curso = 'CUR029';

-- Eliminar la relación entre alumno y curso (DNI '666777888' y código 'CUR010')
DELETE FROM AssistirAlumnoCurso
WHERE dni_alumno = '666777888' AND codigo_curso = 'CUR030';

SELECT * FROM Profesor;
-- Eliminar el profesor con DNI '77777777X'
DELETE FROM Profesor
WHERE dni = '77777777X';

-- Eliminar el profesor con DNI '888888888'
DELETE FROM Profesor
WHERE dni = '88888888A';

-- Eliminar el profesor con DNI '999999999'
DELETE FROM Profesor
WHERE dni = '99999999D';

-- Eliminar el profesor con DNI '1010101010'
DELETE FROM Profesor
WHERE dni = '10101010E';

-- Eliminar el profesor con DNI '1111111111'
DELETE FROM Profesor
WHERE dni = '11111111Q';

-- Eliminar el profesor con DNI '1212121212'
DELETE FROM Profesor
WHERE dni = '12121212U';

-- Eliminar el profesor con DNI '1313131313'
DELETE FROM Profesor
WHERE dni = '13131313L';

-- Eliminar el profesor con DNI '1414141414'
DELETE FROM Profesor
WHERE dni = '14141414F';

-- Eliminar el profesor con DNI '1515151515'
DELETE FROM Profesor
WHERE dni = '15151515R';

-- Eliminar el profesor con DNI '1616161616'
DELETE FROM Profesor
WHERE dni = '16161616R';

-- Eliminar el curso con código 'CUR021'
DELETE FROM Curso
WHERE codigo_curso = 'CUR021';

-- Eliminar el curso con código 'CUR022'
DELETE FROM Curso
WHERE codigo_curso = 'CUR022';

-- Eliminar el curso con código 'CUR023'
DELETE FROM Curso
WHERE codigo_curso = 'CUR023';

-- Eliminar el curso con código 'CUR024'
DELETE FROM Curso
WHERE codigo_curso = 'CUR024';

-- Eliminar el curso con código 'CUR025'
DELETE FROM Curso
WHERE codigo_curso = 'CUR025';

-- Eliminar el curso con código 'CUR026'
DELETE FROM Curso
WHERE codigo_curso = 'CUR026';

-- Eliminar el curso con código 'CUR027'
DELETE FROM Curso
WHERE codigo_curso = 'CUR027';

-- Eliminar el curso con código 'CUR028'
DELETE FROM Curso
WHERE codigo_curso = 'CUR028';

-- Eliminar el curso con código 'CUR029'
DELETE FROM Curso
WHERE codigo_curso = 'CUR029';

-- Eliminar el curso con código 'CUR030'
DELETE FROM Curso
WHERE codigo_curso = 'CUR030';

-- Eliminar el alumno con DNI '123456789'
DELETE FROM Alumno
WHERE dni = '123456789';

-- Eliminar el alumno con DNI '987654321'
DELETE FROM Alumno
WHERE dni = '987654321';

-- Eliminar el alumno con DNI '555555555'
DELETE FROM Alumno
WHERE dni = '555555555';

-- Eliminar el alumno con DNI '999888777'
DELETE FROM Alumno
WHERE dni = '999888777';

-- Eliminar el alumno con DNI '111222333'
DELETE FROM Alumno
WHERE dni = '111222333';

-- Eliminar el alumno con DNI '222333444'
DELETE FROM Alumno
WHERE dni = '222333444';

-- Eliminar el alumno con DNI '333444555'
DELETE FROM Alumno
WHERE dni = '333444555';

-- Eliminar el alumno con DNI '444555666'
DELETE FROM Alumno
WHERE dni = '444555666';

-- Eliminar el alumno con DNI '555666777'
DELETE FROM Alumno
WHERE dni = '555666777';

-- Eliminar el alumno con DNI '666777888'
DELETE FROM Alumno
WHERE dni = '666777888';

-- Eliminar la empresa con CIF '123456789'
DELETE FROM Empresa
WHERE cif = '123456789';

-- Eliminar la empresa con CIF '987654321'
DELETE FROM Empresa
WHERE cif = '987654321';

-- Eliminar la empresa con CIF '555555555'
DELETE FROM Empresa
WHERE cif = '555555555';

-- Eliminar la empresa con CIF '999888777'
DELETE FROM Empresa
WHERE cif = '999888777';

-- Eliminar la empresa con CIF '111222333'
DELETE FROM Empresa
WHERE cif = '111222333';

-- Eliminar la empresa con CIF '222333444'
DELETE FROM Empresa
WHERE cif = '222333444';

-- Eliminar la empresa con CIF '333444555'
DELETE FROM Empresa
WHERE cif = '333444555';

-- Eliminar la empresa con CIF '444555666'
DELETE FROM Empresa
WHERE cif = '444555666';

-- Eliminar la empresa con CIF '555666777'
DELETE FROM Empresa
WHERE cif = '555666777';

-- Eliminar la empresa con CIF '666777888'
DELETE FROM Empresa
WHERE cif = '666777888';
