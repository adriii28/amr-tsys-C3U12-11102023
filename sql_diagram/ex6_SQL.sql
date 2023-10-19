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