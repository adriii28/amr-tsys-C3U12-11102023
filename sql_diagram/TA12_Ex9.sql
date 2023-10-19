CREATE DATABASE RecetasCocina;

USE RecetasCocina;

CREATE TABLE Ingredientes(
id_ingrediente int auto_increment,
tipo_ingrediente varchar(20),
nombre_ingrediente varchar(20),
PRIMARY KEY (id_ingrediente)
);

CREATE TABLE Cocinero(
dni varchar(20),
nombre varchar(20) not null,
PRIMARY KEY (dni)
);

CREATE TABLE Receta(
nombre_receta varchar(20),
dificultad varchar(20),
num_personas varchar(20),
tiempo_preparacion int,
dni_cocinero varchar(20) not null,
PRIMARY KEY (nombre_receta),
FOREIGN KEY (dni_cocinero) REFERENCES Cocinero(dni)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Tener (
id_ingrediente int,
nombre_receta varchar(20),
cantidad int ,
PRIMARY KEY (id_ingrediente, nombre_receta),
FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (nombre_receta) REFERENCES Receta(nombre_receta)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Utensilios (
id int auto_increment,
nombre_utensilio varchar(20) not null,
PRIMARY KEY (id)	
);

CREATE TABLE Usar (
nombre_receta varchar(20),
id_utensilio int,
cantidad int not null,
PRIMARY KEY (nombre_receta, id_utensilio),
FOREIGN KEY (nombre_receta) REFERENCES Receta(nombre_receta)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_utensilio) REFERENCES Utensilios(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

