CREATE DATABASE Twitter; 
USE Twitter;
-- -----------------------------------CREATE TABLE------------------------------------------------

CREATE TABLE Usuario(
	id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(20),
	correo VARCHAR(50),
	foto VARCHAR(255),
	seguidores INT,
	fecha_registro date
);

CREATE TABLE Seguir(
	id_user_sesion INT,
	id_user_other INT,
	PRIMARY KEY (id_user_sesion, id_user_other),
	FOREIGN KEY (id_user_sesion) REFERENCES Usuario(id) ON DELETE CASCADE,
	FOREIGN KEY (id_user_other) REFERENCES Usuario(id) ON DELETE CASCADE
);

CREATE TABLE Publicacion(
	id INT AUTO_INCREMENT PRIMARY KEY,
	publicacion VARCHAR(255),
	likes INT,
	retweet INT
);

CREATE TABLE Comentarios(
	id INT AUTO_INCREMENT PRIMARY KEY,
	comentario VARCHAR(255),
	id_publicacion INT,
	FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id)
);

CREATE TABLE postear(
	id_usuario INT NOT NULL,
	id_publicacion INT NOT NULL,
	id_comentarios INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id) ON DELETE CASCADE,
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id) ON DELETE CASCADE,
    FOREIGN KEY (id_comentarios) REFERENCES Comentarios(id) ON DELETE CASCADE
);

CREATE TABLE Hashtags(
	id INT AUTO_INCREMENT PRIMARY KEY,
	texto VARCHAR(100)
);

CREATE TABLE usarHashtag(
	id_hashtag INT,
	id_publicacion INT,
	FOREIGN KEY (id_hashtag) REFERENCES Hashtags(id),
    FOREIGN KEY (id_publicacion) REFERENCES Publicacion(id) ON DELETE CASCADE
);



-- -----------------------------------INSERTS------------------------------------------------
INSERT INTO Usuario (nombre, correo, foto, seguidores, fecha_registro) VALUES
('pepe', 'pepe@gmail.com', 'foto1.jpg', 100, '2023-10-19'),
('juan123', 'juan123@gmail.com', 'foto2.jpg', 200, '2023-10-18'),
('imro145', 'imro145@gmail.com', 'foto3.jpg', 150, '2023-10-17'),
('mar224', 'mar224@gmail.com', 'foto4.jpg', 300, '2023-10-16'),
('Rubius', 'Rubius@gmail.com', 'foto5.jpg', 50, '2023-10-15'),
('RAE', 'RAE@gmail.com', 'foto6.jpg', 75, '2023-10-14'),
('Duolingo', 'Duolingo@gmail.com', 'foto7.jpg', 90, '2023-10-13'),
('Duolingo ES', 'Duolingo@gmail.com', 'foto8.jpg', 250, '2023-10-12'),
('Duolingo JP', 'Duolingo@gmail.com', 'foto9.jpg', 125, '2023-10-11'),
('Duolingo EN', 'Duolingo@gmail.com', 'foto10.jpg', 180, '2023-10-10');

INSERT INTO Publicacion (publicacion, likes, retweet) VALUES
('Ayer me comi patatas', 50, 3),
('La tierra es plana', 75, 765),
('Jose es el mejor', 30, 345),
('Viva SQL', 110, 235),
('La tortillas de patatas se hace con cebolla', 90, 2),
('La nutella es nocilla pero mala', 120, 867),
('Soys unos p***s', 40, 5678),
('Vivan las pizzas', 70, 3333),
('Unity se esta llendo a pique', 55, 8888),
('Quiero ser programador', 85, 666);

INSERT INTO Comentarios (comentario, id_publicacion) VALUES
('Pero que dices?', 1),
('No opino lo mismo', 1),
('Si es el mejor', 3),
('De verdad es que si', 3),
('Sisisi', 4),
('????', 5),
('TE AMO', 6),
('Te comprendo', 6),
('QUE DICESSS', NULL),
('De acuerdo', NULL);

INSERT INTO postear (id_usuario, id_publicacion, id_comentarios) VALUES
(1, 1, NULL),
(2, 2, NULL),
(3, 3, NULL),
(4, 4, 9),
(5, 5, 10),
(6, 6, NULL),
(7, 7, NULL),
(8, 8, NULL),
(9, 9, NULL),
(10, 10, NULL);

INSERT INTO Hashtags (texto) VALUES
('Viral'),
('Videogames'),
('Youtubers'),
('Iron Mask'),
('X'),
('Unity'),
('Unreal Engine'),
('Comida'),
('Twitch'),
('Kick');

INSERT INTO usarHashtag (id_hashtag, id_publicacion) VALUES
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


-- -----------------------------------UPDATE Y DELETES------------------------------------------------

UPDATE Usuario SET foto = 'new_photo.jpg' WHERE nombre = 'pepe';
UPDATE Usuario SET correo = 'juan_updated@gmail.com' WHERE nombre = 'juan123';
UPDATE Usuario SET correo = 'juan_updated@gmail.com' WHERE nombre = 'juan123';
UPDATE Usuario SET seguidores = seguidores + 50 WHERE nombre = 'mar224';
UPDATE Usuario SET nombre = 'RealAcademiaEsp' WHERE nombre = 'RAE';
UPDATE Usuario SET fecha_registro = '2023-10-05' WHERE nombre LIKE 'Duolingo%';

INSERT INTO Seguir (id_user_sesion, id_user_other) VALUES ((SELECT id FROM Usuario WHERE nombre = 'pepe'), (SELECT id FROM Usuario WHERE nombre = 'juan123'));
DELETE FROM Seguir WHERE id_user_sesion = (SELECT id FROM Usuario WHERE nombre = 'imro145') AND id_user_other = (SELECT id FROM Usuario WHERE nombre = 'juan123');
INSERT INTO Seguir (id_user_sesion, id_user_other) VALUES ((SELECT id FROM Usuario WHERE nombre = 'Rubius'), (SELECT id FROM Usuario WHERE nombre = 'pepe'));
INSERT INTO Seguir (id_user_sesion, id_user_other) VALUES ((SELECT id FROM Usuario WHERE nombre = 'juan123'), (SELECT id FROM Usuario WHERE nombre = 'imro145'));
INSERT INTO Seguir (id_user_sesion, id_user_other) VALUES ((SELECT id FROM Usuario WHERE nombre = 'mar224'), (SELECT id FROM Usuario WHERE nombre = 'RealAcademiaEsp'));

UPDATE Publicacion SET publicacion = 'Just had some delicious pizza!' WHERE id = 1;
UPDATE Publicacion SET publicacion = 'Learning SQL is so much fun!' WHERE id = 3;
UPDATE Publicacion SET retweet = retweet + 20 WHERE id = 4;
DELETE FROM Publicacion WHERE id = 5;

UPDATE Comentarios SET comentario = 'I love patatas!' WHERE id = 1;
DELETE FROM Comentarios WHERE id = 2;
UPDATE Comentarios SET comentario = 'Jose is truly amazing!' WHERE id = 3;
DELETE FROM Comentarios WHERE id = 4;
UPDATE Comentarios SET comentario = 'I disagree, I love tortillas with cebolla!' WHERE id = 5;

UPDATE postear SET id_comentarios = 1 WHERE id_usuario = (SELECT id FROM Usuario WHERE nombre = 'pepe') AND id_publicacion = 1;
DELETE FROM postear WHERE id_usuario = (SELECT id FROM Usuario WHERE nombre = 'juan123') AND id_publicacion = 2;
UPDATE postear SET id_comentarios = 3 WHERE id_usuario = (SELECT id FROM Usuario WHERE nombre = 'imro145') AND id_publicacion = 3;
INSERT INTO postear (id_usuario, id_publicacion) VALUES ((SELECT id FROM Usuario WHERE nombre = 'mar224'), 4);
UPDATE postear SET id_comentarios = 5 WHERE id_usuario = (SELECT id FROM Usuario WHERE nombre = 'Rubius') AND id_publicacion = 5;


SELECT * FROM Usuario;
SELECT * FROM Publicacion;
SELECT * FROM Comentarios;
SELECT * FROM postear;
SELECT * FROM Hashtags;
SELECT * FROM usarHashtag;







DROP TABLE Usuario;
DROP TABLE Publicacion;
DROP TABLE Comentarios;
DROP TABLE postear;
DROP TABLE Hashtags;
DROP TABLE usarHashtag;

