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
  CHECK (fecha_tope  <= fecha_inicio )
);