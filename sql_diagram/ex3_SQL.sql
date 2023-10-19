CREATE DATABASE Geografia;
USE Geografia;

CREATE TABLE ComunidadAutonoma(
nombre varchar(20) PRIMARY KEY,
poblacion int not null,
superficie varchar(20) NOT NULL
);

CREATE TABLE Provincia(
codigo_provincial varchar(50) PRIMARY KEY,
nombre varchar(50) NOT NULL,
poblacion int,
superficie varchar(20),
nom_comunidad_autonoma varchar(20) NOT NULL,
FOREIGN KEY (nom_comunidad_autonoma) REFERENCES ComunidadAutonoma(nombre)  on delete cascade on update cascade
);

CREATE TABLE Localidad(
id varchar(20) PRIMARY KEY,
nombre varchar(100) NOT NULL,
poblacion int,
codigo_provincial_provincia varchar(50) NOT NULL,
FOREIGN KEY (codigo_provincial_provincia) REFERENCES Provincia(codigo_provincial) on delete cascade on update cascade
);

CREATE TABLE CapitalLocalidad(
id_localidad varchar(20),
codigo_provincial_provincia varchar(50),
FOREIGN KEY (id_localidad) REFERENCES Localidad(id),
FOREIGN KEY (codigo_provincial_provincia) REFERENCES Provincia(codigo_provincial),
PRIMARY KEY(id_localidad,codigo_provincial_provincia)
);

CREATE TABLE CapitalProvincia(
nombre_comunidad_autonoma varchar(20),
codigo_provincial_provincia varchar(50),
FOREIGN KEY (nombre_comunidad_autonoma) REFERENCES ComunidadAutonoma(nombre) on delete cascade on update cascade,
FOREIGN KEY (codigo_provincial_provincia) REFERENCES Provincia(codigo_provincial) on delete cascade on update cascade,
PRIMARY KEY(nombre_comunidad_autonoma,codigo_provincial_provincia)
);