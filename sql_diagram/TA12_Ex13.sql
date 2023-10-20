CREATE DATABASE EmpresaComida;

USE EmpresaComida;

CREATE TABLE Pinche (
dni varchar(20),
nombre varchar(20) not null,
apellidos varchar(20) not null,
fecha_nacimiento date,
num_seguridad_social int not null,
telefono_fijo int,
telefono_movil int,
PRIMARY KEY (dni)
);

SELECT * FROM Pinche;

INSERT INTO Pinche (dni, nombre, apellidos, fecha_nacimiento, num_seguridad_social, telefono_fijo, telefono_movil) VALUES
('11111111A', 'Juan', 'Pérez', '1990-05-15', 123456789, 912345678, 612345678),
('22222222B', 'María', 'López', '1985-08-20', 987654321, 912345679, 612345679),
('33333333C', 'Luis', 'Gómez', '1988-03-10', 555555555, 912345680, 612345680),
('44444444D', 'Ana', 'Martínez', '1995-12-05', 777777777, 912345681, 612345681),
('55555555E', 'Pedro', 'Ramírez', '1992-02-25', 888888888, 912345682, 612345682),
('66666666F', 'Carmen', 'Fernández', '1980-07-30', 111111111, 912345683, 612345683),
('77777777G', 'David', 'Torres', '1997-06-18', 222222222, 912345684, 612345684),
('88888888H', 'Elena', 'Sánchez', '1998-04-21', 333333333, 912345685, 612345685),
('99999999I', 'Sergio', 'García', '1983-10-12', 444444444, 912345686, 612345686),
('10101010J', 'Laura', 'Pérez', '1991-09-08', 666666666, 912345687, 612345687);

UPDATE Pinche SET telefono_fijo = 987654321 WHERE dni = '11111111A' ;
UPDATE Pinche SET telefono_movil = 777777777 WHERE dni = '22222222B';
UPDATE Pinche SET num_seguridad_social = 555555555 WHERE dni = '33333333C';

DELETE FROM Pinche WHERE dni = '88888888H';
DELETE FROM Pinche WHERE dni = '99999999I';
DELETE FROM Pinche WHERE dni = '10101010J';


CREATE TABLE Cocinero (
dni varchar(20),
nombre varchar(20) not null,
apellidos varchar(20) not null,
fecha_nacimiento date,
num_seguridad_social int not null,
telefono_fijo int,
telefono_movil int,
años_servicio varchar(20),
PRIMARY KEY (dni)
);

SELECT * FROM Cocinero;

INSERT INTO Cocinero (dni, nombre, apellidos, fecha_nacimiento, num_seguridad_social, telefono_fijo, telefono_movil, años_servicio)VALUES
('11111111A', 'Carlos', 'González', '1987-04-12', 123456789, 912345678, 612345678, '10 años'),
('22222222B', 'María', 'López', '1990-09-20', 987654321, 912345679, 612345679, '8 años'),
('33333333C', 'Luis', 'Martínez', '1985-03-30', 555555555, 912345680, 612345680, '12 años'),
('44444444D', 'Ana', 'Fernández', '1993-12-15', 777777777, 912345681, 612345681, '7 años'),
('55555555E', 'Pedro', 'Sánchez', '1988-08-05', 888888888, 912345682, 612345682, '15 años'),
('66666666F', 'Carmen', 'Ramírez', '1981-07-28', 111111111, 912345683, 612345683, '20 años'),
('77777777G', 'David', 'Pérez', '1996-06-10', 222222222, 912345684, 612345684, '6 años'),
('88888888H', 'Elena', 'García', '1984-04-21', 333333333, 912345685, 612345685, '18 años'),
('99999999I', 'Sergio', 'López', '1994-10-12', 444444444, 912345686, 612345686, '9 años'),
('10101010J', 'Laura', 'Torres', '1989-09-08', 666666666, 912345687, 612345687, '14 años');


UPDATE Cocinero SET telefono_fijo = 999999999 WHERE dni = '10101010J';
UPDATE Cocinero SET telefono_movil = 777777777 WHERE dni = '99999999I';
UPDATE Cocinero SET años_servicio = '11 años' WHERE dni = '88888888H';

DELETE FROM Cocinero WHERE dni = '10101010J';
DELETE FROM Cocinero WHERE dni = '99999999I';
DELETE FROM Cocinero WHERE dni = '88888888H';


CREATE TABLE EstarACargo (
dni_empleado_cocinero varchar(20),
dni_empleado_pinche varchar(20),
PRIMARY KEY (dni_empleado_cocinero, dni_empleado_pinche),
FOREIGN KEY (dni_empleado_cocinero) REFERENCES Cocinero(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (dni_empleado_pinche) REFERENCES Pinche(dni)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM EstarACargo;

INSERT INTO EstarACargo (dni_empleado_cocinero, dni_empleado_pinche) VALUES
('11111111A', '11111111A'),
('22222222B', '22222222B'),
('33333333C', '33333333C'),
('44444444D', '44444444D'),
('55555555E', '55555555E'),
('66666666F', '66666666F'),
('77777777G', '77777777G'),
('88888888H', '88888888H'),
('99999999I', '99999999I'),
('10101010J', '10101010J');

DELETE FROM EstarACargo WHERE dni_empleado_cocinero = '77777777G' ;
DELETE FROM EstarACargo WHERE dni_empleado_cocinero = '88888888H';
DELETE FROM EstarACargo WHERE dni_empleado_cocinero = '99999999I' ;

CREATE TABLE Plato(
id int auto_increment,
nombre varchar(20) not null,
precio double not null,
tipo varchar(20),
PRIMARY KEY (id)
);

SELECT * FROM Plato;

INSERT INTO Plato (nombre, precio, tipo) VALUES
('Pizza Margarita', 9.99, 'Pizza'),
('Hamburguesa Clásica', 7.99, 'Hamburguesa'),
('Sopa de Tomate', 4.99, 'Sopa'),
('Pasta Alfredo', 11.99, 'Pasta'),
('Ensalada César', 6.99, 'Ensalada'),
('Filete de Salmón', 15.99, 'Pescado'),
('Taco de Carne', 8.99, 'Taco'),
('Pollo a la Parrilla', 10.99, 'Pollo'),
('Sushi de Salmón', 14.99, 'Sushi'),
('Helado de Chocolate', 3.99, 'Postre');

UPDATE Plato SET precio = 12.99 WHERE id = 1; 
UPDATE Plato SET tipo = 'Hamburgesa' WHERE id = 2;
UPDATE Plato SET nombre = 'Sopa de Cebolla' WHERE id = 3;

DELETE FROM Plato WHERE id = 10;
DELETE FROM Plato WHERE id = 9;
DELETE FROM Plato WHERE id = 8;


CREATE TABLE Cocinar (
dni_empleado_cocinero varchar(20),
id_plato int,
PRIMARY KEY (dni_empleado_cocinero, id_plato),
FOREIGN KEY (dni_empleado_cocinero) REFERENCES Cocinero(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_plato) REFERENCES Plato(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Cocinar;

INSERT INTO Cocinar (dni_empleado_cocinero, id_plato) VALUES
('11111111A', 1),
('22222222B', 2),
('33333333C', 3),
('44444444D', 4),
('55555555E', 5),
('66666666F', 6),
('77777777G', 7),
('88888888H', 8),
('99999999I', 9),
('10101010J', 10);


DELETE FROM Cocinar WHERE id_plato = 8;
DELETE FROM Cocinar WHERE id_plato = 9;
DELETE FROM Cocinar WHERE id_plato = 10;


CREATE TABLE Almacen(
id int auto_increment,
nombre varchar(20) not null,
num_almacen int not null,
descripcion varchar(200),
PRIMARY KEY (id)
);

SELECT * FROM Almacen;

INSERT INTO Almacen (nombre, num_almacen, descripcion) VALUES
('Almacén A', 1, 'Almacén de productos secos'),
('Almacén B', 2, 'Almacén de productos frescos'),
('Almacén C', 3, 'Almacén de bebidas'),
('Almacén D', 4, 'Almacén de productos congelados'),
('Almacén E', 5, 'Almacén de suministros de cocina'),
('Almacén F', 6, 'Almacén de productos enlatados'),
('Almacén G', 7, 'Almacén de limpieza'),
('Almacén H', 8, 'Almacén de equipo de restaurante'),
('Almacén I', 9, 'Almacén de utensilios de cocina'),
('Almacén J', 10, 'Almacén de decoración y mobiliario');

UPDATE Almacen SET descripcion = 'Nuevo almacén de suministros' WHERE id = 3;
UPDATE Almacen SET num_almacen = 12 WHERE id = 3;
UPDATE Almacen SET nombre = 'Almacén Y' WHERE id = 3;

DELETE FROM Almacen WHERE id = 4;
DELETE FROM Almacen WHERE id = 5;
DELETE FROM Almacen WHERE id = 6;

 
CREATE TABLE Estante(
id int auto_increment,
letras varchar(20),
tamano_centimetros int,
id_almacen int not null,
PRIMARY KEY (id),
FOREIGN KEY (id_almacen) REFERENCES Almacen(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Estante;

INSERT INTO Estante (letras, tamano_centimetros, id_almacen) VALUES
('A', 120, 1),
('B', 90, 2),
('C', 150, 3),
('D', 60, 4),
('E', 200, 5),
('F', 100, 6),
('G', 80, 7),
('H', 110, 8),
('I', 70, 9),
('J', 140, 10);
    
UPDATE Estante SET tamano_centimetros = 130 WHERE id = 1;
UPDATE Estante SET letras = 'k', id_almacen = 6 WHERE id = 2;
UPDATE Estante SET tamano_centimetros = 170, id_almacen = 7 WHERE id = 3;

DELETE FROM Estante WHERE id = 8;
DELETE FROM Estante WHERE id = 9;
DELETE FROM Estante WHERE id = 10;


CREATE TABLE Ingredientes(
id int auto_increment,
nombre varchar(20),
id_estante int not null,
PRIMARY KEY (id),
FOREIGN KEY (id_estante) REFERENCES Estante(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Ingredientes;

INSERT INTO Ingredientes (nombre, id_estante) VALUES
('Sal', 1),
('Azúcar', 2),
('Harina', 1),
('Aceite de Oliva', 3),
('Cebolla', 2),
('Tomate', 3),
('Pimienta', 1),
('Queso', 4),
('Lechuga', 2),
('Pasta', 5);

UPDATE Ingredientes SET nombre = 'Vinagre' WHERE id = 1;
UPDATE Ingredientes SET nombre = 'Chocolate', id_estante = 6 WHERE id = 2;
UPDATE Ingredientes SET nombre = 'Maíz', id_estante = 7 WHERE id = 3;

DELETE FROM Ingredientes WHERE id = 4;
DELETE FROM Ingredientes WHERE id = 5;
DELETE FROM Ingredientes WHERE id = 6;


CREATE TABLE Contiene (
id_plato int,
id_ingrediente int,
cantidad varchar(50),
PRIMARY KEY (id_plato, id_ingrediente),
FOREIGN KEY (id_plato) REFERENCES Plato(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Contiene;

INSERT INTO Contiene (id_plato, id_ingrediente, cantidad) VALUES
(1, 10, '200g'),
(2, 9, '100g'),
(3, 8, '150g'),
(4, 7, '75g'),
(5, 6, '1 unidad'),
(6, 5, '2 unidades'),
(7, 4, '300ml'),
(8, 3, '50g'),
(9, 2, '1 taza'),
(10, 1, '3 cucharadas');


UPDATE Contiene SET cantidad = '250g' WHERE id_plato = 1;
UPDATE Contiene SET cantidad = '120g' WHERE id_plato = 2;
UPDATE Contiene SET cantidad = '180g' WHERE id_plato = 3;

DELETE FROM Contiene WHERE id_plato = 3;
DELETE FROM Contiene WHERE id_plato = 4;
DELETE FROM Contiene WHERE id_plato = 5;

