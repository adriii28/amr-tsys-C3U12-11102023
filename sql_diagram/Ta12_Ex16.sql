CREATE DATABASE Twitter; 
USE Twitter;

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
	retweet VARCHAR(255)
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