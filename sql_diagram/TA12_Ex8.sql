CREATE DATABASE Vuelos;

USE Vuelos;

CREATE TABLE Clientes(
dni varchar(20),
nombre varchar(20),
apellidos varchar(20),
direccion varchar(20),
tarjeta_credito int,
PRIMARY KEY (dni)
);

CREATE TABLE Aeropuerto (
id_aero int auto_increment,
nombre varchar(20),
localidad varchar(20),
pais varchar(20),
PRIMARY KEY (id_aero)
);

CREATE TABLE Vuelo (
id_vuelo int auto_increment,
hora_salida time,
hora_llegada time,
fecha_salida date,
fecha_llegada date,
id_aerop_salida int,
id_aerop_llegada int,
PRIMARY KEY (id_vuelo),
FOREIGN KEY (id_aerop_salida) REFERENCES Aeropuerto(id_aero)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_aerop_llegada) REFERENCES Aeropuerto(id_aero)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE TarjetaEmbarque(
num_tarjeta_embarque int auto_increment,
dni_cliente varchar(20),
id_vuelo int,
PRIMARY KEY (num_tarjeta_embarque),
FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Plazas(
id_plaza int auto_increment,
fecha_reserva date,
PRIMARY KEY (id_plaza)
);

CREATE TABLE Avion(
id_avion int auto_increment,
num_plazas int,
id_plaza int,
id_vuelo int,
PRIMARY KEY (id_avion),
FOREIGN KEY (id_plaza) REFERENCES Plazas(id_plaza)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
ON DELETE CASCADE ON UPDATE CASCADE
);

