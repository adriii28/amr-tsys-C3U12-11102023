CREATE DATABASE RecetasCocina;

USE RecetasCocina;

CREATE TABLE Ingredientes(
id_ingrediente int auto_increment,
tipo_ingrediente varchar(20),
nombre_ingrediente varchar(20),
PRIMARY KEY (id_ingrediente)
);

SELECT * FROM Ingredientes;

INSERT INTO Ingredientes (tipo_ingrediente, nombre_ingrediente) VALUES
('Patata','Verdura'),
('Pollo','Carne'),
('Arroz','Cereal'),
('Espagueti','Pasta'),
('Lechuga','Verdura'),
('Filete','Carne'),
('Bechamel','Salsa'),
('Tomate','Verdura'),
('Champiñones','Verdura'),
('Tostadas','Cereal');

UPDATE Ingredientes SET tipo_ingrediente = 'Pasta'  WHERE id_ingrediente = 4;
UPDATE Ingredientes SET tipo_ingrediente = 'Hortaliza'  WHERE id_ingrediente = 8;
UPDATE Ingredientes SET tipo_ingrediente = 'Tuberculo'  WHERE id_ingrediente = 1;

DELETE FROM Ingredientes WHERE id_ingrediente = 1;
DELETE FROM Ingredientes WHERE id_ingrediente = 2;
DELETE FROM Ingredientes WHERE id_ingrediente = 3;


CREATE TABLE Cocinero(
dni varchar(20),
nombre varchar(20) not null,
PRIMARY KEY (dni)
);

SELECT * FROM Cocinero;

INSERT INTO Cocinero (dni, nombre) VALUES 
('52571081','Benjamen'),
('26457739','Cam'),
('62523477','Delmor'),
('73638875','Barde'),
('123067607','Pepe'),
('32168050','Germaine'),
('12341234','Adrian'),
('96913092','Broddie'),
('29067607','Gizela'),
('21936046','Luisa');


UPDATE Cocinero SET nombre = 'Manel'  WHERE dni = '52571081';
UPDATE Cocinero SET nombre = 'Robert'  WHERE dni = '26457739';
UPDATE Cocinero SET nombre = 'Pedro'  WHERE dni = '62523477';


DELETE FROM Cocinero WHERE dni = '52571081';
DELETE FROM Cocinero WHERE dni = '26457739';
DELETE FROM Cocinero WHERE dni = '62523477';

drop table Receta;

CREATE TABLE Receta(
nombre_receta varchar(50),
dificultad varchar(20),
num_personas varchar(20),
tiempo_preparacion int,
dni_cocinero varchar(9) not null,
PRIMARY KEY (nombre_receta),
FOREIGN KEY (dni_cocinero) REFERENCES Cocinero(dni)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Receta;

INSERT INTO Receta (nombre_receta, dificultad, num_personas, tiempo_preparacion, dni_cocinero) VALUES 
('Tortilla Española', 'Fácil', '4', 30, '52571081'),
('Pollo al Curry', 'Media', '2', 45, '26457739'),
('Sushi Rolls', 'Difícil', '6', 60, '62523477'),
('Spaghetti Carbonara', 'Media', '3', 40, '73638875'),
('Ensalada César', 'Fácil', '2', 20, '123067607'),
('Filete Wellington', 'Difícil', '8', 75, '32168050'),
('Lasaña', 'Media', '4', 35, '12341234'),
('Gazpacho', 'Fácil', '3', 25, '96913092'),
('Risotto de Champiñones', 'Media', '5', 50, '29067607'),
('Tostadas con Aguacate', 'Fácil', '2', 15, '21936046');

UPDATE Receta SET num_personas = 3  WHERE nombre_receta = 'Pollo al Curry';
UPDATE Receta SET tiempo_preparacion = 10  WHERE nombre_receta = 'Ensalada César';
UPDATE Receta SET dificultad = 'Dificil'  WHERE nombre_receta = 'Risotto de Champiñones';

DELETE FROM Receta WHERE nombre_receta = 'Pollo al Curry';
DELETE FROM Receta WHERE nombre_receta = 'Lasaña';
DELETE FROM Receta WHERE nombre_receta = 'Gazpacho';


CREATE TABLE Tener (
id_ingrediente int,
nombre_receta varchar(50),
cantidad varchar(100) ,
PRIMARY KEY (id_ingrediente, nombre_receta),
FOREIGN KEY (id_ingrediente) REFERENCES Ingredientes(id_ingrediente)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (nombre_receta) REFERENCES Receta(nombre_receta)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT  * FROM Tener;

INSERT INTO Tener (id_ingrediente, nombre_receta, cantidad) VALUES 
(1, 'Lasaña', '100ml'),
(2, 'Tortilla Española', '4'),
(3, 'Pollo al Curry', '100g '),
(4, 'Sushi Rolls', '200g '),
(5, 'Spaghetti Carbonara', '150g'),
(6, 'Ensalada César', '100g'),
(7, 'Filete Wellington', '100g'),
(8, 'Gazpacho', '4'),
(9, 'Risotto de Champiñones', '50g'),
(10, 'Tostadas con Aguacate', '2');

UPDATE Tener SET cantidad = '4 ud' WHERE id_ingrediente = 2;
UPDATE Tener SET cantidad = '4 ud' WHERE id_ingrediente = 8;
UPDATE Tener SET cantidad = '2 ud' WHERE id_ingrediente = 10;

DELETE FROM Tener WHERE id_ingrediente = 1;
DELETE FROM Tener WHERE id_ingrediente = 2;
DELETE FROM Tener WHERE id_ingrediente = 3;

CREATE TABLE Utensilios (
id int auto_increment,
nombre_utensilio varchar(50) not null,
PRIMARY KEY (id)	
);

SELECT * FROM Utensilios;

INSERT INTO Utensilios (nombre_utensilio) VALUES 
('Cuchillo'),
('Sarten'),
('Espatula'),
('Batidora'),
('Pelador patatas'),
('Tabla de cortar'),
('Colador'),
('Rallador'),
('Cacerola'),
('Recipiente');

DELETE FROM Utensilios WHERE id = 1;
DELETE FROM Utensilios WHERE id = 2;
DELETE FROM Utensilios WHERE id = 3;

CREATE TABLE Usar (
nombre_receta varchar(20),
id_utensilio int,
cantidad varchar(100) not null,
PRIMARY KEY (nombre_receta, id_utensilio),
FOREIGN KEY (nombre_receta) REFERENCES Receta(nombre_receta)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_utensilio) REFERENCES Utensilios(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Usar;

INSERT INTO Usar (nombre_receta, id_utensilio,cantidad) VALUES 
('Lasaña', 1, '1 ud'),
('Tortilla', 2, '1 ud'),
('Pollo al Curry', 3, '1 ud'),
('Sushi Rolls', 4, '1 ud'),
('Spaghetti Carbonara', 5, '1 ud'),
('Ensalada César', 6, '1 ud'),
('Filete Wellington', 7, '1 ud'),
('Gazpacho', 8, '1 ud'),
('Risotto de Champiñones', 9, '1 ud'),
('Tostadas con Aguacate', 10, '1 ud');

DELETE FROM Usar WHERE id = 2;
DELETE FROM Usar WHERE id = 2;
DELETE FROM Usar WHERE id = 2;





