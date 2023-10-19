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
dni_profesor varchar(8) not null,
FOREIGN KEY (dni_profesor) REFERENCES Profesor(dni) on delete cascade on update cascade,
CHECK (fecha_inicio < fecha_final)
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

