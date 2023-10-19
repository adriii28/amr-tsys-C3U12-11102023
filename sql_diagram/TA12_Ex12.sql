CREATE DATABASE EmpresaSoftware;

USE EmpresaSoftware;

CREATE TABLE Profesion (
id int auto_increment,
codigo_profesion int not null,
nombre varchar(20) not null,
PRIMARY KEY (id)
);

CREATE TABLE Trabajador (
dni varchar(20),
nombre varchar(20) not null,
apellidos varchar(20) not null,
PRIMARY KEY (dni)
);

CREATE TABLE Tener (
id_profesion int,
dni_trabajador varchar(20),
PRIMARY KEY (id_profesion,dni_trabajador),
FOREIGN KEY (id_profesion) REFERENCES Profesion(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (dni_trabajador) REFERENCES Trabajador(dni)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Proyecto(
id int auto_increment,
nombre varchar(20) not null,
fecha_inicio date,
fecha_fin date,
PRIMARY KEY (id)
);

CREATE TABLE Realizar(
dni_trabajador varchar(20),
id_proyecto int,
horas_trabajadas time,
PRIMARY KEY (dni_trabajador,id_proyecto),
FOREIGN KEY (dni_trabajador) REFERENCES Trabajador(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Empresa (
cif varchar(20),
nombre varchar(20) not null,
direccion varchar(20),
codigo_interno int not null,
telefono int,
PRIMARY KEY (cif)
);

CREATE TABLE Realiza (
id_proyecto int,
cif_empresa varchar(20),
PRIMARY KEY (id_proyecto,cif_empresa),
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (cif_empresa) REFERENCES Empresa(cif)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Fecha (
id int auto_increment,
fecha date,
PRIMARY KEY (id)
);

CREATE TABLE Asocia (
id_fecha int,
id_proyecto int,
PRIMARY KEY (id_fecha,id_proyecto),
FOREIGN KEY (id_fecha) REFERENCES Fecha(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_proyecto) REFERENCES Proyecto(id)
ON DELETE CASCADE ON UPDATE CASCADE
);
