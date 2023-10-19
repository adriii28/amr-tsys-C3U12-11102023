CREATE DATABASE Guerra;
USE Guerra;

CREATE TABLE Guerra (
  id_guerra varchar(32) PRIMARY KEY ,
  nombre varchar(120) NOT NULL,
  anio_empieza int NOT NULL,
  anio_termina int,
  CHECK (anio_empieza <= anio_termina )
);

CREATE TABLE Bando (
  id_bando varchar(32) PRIMARY KEY,
  ganador varchar(120)
);


CREATE TABLE Pais (
  nombre varchar(120) PRIMARY KEY 
);


CREATE TABLE Independencia (
  id int auto_increment PRIMARY KEY,
  anio_inicio int NOT NULL,
  anio_finalizacion int,
  nombre_pais varchar(120) NOT NULL,
  FOREIGN KEY (nombre_pais) REFERENCES Pais (nombre) on delete cascade on update cascade,
  CHECK (anio_inicio <= anio_finalizacion )
);

CREATE TABLE Pertenece (
  nombre_pais varchar(120),
  id_bando_bando varchar(32),
  abandona date,
  une date NOT NULL,
  FOREIGN KEY (nombre_pais) REFERENCES Pais (nombre) on delete cascade on update cascade,
  FOREIGN KEY (id_bando_bando) REFERENCES Bando (id_bando) on delete cascade on update cascade,
  PRIMARY KEY (nombre_pais, id_bando_bando)
);


CREATE TABLE ParticipaGuerraBando (
  id_guerra_guerra varchar(32),
  id_bando_bando varchar(32),
  FOREIGN KEY (id_guerra_guerra) REFERENCES Guerra (id_guerra) on delete cascade on update cascade,
  FOREIGN KEY (id_bando_bando) REFERENCES Bando (id_bando) on delete cascade on update cascade,
  PRIMARY KEY (id_guerra_guerra, id_bando_bando)
);