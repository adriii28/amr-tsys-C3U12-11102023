CREATE DATABASE MenuDiario; 
USE MenuDiario;

CREATE TABLE Platos (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(255) NOT NULL,
    tipo VARCHAR(50) NOT NULL
);

CREATE TABLE MenuDiario (
    id INT PRIMARY KEY,
    fecha_menu DATE NOT NULL,
    num_personas_tomado INT NOT NULL,
    temperatura_del_dia INT NOT NULL
);

CREATE TABLE PlatosDiarios (
    id INT PRIMARY KEY,
    cantidad_platos_servidos INT NOT NULL,
    id_plato INT,
    FOREIGN KEY (id_plato) REFERENCES Platos(id) ON DELETE CASCADE
);

CREATE TABLE consisteMenuPlatos (
    id_menu_diario INT,
    id_plato_diario INT,
    PRIMARY KEY (id_menu_diario, id_plato_diario),
    FOREIGN KEY (id_menu_diario) REFERENCES MenuDiario(id) ON DELETE CASCADE,
    FOREIGN KEY (id_plato_diario) REFERENCES PlatosDiarios(id) ON DELETE CASCADE
);


-- -----------------------------------INSERTS------------------------------------------------
INSERT INTO Platos (id, nombre, descripcion, tipo) VALUES
(1, 'Pan con tomate', 'Pan fresco con tomates y aceite', 'Entrante'),
(2, 'Raviolis fungui', 'Raviolis rellenos de setas', 'Principal'),
(3, 'Tarta de queso', 'Postre de tarta de queso', 'Postre'),
(4, 'Gazpacho', 'Sopa fría de tomate y hortalizas', 'Entrante'),
(5, 'Ternera', 'Plato principal de ternera', 'Principal'),
(6, 'Ensalada César', 'Ensalada con pollo, crutones y aderezo César', 'Entrante'),
(7, 'Lasaña de verduras', 'Lasaña vegetariana con berenjena y calabacín', 'Principal'),
(8, 'Mousse de chocolate', 'Postre de mousse de chocolate negro', 'Postre'),
(9, 'Sopa de lentejas', 'Sopa casera de lentejas con verduras', 'Entrante'),
(10, 'Pescado a la parrilla', 'Pescado fresco a la parrilla con limón', 'Principal');

INSERT INTO MenuDiario (id, fecha_menu, num_personas_tomado, temperatura_del_dia) VALUES
(1, '2023-10-19', 50, 25),
(2, '2023-10-20', 60, 28),
(3, '2023-10-21', 45, 23),
(4, '2023-10-22', 55, 27),
(5, '2023-10-23', 40, 22),
(6, '2023-10-24', 70, 30),
(7, '2023-10-25', 35, 19),
(8, '2023-10-26', 45, 26),
(9, '2023-10-27', 60, 29),
(10, '2023-10-28', 55, 23);

INSERT INTO PlatosDiarios (id, cantidad_platos_servidos, id_plato) VALUES
(1, 30, 1),
(2, 40, 2),
(3, 25, 3),
(4, 35, 4),
(5, 20, 5),
(6, 28, 6),
(7, 32, 7),
(8, 22, 8),
(9, 38, 9),
(10, 18, 10);

INSERT INTO consisteMenuPlatos (id_menu_diario, id_plato_diario) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10);

-- -----------------------------------UPDATES------------------------------------------------

UPDATE Platos SET nombre = 'Plato Actualizado 1' WHERE id = 1;
UPDATE Platos SET descripcion = 'Nueva descripción 2' WHERE id = 2;
UPDATE Platos SET tipo = 'Aperitivo' WHERE id = 3;
UPDATE Platos SET nombre = 'Nuevo Nombre 4' WHERE id = 4;
UPDATE Platos SET descripcion = 'Nueva descripción 5' WHERE id = 5;
UPDATE Platos SET tipo = 'Aperitivo' WHERE id = 6;
UPDATE Platos SET nombre = 'Nuevo Nombre 7' WHERE id = 7;
UPDATE Platos SET descripcion = 'Nueva descripción 8' WHERE id = 8;
UPDATE Platos SET tipo = 'Aperitivo' WHERE id = 9;
UPDATE Platos SET nombre = 'Nuevo Nombre 10' WHERE id = 10;

UPDATE MenuDiario SET fecha_menu = '2023-10-24' WHERE id = 1;
UPDATE MenuDiario SET temperatura_del_dia = 26 WHERE id = 2;
UPDATE MenuDiario SET num_personas_tomado = 48 WHERE id = 3;
UPDATE MenuDiario SET fecha_menu = '2023-10-25' WHERE id = 4;
UPDATE MenuDiario SET temperatura_del_dia = 27 WHERE id = 5;
UPDATE MenuDiario SET num_personas_tomado = 42 WHERE id = 6;
UPDATE MenuDiario SET fecha_menu = '2023-10-26' WHERE id = 7;
UPDATE MenuDiario SET temperatura_del_dia = 28 WHERE id = 8;
UPDATE MenuDiario SET num_personas_tomado = 50 WHERE id = 9;
UPDATE MenuDiario SET fecha_menu = '2023-10-27' WHERE id = 10;

UPDATE PlatosDiarios SET cantidad_platos_servidos = 40 WHERE id = 1;
UPDATE PlatosDiarios SET id_plato = 3 WHERE id = 2;
UPDATE PlatosDiarios SET cantidad_platos_servidos = 35 WHERE id = 3;
UPDATE PlatosDiarios SET id_plato = 2 WHERE id = 4;
UPDATE PlatosDiarios SET cantidad_platos_servidos = 30 WHERE id = 5;
UPDATE PlatosDiarios SET id_plato = 4 WHERE id = 6;
UPDATE PlatosDiarios SET cantidad_platos_servidos = 25 WHERE id = 7;
UPDATE PlatosDiarios SET id_plato = 1 WHERE id = 8;
UPDATE PlatosDiarios SET cantidad_platos_servidos = 18 WHERE id = 9;
UPDATE PlatosDiarios SET id_plato = 5 WHERE id = 10;


-- -----------------------------------DELETES------------------------------------------------
DELETE FROM Platos WHERE id = 6;
DELETE FROM Platos WHERE id = 7;
DELETE FROM Platos WHERE id = 8;
DELETE FROM Platos WHERE id = 9;
DELETE FROM Platos WHERE id = 10;
DELETE FROM Platos WHERE id = 11;
DELETE FROM Platos WHERE id = 12;
DELETE FROM Platos WHERE id = 13;
DELETE FROM Platos WHERE id = 14;
DELETE FROM Platos WHERE id = 15;

DELETE FROM MenuDiario WHERE id = 11;
DELETE FROM MenuDiario WHERE id = 12;
DELETE FROM MenuDiario WHERE id = 13;
DELETE FROM MenuDiario WHERE id = 14;
DELETE FROM MenuDiario WHERE id = 15;
DELETE FROM MenuDiario WHERE id = 16;
DELETE FROM MenuDiario WHERE id = 17;
DELETE FROM MenuDiario WHERE id = 18;
DELETE FROM MenuDiario WHERE id = 19;
DELETE FROM MenuDiario WHERE id = 20;

DELETE FROM PlatosDiarios WHERE id = 11;
DELETE FROM PlatosDiarios WHERE id = 12;
DELETE FROM PlatosDiarios WHERE id = 13;
DELETE FROM PlatosDiarios WHERE id = 14;
DELETE FROM PlatosDiarios WHERE id = 15;
DELETE FROM PlatosDiarios WHERE id = 16;
DELETE FROM PlatosDiarios WHERE id = 17;
DELETE FROM PlatosDiarios WHERE id = 18;
DELETE FROM PlatosDiarios WHERE id = 19;
DELETE FROM PlatosDiarios WHERE id = 20;

DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 11;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 12;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 13;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 14;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 15;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 16;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 17;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 18;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 19;
DELETE FROM consisteMenuPlatos WHERE id_menu_diario = 20;

DELETE FROM Platos WHERE id = 16;
DELETE FROM Platos WHERE id = 17;
DELETE FROM Platos WHERE id = 18;
DELETE FROM Platos WHERE id = 19;
DELETE FROM Platos WHERE id = 20;
