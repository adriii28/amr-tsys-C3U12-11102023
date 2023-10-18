CREATE DATABASE Futbol;

USE Futbol;

CREATE TABLE Liga (
nombre varchar(20),
fecha_inicio date,
fecha_fin date,
PRIMARY KEY (nombre)
);

CREATE TABLE Partidos (
id_partido int auto_increment,
estadio varchar(20),
equipo1 varchar(20),
equipo2 varchar(20),
fecha_partido date,
nombre_liga varchar(20),
PRIMARY KEY (id_partido),
FOREIGN KEY (nombre_liga) REFERENCES Liga(nombre)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Equipo (
id int auto_increment,
nombre_equipo varchar(20),
pais varchar(20),
entrendador varchar(20),
PRIMARY KEY (id)
);

CREATE TABLE Juega (
id_partido int,
id_equipo int,
PRIMARY KEY (id_partido,id_equipo),
FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_equipo) REFERENCES Equipo(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Jugador (
dni varchar(20),
nombre varchar(20),
posicion varchar(20),
fecha_nacimiento date,
id_equipo int,
PRIMARY KEY (dni),
FOREIGN KEY (id_equipo) REFERENCES Equipo(id)
ON DELETE CASCADE ON UPDATE CASCADE
);


