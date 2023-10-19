CREATE DATABASE Accidentes;
USE Accidentes;

CREATE TABLE Pais(
id int auto_increment PRIMARY KEY,
nombre varchar(20),
extension int,
poblacion int
);

CREATE TABLE Sitio(
id int auto_increment PRIMARY KEY
);

CREATE TABLE Montaña(
altura int,
id_sitio int, 
FOREIGN KEY (id_sitio) REFERENCES Sitio(id)
);

CREATE TABLE Lago(
extension int,
id_sitio int, 
FOREIGN KEY (id_sitio) REFERENCES Sitio(id)
);

CREATE TABLE Rio(
longitud int,
id_sitio int, 
FOREIGN KEY (id_sitio) REFERENCES Sitio(id)
);

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

CREATE TABLE Localidad(
id int auto_increment PRIMARY KEY,
nombre varchar(20)
);

CREATE TABLE PasarLocalidadRio(
id_sitio_rio int , 
id_localidad int,
FOREIGN KEY (id_sitio_rio) REFERENCES Rio(id_sitio),
FOREIGN KEY (id_localidad) REFERENCES Localidad(id)
);

CREATE TABLE ContieneLocalidadPais(
id_localidad int , 
id_pais int,
FOREIGN KEY (id_localidad) REFERENCES Localidad(id),
FOREIGN KEY (id_pais) REFERENCES Pais(id)
);

