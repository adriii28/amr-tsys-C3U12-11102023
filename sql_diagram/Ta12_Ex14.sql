create database RedSocial;
use RedSocial;

CREATE TABLE Usuario (
    dni VARCHAR(8) PRIMARY KEY,
    contraseña VARCHAR(255) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(255) NOT NULL,
    direccion VARCHAR(255),
    foto VARCHAR(255),
    esCelebridad BIT
);

CREATE TABLE bloquearUsuario (
    dni_user VARCHAR(8),
    dni_session VARCHAR(8),
    PRIMARY KEY (dni_user, dni_session),
    FOREIGN KEY (dni_user) REFERENCES Usuario(dni) ON DELETE CASCADE,
    FOREIGN KEY (dni_session) REFERENCES Usuario(dni) ON DELETE CASCADE
);

CREATE TABLE Email (
    id_dato INT PRIMARY KEY,
    correo_electronico VARCHAR(255) NOT NULL,
    id_usuario VARCHAR(8),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(dni) ON DELETE CASCADE
);

CREATE TABLE Telefono (
    id_dato INT PRIMARY KEY,
    num_telefono VARCHAR(15) NOT NULL,
    id_usuario VARCHAR(8),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(dni) ON DELETE CASCADE
);

CREATE TABLE Contacto (
    id INT PRIMARY KEY,
    comentario_personal VARCHAR(255)
);

CREATE TABLE Comentarios (
    id INT PRIMARY KEY,
    texto VARCHAR(255) NOT NULL,
    imagen VARCHAR(255)
);

CREATE TABLE Grupo (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE organizaUsuarioGrupo (
    id_grupo INT,
    id_usuario VARCHAR(8),
    PRIMARY KEY (id_grupo, id_usuario),
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(dni) ON DELETE CASCADE
);

CREATE TABLE formaParteContactoGrupo (
    id_contacto INT,
    id_grupo INT,
    PRIMARY KEY (id_contacto, id_grupo),
    FOREIGN KEY (id_contacto) REFERENCES Contacto(id),
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id)
);

CREATE TABLE puede_verGrupoContactoComentario (
    id_grupo INT,
    id_contacto INT,
    id_comentario INT,
    PRIMARY KEY (id_grupo, id_contacto, id_comentario),
    FOREIGN KEY (id_grupo) REFERENCES Grupo(id) ON DELETE CASCADE,
    FOREIGN KEY (id_contacto) REFERENCES Contacto(id),
    FOREIGN KEY (id_comentario) REFERENCES Comentarios(id) ON DELETE CASCADE
);

CREATE TABLE publicaUsuarioComentario (
    id_usuario VARCHAR(8),
    id_comentario INT,
    PRIMARY KEY (id_usuario, id_comentario),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(dni) ON DELETE CASCADE,
    FOREIGN KEY (id_comentario) REFERENCES Comentarios(id) ON DELETE CASCADE
);

-- -----------------------------------INSERTS------------------------------------------------

INSERT INTO Usuario (dni, contraseña, nombre, apellidos, direccion, foto, esCelebridad) VALUES
('11111111', 'contraseña1', 'Pepe', 'García', 'Calle Real 1', 'pepe.jpg', 1),
('22222222', 'contraseña2', 'Juan', 'López', 'Calle Falsa 2', 'juan.jpg', 0),
('33333333', 'contraseña3', 'María', 'Martínez', 'Avenida Principal 3', 'maria.jpg', 1),
('44444444', 'contraseña4', 'Antonio', 'Fernández', 'Calle Grande 4', 'antonio.jpg', 0),
('55555555', 'contraseña5', 'Sofía', 'Pérez', 'Plaza Mayor 5', 'sofia.jpg', 1);

INSERT INTO bloquearUsuario (dni_user, dni_session) VALUES
('11111111', '22222222'),
('33333333', '44444444'),
('22222222', '55555555'),
('44444444', '11111111'),
('55555555', '33333333');

INSERT INTO Email (id_dato, correo_electronico, id_usuario) VALUES
(1, 'pepe@email.com', '11111111'),
(2, 'juan@email.com', '22222222'),
(3, 'maria@email.com', '33333333'),
(4, 'antonio@email.com', '44444444'),
(5, 'sofia@email.com', '55555555');

INSERT INTO Telefono (id_dato, num_telefono, id_usuario) VALUES
(1, '111-111-1111', '11111111'),
(2, '222-222-2222', '22222222'),
(3, '333-333-3333', '33333333'),
(4, '444-444-4444', '44444444'),
(5, '555-555-5555', '55555555');

INSERT INTO Contacto (id, comentario_personal) VALUES
(1, 'Amigo cercano'),
(2, 'Compañero de trabajo'),
(3, 'Familiar'),
(4, 'Conocido'),
(5, 'Amigo de la infancia');

INSERT INTO Comentarios (id, texto, imagen) VALUES
(1, 'Comentario 1', 'imagen1.jpg'),
(2, 'Comentario 2', 'imagen2.jpg'),
(3, 'Comentario 3', 'imagen3.jpg'),
(4, 'Comentario 4', 'imagen4.jpg'),
(5, 'Comentario 5', 'imagen5.jpg');

INSERT INTO Grupo (id, nombre) VALUES
(1, 'Grupo 1'),
(2, 'Grupo 2'),
(3, 'Grupo 3'),
(4, 'Grupo 4'),
(5, 'Grupo 5');

INSERT INTO organizaUsuarioGrupo (id_grupo, id_usuario) VALUES
(1, '11111111'),
(1, '22222222'),
(2, '33333333'),
(2, '44444444'),
(3, '55555555');

INSERT INTO formaParteContactoGrupo (id_contacto, id_grupo) VALUES
(1, 2),
(3, 4),
(2, 5),
(4, 1),
(5, 3);

INSERT INTO bloquearUsuario (dni_user, dni_session) VALUES
('12345678', '87654321'),
('11111111', '22222222'),
('33333333', '44444444'),
('55555555', '66666666'),
('77777777', '88888888');

INSERT INTO Grupo (id, nombre) VALUES
(1, 'Grupo 1'),
(2, 'Grupo 2'),
(3, 'Grupo 3'),
(4, 'Grupo 4'),
(5, 'Grupo 5');

INSERT INTO organizaUsuarioGrupo (id_grupo, id_usuario) VALUES
(1, '12345678'),
(2, '11111111'),
(3, '33333333'),
(4, '55555555'),
(5, '77777777');

INSERT INTO puede_verGrupoContactoComentario (id_grupo, id_contacto, id_comentario) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

INSERT INTO publicaUsuarioComentario (id_usuario, id_comentario) VALUES
('12345678', 1),
('11111111', 2),
('33333333', 3),
('55555555', 4),
('77777777', 5);

-- -----------------------------------UPDATES------------------------------------------------

UPDATE Usuario SET direccion = 'Nueva dirección 1' WHERE dni = '11111111';
UPDATE Usuario SET nombre = 'Nuevo nombre 2' WHERE dni = '22222222';
UPDATE Usuario SET esCelebridad = 1 WHERE dni = '33333333';

UPDATE Email SET correo_electronico = 'nuevo_email1@email.com' WHERE id_dato = 1;
UPDATE Email SET correo_electronico = 'nuevo_email2@email.com' WHERE id_dato = 2;

UPDATE Telefono SET num_telefono = '999-999-9999' WHERE id_dato = 1;
UPDATE Telefono SET num_telefono = '777-777-7777' WHERE id_dato = 2;

UPDATE Email SET correo_electronico = 'nuevo_email3@email.com' WHERE id_dato = 3;
UPDATE Email SET correo_electronico = 'nuevo_email4@email.com' WHERE id_dato = 4;

UPDATE Telefono SET num_telefono = '666-666-6666' WHERE id_dato = 3;
UPDATE Telefono SET num_telefono = '888-888-8888' WHERE id_dato = 4;

UPDATE Contacto SET comentario_personal = 'Nuevo comentario 1' WHERE id = 1;
UPDATE Contacto SET comentario_personal = 'Nuevo comentario 2' WHERE id = 2;

UPDATE Comentarios SET texto = 'Nuevo texto 1' WHERE id = 1;
UPDATE Comentarios SET texto = 'Nuevo texto 2' WHERE id = 2;

UPDATE bloquearUsuario SET dni_session = '99999999' WHERE dni_user = '12345678';
UPDATE bloquearUsuario SET dni_user = '99999999' WHERE dni_session = '88888888';

UPDATE Grupo SET nombre = 'Grupo Actualizado 1' WHERE id = 1;
UPDATE Grupo SET nombre = 'Grupo Actualizado 2' WHERE id = 2;

UPDATE publicaUsuarioComentario SET id_comentario = 6 WHERE id_usuario = '12345678';
UPDATE publicaUsuarioComentario SET id_usuario = '88888888' WHERE id_comentario = 2;

-- -----------------------------------DELETES------------------------------------------------

DELETE FROM Usuario WHERE dni = '44444444';
DELETE FROM Usuario WHERE dni = '55555555';

DELETE FROM bloquearUsuario WHERE dni_user = '11111111' AND dni_session = '22222222';
DELETE FROM bloquearUsuario WHERE dni_user = '33333333' AND dni_session = '44444444';

DELETE FROM Email WHERE id_dato = 3;
DELETE FROM Email WHERE id_dato = 4;

DELETE FROM Telefono WHERE id_dato = 4;
DELETE FROM Telefono WHERE id_dato = 5;

DELETE FROM Email WHERE id_dato = 5;
DELETE FROM Email WHERE id_dato = 6;

DELETE FROM Telefono WHERE id_dato = 5;
DELETE FROM Telefono WHERE id_dato = 6;

DELETE FROM Contacto WHERE id = 4;
DELETE FROM Contacto WHERE id = 5;

DELETE FROM Comentarios WHERE id = 4;
DELETE FROM Comentarios WHERE id = 5;

DELETE FROM Grupo WHERE id = 4;
DELETE FROM Grupo WHERE id = 5;

DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 1;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 2;

DELETE FROM formaParteContactoGrupo WHERE id_contacto = 3;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 4;

DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 1;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 2;
