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

-- Insertar contrato 1
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C1', '2023-01-01', '2023-12-31');

-- Insertar contrato 2
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C2', '2023-02-01', '2023-11-30');

-- Insertar contrato 3
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C3', '2023-03-01', '2023-10-31');

-- Insertar contrato 4
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C4', '2023-04-01', '2023-09-30');

-- Insertar contrato 5
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C5', '2023-05-01', '2023-08-31');

-- Insertar contrato 6
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C6', '2023-06-01', '2023-07-31');

-- Insertar contrato 7
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C7', '2023-07-01', '2023-07-31');

-- Insertar contrato 8
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C8', '2023-08-01', '2023-08-31');

-- Insertar contrato 9
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C9', '2023-09-01', '2023-09-30');

-- Insertar contrato 10
INSERT INTO Contrato (id, fecha_inicio, fecha_final)
VALUES ('C10', '2023-10-01', '2023-10-31');

-- Insertar departamento 1
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D1', 'Departamento 1', 'Coordinador 1');

-- Insertar departamento 2
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D2', 'Departamento 2', 'Coordinador 2');

-- Insertar departamento 3
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D3', 'Departamento 3', 'Coordinador 3');

-- Insertar departamento 4
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D4', 'Departamento 4', 'Coordinador 4');

-- Insertar departamento 5
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D5', 'Departamento 5', 'Coordinador 5');

-- Insertar departamento 6
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D6', 'Departamento 6', 'Coordinador 6');

-- Insertar departamento 7
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D7', 'Departamento 7', 'Coordinador 7');

-- Insertar departamento 8
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D8', 'Departamento 8', 'Coordinador 8');

-- Insertar departamento 9
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D9', 'Departamento 9', 'Coordinador 9');

-- Insertar departamento 10
INSERT INTO Departamento (codigo_departamento, nombre, coordinador)
VALUES ('D10', 'Departamento 10', 'Coordinador 10');

-- Insertar nómina 1
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-01-31', '2500 USD');

-- Insertar nómina 2
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-02-28', '2800 USD');

-- Insertar nómina 3
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-03-31', '2700 USD');

-- Insertar nómina 4
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-04-30', '3000 USD');

-- Insertar nómina 5
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-05-31', '2600 USD');

-- Insertar nómina 6
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-06-30', '2900 USD');

-- Insertar nómina 7
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-07-31', '3100 USD');

-- Insertar nómina 8
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-08-31', '2750 USD');

-- Insertar nómina 9
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-09-30', '2650 USD');

-- Insertar nómina 10
INSERT INTO Nomina (fecha, salario)
VALUES ('2023-10-31', '3200 USD');

-- Insertar empleado 1
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('111111111', 'NSS1', 'CT1', 'Empleado 1', 'Apellido 1', '1111111111', 'Dirección 1', 'D1', 1);

-- Insertar empleado 2
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('222222222', 'NSS2', 'CT2', 'Empleado 2', 'Apellido 2', '2222222222', 'Dirección 2', 'D2', 2);

-- Insertar empleado 3
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('333333333', 'NSS3', 'CT3', 'Empleado 3', 'Apellido 3', '3333333333', 'Dirección 3', 'D3', 3);

-- Insertar empleado 4
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('444444444', 'NSS4', 'CT4', 'Empleado 4', 'Apellido 4', '4444444444', 'Dirección 4', 'D4', 4);

-- Insertar empleado 5
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('555555555', 'NSS5', 'CT5', 'Empleado 5', 'Apellido 5', '5555555555', 'Dirección 5', 'D5', 5);

-- Insertar empleado 6
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('666666666', 'NSS6', 'CT6', 'Empleado 6', 'Apellido 6', '6666666666', 'Dirección 6', 'D6', 6);

-- Insertar empleado 7
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('777777777', 'NSS7', 'CT7', 'Empleado 7', 'Apellido 7', '7777777777', 'Dirección 7', 'D7', 7);

-- Insertar empleado 8
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('888888888', 'NSS8', 'CT8', 'Empleado 8', 'Apellido 8', '8888888888', 'Dirección 8', 'D8', 8);

-- Insertar empleado 9
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('999999999', 'NSS9', 'CT9', 'Empleado 9', 'Apellido 9', '9999999999', 'Dirección 9', 'D9', 9);

-- Insertar empleado 10
INSERT INTO Empleado (dni, num_seg_social, codigo_trabajador, nombre, apellido, telefono, direccion, codigo_departamento, id_nomina)
VALUES ('101010101', 'NSS10', 'CT10', 'Empleado 10', 'Apellido 10', '1010101010', 'Dirección 10', 'D10', 10);

-- Insertar relación CumpleContratoEmpleado 1
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat1', '111111111', 'C1');

-- Insertar relación CumpleContratoEmpleado 2
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat2', '222222222', 'C2');

-- Insertar relación CumpleContratoEmpleado 3
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat3', '333333333', 'C3');

-- Insertar relación CumpleContratoEmpleado 4
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat4', '444444444', 'C4');

-- Insertar relación CumpleContratoEmpleado 5
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat5', '555555555', 'C5');

-- Insertar relación CumpleContratoEmpleado 6
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat6', '666666666', 'C6');

-- Insertar relación CumpleContratoEmpleado 7
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat7', '777777777', 'C7');

-- Insertar relación CumpleContratoEmpleado 8
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat8', '888888888', 'C8');

-- Insertar relación CumpleContratoEmpleado 9
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat9', '999999999', 'C9');

-- Insertar relación CumpleContratoEmpleado 10
INSERT INTO CumpleContratoEmpleado (codigo_categoria, dni_empleado, id_contrato)
VALUES ('Cat10', '101010101', 'C10');

-- Insertar relación ResponsableEmpleado 1
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('111111111', '222222222');

-- Insertar relación ResponsableEmpleado 2
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('333333333', '444444444');

-- Insertar relación ResponsableEmpleado 3
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('555555555', '666666666');

-- Insertar relación ResponsableEmpleado 4
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('777777777', '888888888');

-- Insertar relación ResponsableEmpleado 5
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('999999999', '101010101');

-- Insertar relación ResponsableEmpleado 6
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('222222222', '333333333');

-- Insertar relación ResponsableEmpleado 7
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('444444444', '555555555');

-- Insertar relación ResponsableEmpleado 8
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('666666666', '777777777');

-- Insertar relación ResponsableEmpleado 9
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('888888888', '999999999');

-- Insertar relación ResponsableEmpleado 10
INSERT INTO ResponsableEmpleado (dni_empleado_responsable, dni_novate_empleado)
VALUES ('101010101', '111111111');


-- -----------------------------------UPDATES------------------------------------------------
-- Actualizar la fecha de inicio del contrato 1
UPDATE Contrato
SET fecha_inicio = '2023-01-15'
WHERE id = 'C1';

-- Actualizar la fecha de finalización del contrato 2
UPDATE Contrato
SET fecha_final = '2023-11-15'
WHERE id = 'C2';

-- Actualizar el nombre del departamento 1
UPDATE Departamento
SET nombre = 'Nuevo Nombre 1'
WHERE codigo_departamento = 'D1';

-- Actualizar el coordinador del departamento 2
UPDATE Departamento
SET coordinador = 'Nuevo Coordinador 2'
WHERE codigo_departamento = 'D2';

-- Actualizar el salario de la nómina 1
UPDATE Nomina
SET salario = '2600 USD'
WHERE id = 1;

-- Actualizar la fecha de la nómina 2
UPDATE Nomina
SET fecha = '2023-02-27'
WHERE id = 2;

-- Actualizar el nombre del empleado 1
UPDATE Empleado
SET nombre = 'Nuevo Nombre 1'
WHERE dni = '111111111';

-- Actualizar el teléfono del empleado 2
UPDATE Empleado
SET telefono = '2222222222'
WHERE dni = '222222222';

-- -----------------------------------DELETES------------------------------------------------
-- Eliminar el contrato 3
DELETE FROM Contrato
WHERE id = 'C3';

-- Eliminar el contrato 4
DELETE FROM Contrato
WHERE id = 'C4';

-- Eliminar el departamento 3
DELETE FROM Departamento
WHERE codigo_departamento = 'D3';

-- Eliminar el departamento 4
DELETE FROM Departamento
WHERE codigo_departamento = 'D4';

-- Eliminar la nómina 3
DELETE FROM Nomina
WHERE id = 3;

-- Eliminar la nómina 4
DELETE FROM Nomina
WHERE id = 4;

-- Eliminar el empleado 3
DELETE FROM Empleado
WHERE dni = '333333333';

-- Eliminar el empleado 4
DELETE FROM Empleado
WHERE dni = '444444444';
