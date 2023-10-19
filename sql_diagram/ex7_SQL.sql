CREATE DATABASE Organigrama;
USE Organigrama;

CREATE TABLE Contrato (
  id varchar(50) PRIMARY KEY,
  fecha_inicio date NOT NULL,
  fecha_final date NOT NULL
);

CREATE TABLE Departamento (
  codigo_departamento varchar(50) PRIMARY KEY,
  nombre varchar(50) NOT NULL,
  coordinador varchar(50) NOT NULL
);

CREATE TABLE Nomina (
  id int auto_increment PRIMARY KEY,
  fecha date NOT NULL,
  salario varchar(50) NOT NULL
);

CREATE TABLE Empleado (
  dni varchar(9) PRIMARY KEY,
  num_seg_social varchar(50) NOT NULL,
  codigo_trabajador varchar(50) NOT NULL,
  nombre varchar(50) NOT NULL,
  apellido varchar(50) NOT NULL,
  telefono varchar(50) NOT NULL,
  direccion varchar(50) NOT NULL,
  codigo_departamento varchar(50) NOT NULL,
  id_nomina int NOT NULL,
  FOREIGN KEY (codigo_departamento) REFERENCES Departamento (codigo_departamento) on delete cascade on update cascade,
  FOREIGN KEY (id_nomina) REFERENCES Nomina (id) on delete cascade on update cascade
);

CREATE TABLE CumpleContratoEmpleado  (
  codigo_categoria varchar(50) NOT NULL,
  dni_empleado varchar(9) NOT NULL,
  id_contrato  varchar(50) NOT NULL,
  FOREIGN KEY (dni_empleado) REFERENCES Empleado (dni) on delete cascade on update cascade,
  FOREIGN KEY (id_contrato) REFERENCES Contrato (id) on delete cascade on update cascade,
  PRIMARY KEY (dni_empleado,id_contrato)
);

CREATE TABLE ResponsableEmpleado (
  dni_empleado_responsable varchar(9) NOT NULL,
  dni_novate_empleado varchar(9) NOT NULL,
  FOREIGN KEY (dni_empleado_responsable) REFERENCES Empleado (dni) on delete cascade on update cascade,
  FOREIGN KEY (dni_novate_empleado) REFERENCES Empleado (dni) on delete cascade on update cascade,
  PRIMARY KEY (dni_empleado_responsable,dni_novate_empleado)
);












