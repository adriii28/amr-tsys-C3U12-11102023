CREATE DATABASE EmpresaComida;

USE EmpresaComida;

drop table EstarACargo;
drop table Pinche;
drop table Cocinar;
drop table Cocinero;

CREATE TABLE Pinche (
dni varchar(20),
nombre varchar(20),
apellidos varchar(20),
fecha_nacimiento date,
num_seguridad_social int,
telefono_fijo int,
telefono_movil int,
PRIMARY KEY (dni)
);

CREATE TABLE Cocinero (
dni varchar(20),
nombre varchar(20),
apellidos varchar(20),
fecha_nacimiento date,
num_seguridad_social int,
telefono_fijo int,
telefono_movil int,
años_servicio varchar(20),
PRIMARY KEY (dni)
);

CREATE TABLE EstarACargo (
dni_empleado_cocinero varchar(20),
dni_empleado_pinche varchar(20),
PRIMARY KEY (dni_empleado_cocinero, dni_empleado_pinche),
FOREIGN KEY (dni_empleado_cocinero) REFERENCES Cocinero(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (dni_empleado_pinche) REFERENCES Pinche(dni)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Plato(
id int auto_increment,
nombre varchar(20),
precio double,
tipo varchar(20),
PRIMARY KEY (id)
);


CREATE TABLE Cocinar (
dni_empleado_cocinero varchar(20),
id_plato int,
PRIMARY KEY (dni_empleado_cocinero, id_plato),
FOREIGN KEY (dni_empleado_cocinero) REFERENCES Cocinero(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_plato) REFERENCES Plato(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Almacen(
id int auto_increment,
nombre varchar(20),
num_almacen int,
descripcion varchar(200),
PRIMARY KEY (id)
);
 
CREATE TABLE Estante(
id int auto_increment,
letras varchar(20),
tamano_centimetros int,
id_almacen int,
PRIMARY KEY (id),
FOREIGN KEY (id_almacen) REFERENCES Almacen(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

Drop table Estante;
drop table Ingredientes;
drop table Contiene;

CREATE TABLE Ingredientes(
id int auto_increment,
nombre varchar(20),
id_estante int,
PRIMARY KEY (id),
FOREIGN KEY (id_estante) REFERENCES Estante(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Contiene (
id_plato int,
id_ingrediente int,
cantidad int,
PRIMARY KEY (id_plato, id_ingrediente),
FOREIGN KEY (id_plato) REFERENCES Plato(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id)
ON DELETE CASCADE ON UPDATE CASCADE
);
