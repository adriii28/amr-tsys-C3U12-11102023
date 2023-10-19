CREATE DATABASE Almacen_v1;
USE Almacen_v1;

CREATE TABLE Almacen (
  numero int auto_increment PRIMARY KEY,
  descripcion varchar(150) NOT NULL,
  direccion varchar(150) NOT NULL
);

CREATE TABLE Estanteria (
  id_estanteria varchar(3) PRIMARY KEY,
  numero_almacen int,
  FOREIGN KEY (numero_almacen) references Almacen (numero) on delete cascade on update cascade
  );

CREATE TABLE Pieza (
  numero int auto_increment,
  tipo varchar(30) NOT NULL,
  descripcion varchar(150) NOT NULL,
  precio int NOT NULL,
  id_estanteria_estanteria varchar(3) NOT NULL,
  FOREIGN KEY (id_estanteria_estanteria) references Estanteria (id_estanteria) on delete cascade on update cascade,
  PRIMARY KEY (numero , tipo)
);

CREATE TABLE CompuestaPieza (
  numero_pieza int NOT NULL,
  tipo_pieza varchar(30) NOT NULL,
  ref_numero_pieza int NOT NULL,
  ref_tipo_pieza varchar(30) NOT NULL,
  FOREIGN KEY (numero_pieza , tipo_pieza ) REFERENCES Pieza (numero, tipo)  on delete cascade on update cascade,
  FOREIGN KEY (ref_numero_pieza , ref_tipo_pieza  ) REFERENCES Pieza (numero, tipo)  on delete cascade on update cascade,
  PRIMARY KEY (numero_pieza, tipo_pieza , ref_numero_pieza , ref_tipo_pieza)
);