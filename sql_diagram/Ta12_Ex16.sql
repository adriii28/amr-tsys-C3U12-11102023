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
('Ayer me comí patatas', 50, 3),
('La tierra es plana', 75, 765),
('Jose es el mejor', 30, 345),
('Viva SQL', 110, 235),
('La tortilla de patatas se hace con cebolla', 90, 2),
('La Nutella es nocilla pero mala', 120, 867),
('Sois unos p***s', 40, 5678),
('Vivan las pizzas', 70, 3333),
('Unity se está yendo a pique', 55, 8888),
('Quiero ser programador', 85, 666);

INSERT INTO Comentarios (comentario, id_publicacion) VALUES
('Pero, ¿qué dices?', 1),
('No opino lo mismo', 1),
('Sí, es el mejor', 3),
('De verdad, es que sí', 3),
('Sisisi', 4),
('????', 5),
('TE AMO', 6),
('Te comprendo', 6),
('QUE DICES', NULL),
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

-- -----------------------------------UPDATES ------------------------------------------------
UPDATE Usuario SET nombre = 'NuevoNombre1' WHERE id = 1;
UPDATE Usuario SET correo = 'correo_actualizado2@gmail.com' WHERE id = 2;
UPDATE Usuario SET seguidores = 300 WHERE id = 3;
UPDATE Usuario SET foto = 'nueva_foto.jpg' WHERE id = 4;
UPDATE Usuario SET fecha_registro = '2023-10-01' WHERE id = 5;
UPDATE Usuario SET nombre = 'UsuarioActualizado6' WHERE id = 6;
UPDATE Usuario SET seguidores = 500 WHERE id = 7;
UPDATE Usuario SET correo = 'correo_nuevo7@gmail.com' WHERE id = 8;
UPDATE Usuario SET fecha_registro = '2023-10-02' WHERE id = 9;
UPDATE Usuario SET foto = 'foto_actualizada9.jpg' WHERE id = 10;

UPDATE Seguir SET id_user_sesion = 5 WHERE id_user_sesion = 1;
UPDATE Seguir SET id_user_sesion = 10 WHERE id_user_sesion = 2;
UPDATE Seguir SET id_user_sesion = 6 WHERE id_user_sesion = 3;
UPDATE Seguir SET id_user_other = 1 WHERE id_user_other = 4;
UPDATE Seguir SET id_user_other = 9 WHERE id_user_other = 5;
UPDATE Seguir SET id_user_other = 8 WHERE id_user_other = 6;
UPDATE Seguir SET id_user_sesion = 7, id_user_other = 4 WHERE id_user_sesion = 8;
UPDATE Seguir SET id_user_sesion = 2, id_user_other = 6 WHERE id_user_sesion = 9;
UPDATE Seguir SET id_user_sesion = 8, id_user_other = 1 WHERE id_user_sesion = 10;
UPDATE Seguir SET id_user_sesion = 9, id_user_other = 4 WHERE id_user_sesion = 2;

UPDATE Publicacion SET publicacion = 'Actualización de publicación 1' WHERE id = 1;
UPDATE Publicacion SET likes = 100 WHERE id = 2;
UPDATE Publicacion SET retweet = 500 WHERE id = 3;
UPDATE Publicacion SET publicacion = 'Publicación modificada 4' WHERE id = 4;
UPDATE Publicacion SET likes = 200 WHERE id = 5;
UPDATE Publicacion SET retweet = 1000 WHERE id = 6;
UPDATE Publicacion SET likes = 300 WHERE id = 7;
UPDATE Publicacion SET retweet = 1500 WHERE id = 8;
UPDATE Publicacion SET likes = 400 WHERE id = 9;
UPDATE Publicacion SET retweet = 2000 WHERE id = 10;

UPDATE Comentarios SET comentario = 'Nuevo comentario 1' WHERE id = 1;
UPDATE Comentarios SET comentario = 'Comentario actualizado 2' WHERE id = 2;
UPDATE Comentarios SET comentario = 'Comentario modificado 3' WHERE id = 3;
UPDATE Comentarios SET comentario = 'Comentario actualizado 4' WHERE id = 4;
UPDATE Comentarios SET comentario = 'Nuevo comentario 5' WHERE id = 5;
UPDATE Comentarios SET comentario = 'Comentario modificado 6' WHERE id = 6;
UPDATE Comentarios SET comentario = 'Nuevo comentario 7' WHERE id = 7;
UPDATE Comentarios SET comentario = 'Comentario actualizado 8' WHERE id = 8;
UPDATE Comentarios SET comentario = 'Comentario modificado 9' WHERE id = 9;
UPDATE Comentarios SET comentario = 'Nuevo comentario 10' WHERE id = 10;

UPDATE postear SET id_comentarios = 2 WHERE id_usuario = 1 AND id_publicacion = 1;
UPDATE postear SET id_comentarios = 3 WHERE id_usuario = 2 AND id_publicacion = 2;
UPDATE postear SET id_comentarios = 4 WHERE id_usuario = 3 AND id_publicacion = 3;
UPDATE postear SET id_comentarios = 5 WHERE id_usuario = 4 AND id_publicacion = 4;
UPDATE postear SET id_comentarios = 6 WHERE id_usuario = 5 AND id_publicacion = 5;
UPDATE postear SET id_comentarios = 7 WHERE id_usuario = 6 AND id_publicacion = 6;
UPDATE postear SET id_comentarios = 8 WHERE id_usuario = 7 AND id_publicacion = 7;
UPDATE postear SET id_comentarios = 9 WHERE id_usuario = 8 AND id_publicacion = 8;
UPDATE postear SET id_comentarios = 10 WHERE id_usuario = 9 AND id_publicacion = 9;
UPDATE postear SET id_comentarios = 1 WHERE id_usuario = 10 AND id_publicacion = 10;

UPDATE Hashtags SET texto = 'NuevoHashtag1' WHERE id = 1;
UPDATE Hashtags SET texto = 'NuevoHashtag2' WHERE id = 2;
UPDATE Hashtags SET texto = 'NuevoHashtag3' WHERE id = 3;
UPDATE Hashtags SET texto = 'NuevoHashtag4' WHERE id = 4;
UPDATE Hashtags SET texto = 'NuevoHashtag5' WHERE id = 5;
UPDATE Hashtags SET texto = 'NuevoHashtag6' WHERE id = 6;
UPDATE Hashtags SET texto = 'NuevoHashtag7' WHERE id = 7;
UPDATE Hashtags SET texto = 'NuevoHashtag8' WHERE id = 8;
UPDATE Hashtags SET texto = 'NuevoHashtag9' WHERE id = 9;
UPDATE Hashtags SET texto = 'NuevoHashtag10' WHERE id = 10;

UPDATE usarHashtag SET id_hashtag = 1 WHERE id_hashtag = 11;
UPDATE usarHashtag SET id_hashtag = 2 WHERE id_hashtag = 12;
UPDATE usarHashtag SET id_hashtag = 3 WHERE id_hashtag = 13;
UPDATE usarHashtag SET id_hashtag = 4 WHERE id_hashtag = 14;
UPDATE usarHashtag SET id_hashtag = 5 WHERE id_hashtag = 15;
UPDATE usarHashtag SET id_hashtag = 6 WHERE id_hashtag = 16;
UPDATE usarHashtag SET id_hashtag = 7 WHERE id_hashtag = 17;
UPDATE usarHashtag SET id_hashtag = 8 WHERE id_hashtag = 18;
UPDATE usarHashtag SET id_hashtag = 9 WHERE id_hashtag = 19;
UPDATE usarHashtag SET id_hashtag = 10 WHERE id_hashtag = 20;

-- -----------------------------------DELETES ------------------------------------------------
DELETE FROM Usuario WHERE id = 11;
DELETE FROM Usuario WHERE id = 12;
DELETE FROM Usuario WHERE id = 13;
DELETE FROM Usuario WHERE id = 14;
DELETE FROM Usuario WHERE id = 15;
DELETE FROM Usuario WHERE id = 16;
DELETE FROM Usuario WHERE id = 17;
DELETE FROM Usuario WHERE id = 18;
DELETE FROM Usuario WHERE id = 19;
DELETE FROM Usuario WHERE id = 20;

DELETE FROM Seguir WHERE id_user_sesion = 11;
DELETE FROM Seguir WHERE id_user_sesion = 12;
DELETE FROM Seguir WHERE id_user_sesion = 13;
DELETE FROM Seguir WHERE id_user_sesion = 14;
DELETE FROM Seguir WHERE id_user_sesion = 15;
DELETE FROM Seguir WHERE id_user_sesion = 16;
DELETE FROM Seguir WHERE id_user_sesion = 17;
DELETE FROM Seguir WHERE id_user_sesion = 18;
DELETE FROM Seguir WHERE id_user_sesion = 19;
DELETE FROM Seguir WHERE id_user_sesion = 20;

DELETE FROM Publicacion WHERE id = 11;
DELETE FROM Publicacion WHERE id = 12;
DELETE FROM Publicacion WHERE id = 13;
DELETE FROM Publicacion WHERE id = 14;
DELETE FROM Publicacion WHERE id = 15;
DELETE FROM Publicacion WHERE id = 16;
DELETE FROM Publicacion WHERE id = 17;
DELETE FROM Publicacion WHERE id = 18;
DELETE FROM Publicacion WHERE id = 19;
DELETE FROM Publicacion WHERE id = 20;

DELETE FROM Comentarios WHERE id = 11;
DELETE FROM Comentarios WHERE id = 12;
DELETE FROM Comentarios WHERE id = 13;
DELETE FROM Comentarios WHERE id = 14;
DELETE FROM Comentarios WHERE id = 15;
DELETE FROM Comentarios WHERE id = 16;
DELETE FROM Comentarios WHERE id = 17;
DELETE FROM Comentarios WHERE id = 18;
DELETE FROM Comentarios WHERE id = 19;
DELETE FROM Comentarios WHERE id = 20;

DELETE FROM postear WHERE id_usuario = 11;
DELETE FROM postear WHERE id_usuario = 12;
DELETE FROM postear WHERE id_usuario = 13;
DELETE FROM postear WHERE id_usuario = 14;
DELETE FROM postear WHERE id_usuario = 15;
DELETE FROM postear WHERE id_usuario = 16;
DELETE FROM postear WHERE id_usuario = 17;
DELETE FROM postear WHERE id_usuario = 18;
DELETE FROM postear WHERE id_usuario = 19;
DELETE FROM postear WHERE id_usuario = 20;

DELETE FROM Hashtags WHERE id = 11;
DELETE FROM Hashtags WHERE id = 12;
DELETE FROM Hashtags WHERE id = 13;
DELETE FROM Hashtags WHERE id = 14;
DELETE FROM Hashtags WHERE id = 15;
DELETE FROM Hashtags WHERE id = 16;
DELETE FROM Hashtags WHERE id = 17;
DELETE FROM Hashtags WHERE id = 18;
DELETE FROM Hashtags WHERE id = 19;
DELETE FROM Hashtags WHERE id = 20;

DELETE FROM usarHashtag WHERE id_hashtag = 11;
DELETE FROM usarHashtag WHERE id_hashtag = 12;
DELETE FROM usarHashtag WHERE id_hashtag = 13;
DELETE FROM usarHashtag WHERE id_hashtag = 14;
DELETE FROM usarHashtag WHERE id_hashtag = 15;
DELETE FROM usarHashtag WHERE id_hashtag = 16;
DELETE FROM usarHashtag WHERE id_hashtag = 17;
DELETE FROM usarHashtag WHERE id_hashtag = 18;
DELETE FROM usarHashtag WHERE id_hashtag = 19;
DELETE FROM usarHashtag WHERE id_hashtag = 20;
