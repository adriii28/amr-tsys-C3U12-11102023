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
('55555555', 'contraseña5', 'Sofía', 'Pérez', 'Plaza Mayor 5', 'sofia.jpg', 1),
('66666666', 'contraseña6', 'Carlos', 'Ramírez', 'Calle Pequeña 6', 'carlos.jpg', 0),
('77777777', 'contraseña7', 'Ana', 'Gómez', 'Avenida Secundaria 7', 'ana.jpg', 1),
('88888888', 'contraseña8', 'Luis', 'Sánchez', 'Calle Estrecha 8', 'luis.jpg', 0),
('99999999', 'contraseña9', 'Elena', 'Rodríguez', 'Avenida Principal 9', 'elena.jpg', 1),
('10101010', 'contraseña10', 'David', 'López', 'Calle Central 10', 'david.jpg', 0);

INSERT INTO bloquearUsuario (dni_user, dni_session) VALUES
('11111111', '22222222'),
('33333333', '44444444'),
('22222222', '55555555'),
('44444444', '11111111'),
('55555555', '33333333'),
('66666666', '77777777'),
('77777777', '88888888'),
('88888888', '99999999'),
('99999999', '10101010'),
('10101010', '11111111');

INSERT INTO Email (id_dato, correo_electronico, id_usuario) VALUES
(1, 'pepe@email.com', '11111111'),
(2, 'juan@email.com', '22222222'),
(3, 'maria@email.com', '33333333'),
(4, 'antonio@email.com', '44444444'),
(5, 'sofia@email.com', '55555555'),
(6, 'carlos@email.com', '66666666'),
(7, 'ana@email.com', '77777777'),
(8, 'luis@email.com', '88888888'),
(9, 'elena@email.com', '99999999'),
(10, 'david@email.com', '10101010');

INSERT INTO Telefono (id_dato, num_telefono, id_usuario) VALUES
(1, '111-111-1111', '11111111'),
(2, '222-222-2222', '22222222'),
(3, '333-333-3333', '33333333'),
(4, '444-444-4444', '44444444'),
(5, '555-555-5555', '55555555'),
(6, '666-666-6666', '66666666'),
(7, '777-777-7777', '77777777'),
(8, '888-888-8888', '88888888'),
(9, '999-999-9999', '99999999'),
(10, '101-101-1010', '10101010');

INSERT INTO Contacto (id, comentario_personal) VALUES
(1, 'Amigo cercano'),
(2, 'Compañero de trabajo'),
(3, 'Familiar'),
(4, 'Conocido'),
(5, 'Amigo de la infancia'),
(6, 'Vecino'),
(7, 'Compañero de estudio'),
(8, 'Amigo virtual'),
(9, 'Pariente lejano'),
(10, 'Amigo de confianza');

INSERT INTO Comentarios (id, texto, imagen) VALUES
(1, 'Comentario 1', 'imagen1.jpg'),
(2, 'Comentario 2', 'imagen2.jpg'),
(3, 'Comentario 3', 'imagen3.jpg'),
(4, 'Comentario 4', 'imagen4.jpg'),
(5, 'Comentario 5', 'imagen5.jpg'),
(6, 'Comentario 6', 'imagen6.jpg'),
(7, 'Comentario 7', 'imagen7.jpg'),
(8, 'Comentario 8', 'imagen8.jpg'),
(9, 'Comentario 9', 'imagen9.jpg'),
(10, 'Comentario 10', 'imagen10.jpg');

INSERT INTO Grupo (id, nombre) VALUES
(1, 'Grupo 1'),
(2, 'Grupo 2'),
(3, 'Grupo 3'),
(4, 'Grupo 4'),
(5, 'Grupo 5'),
(6, 'Grupo 6'),
(7, 'Grupo 7'),
(8, 'Grupo 8'),
(9, 'Grupo 9'),
(10, 'Grupo 10');

INSERT INTO organizaUsuarioGrupo (id_grupo, id_usuario) VALUES
(1, '11111111'),
(1, '22222222'),
(2, '33333333'),
(2, '44444444'),
(3, '55555555'),
(3, '66666666'),
(4, '77777777'),
(4, '88888888'),
(5, '99999999'),
(5, '10101010');

INSERT INTO formaParteContactoGrupo (id_contacto, id_grupo) VALUES
(1, 2),
(3, 4),
(2, 5),
(4, 1),
(5, 3),
(6, 7),
(8, 9),
(10, 1),
(3, 5),
(2, 4);

INSERT INTO puede_verGrupoContactoComentario (id_grupo, id_contacto, id_comentario) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5),
(6, 6, 6),
(7, 7, 7),
(8, 8, 8),
(9, 9, 9),
(10, 10, 10);

INSERT INTO publicaUsuarioComentario (id_usuario, id_comentario) VALUES
('11111111', 1),
('22222222', 2),
('33333333', 3),
('44444444', 4),
('55555555', 5),
('66666666', 6),
('77777777', 7),
('88888888', 8),
('99999999', 9),
('10101010', 10);

-- -----------------------------------UPDATES------------------------------------------------

UPDATE Usuario SET direccion = 'Nueva dirección 1' WHERE dni = '11111111';
UPDATE Usuario SET nombre = 'Nuevo nombre 2' WHERE dni = '22222222';
UPDATE Usuario SET esCelebridad = 1 WHERE dni = '33333333';
UPDATE Usuario SET direccion = 'Otra dirección' WHERE dni = '44444444';
UPDATE Usuario SET nombre = 'Otro nombre' WHERE dni = '55555555';
UPDATE Usuario SET esCelebridad = 0 WHERE dni = '66666666';
UPDATE Usuario SET direccion = 'Calle Nueva 7' WHERE dni = '77777777';
UPDATE Usuario SET nombre = 'Pepe Pérez' WHERE dni = '88888888';
UPDATE Usuario SET esCelebridad = 1 WHERE dni = '99999999';
UPDATE Usuario SET direccion = 'Calle Principal 10' WHERE dni = '10101010';

UPDATE Email SET correo_electronico = 'nuevo_email1@email.com' WHERE id_dato = 1;
UPDATE Email SET correo_electronico = 'nuevo_email2@email.com' WHERE id_dato = 2;
UPDATE Email SET correo_electronico = 'correo_actualizado1@email.com' WHERE id_dato = 3;
UPDATE Email SET correo_electronico = 'correo_actualizado2@email.com' WHERE id_dato = 4;
UPDATE Email SET correo_electronico = 'email@nuevo.com' WHERE id_dato = 5;
UPDATE Email SET correo_electronico = 'email_actualizado1@email.com' WHERE id_dato = 6;
UPDATE Email SET correo_electronico = 'email_actualizado2@email.com' WHERE id_dato = 7;
UPDATE Email SET correo_electronico = 'email@dominio.com' WHERE id_dato = 8;
UPDATE Email SET correo_electronico = 'nuevo_correo1@email.com' WHERE id_dato = 9;
UPDATE Email SET correo_electronico = 'nuevo_correo2@email.com' WHERE id_dato = 10;

UPDATE Telefono SET num_telefono = '999-999-9999' WHERE id_dato = 1;
UPDATE Telefono SET num_telefono = '777-777-7777' WHERE id_dato = 2;
UPDATE Telefono SET num_telefono = 'nuevo_telefono1' WHERE id_dato = 3;
UPDATE Telefono SET num_telefono = 'nuevo_telefono2' WHERE id_dato = 4;
UPDATE Telefono SET num_telefono = '123-456-7890' WHERE id_dato = 5;
UPDATE Telefono SET num_telefono = 'telefono_actualizado1' WHERE id_dato = 6;
UPDATE Telefono SET num_telefono = 'telefono_actualizado2' WHERE id_dato = 7;
UPDATE Telefono SET num_telefono = '987-654-3210' WHERE id_dato = 8;
UPDATE Telefono SET num_telefono = '555-555-5555' WHERE id_dato = 9;
UPDATE Telefono SET num_telefono = '444-444-4444' WHERE id_dato = 10;

UPDATE Contacto SET comentario_personal = 'Nuevo comentario 1' WHERE id = 1;
UPDATE Contacto SET comentario_personal = 'Nuevo comentario 2' WHERE id = 2;
UPDATE Contacto SET comentario_personal = 'Comentario actualizado 1' WHERE id = 3;
UPDATE Contacto SET comentario_personal = 'Comentario actualizado 2' WHERE id = 4;
UPDATE Contacto SET comentario_personal = 'Otro comentario' WHERE id = 5;
UPDATE Contacto SET comentario_personal = 'Vecino amigable' WHERE id = 6;
UPDATE Contacto SET comentario_personal = 'Comentario actualizado 3' WHERE id = 7;
UPDATE Contacto SET comentario_personal = 'Comentario actualizado 4' WHERE id = 8;
UPDATE Contacto SET comentario_personal = 'Amigo en línea' WHERE id = 9;
UPDATE Contacto SET comentario_personal = 'Pariente muy lejano' WHERE id = 10;

UPDATE Comentarios SET texto = 'Nuevo texto 1' WHERE id = 1;
UPDATE Comentarios SET texto = 'Nuevo texto 2' WHERE id = 2;
UPDATE Comentarios SET texto = 'Texto actualizado 1' WHERE id = 3;
UPDATE Comentarios SET texto = 'Texto actualizado 2' WHERE id = 4;
UPDATE Comentarios SET texto = 'Texto adicional' WHERE id = 5;
UPDATE Comentarios SET texto = 'Comentario actualizado 1' WHERE id = 6;
UPDATE Comentarios SET texto = 'Comentario actualizado 2' WHERE id = 7;
UPDATE Comentarios SET texto = 'Nuevo comentario 3' WHERE id = 8;
UPDATE Comentarios SET texto = 'Nuevo comentario 4' WHERE id = 9;
UPDATE Comentarios SET texto = 'Comentario en línea' WHERE id = 10;

UPDATE bloquearUsuario SET dni_session = '99999999' WHERE dni_user = '12345678';
UPDATE bloquearUsuario SET dni_user = '99999999' WHERE dni_session = '88888888';
UPDATE bloquearUsuario SET dni_session = '55555555' WHERE dni_user = '44444444';
UPDATE bloquearUsuario SET dni_user = '11111111' WHERE dni_session = '10101010';
UPDATE bloquearUsuario SET dni_session = '22222222' WHERE dni_user = '66666666';
UPDATE bloquearUsuario SET dni_user = '88888888' WHERE dni_session = '44444444';
UPDATE bloquearUsuario SET dni_session = '77777777' WHERE dni_user = '55555555';
UPDATE bloquearUsuario SET dni_user = '22222222' WHERE dni_session = '11111111';
UPDATE bloquearUsuario SET dni_session = '66666666' WHERE dni_user = '55555555';
UPDATE bloquearUsuario SET dni_user = '44444444' WHERE dni_session = '88888888';

UPDATE Grupo SET nombre = 'Grupo Actualizado 1' WHERE id = 1;
UPDATE Grupo SET nombre = 'Grupo Actualizado 2' WHERE id = 2;
UPDATE Grupo SET nombre = 'Nuevo Grupo 3' WHERE id = 3;
UPDATE Grupo SET nombre = 'Grupo Renombrado 4' WHERE id = 4;
UPDATE Grupo SET nombre = 'Grupo de Amigos' WHERE id = 5;
UPDATE Grupo SET nombre = 'Grupo 6' WHERE id = 6;
UPDATE Grupo SET nombre = 'Grupo 7' WHERE id = 7;
UPDATE Grupo SET nombre = 'Nuevo Grupo 8' WHERE id = 8;
UPDATE Grupo SET nombre = 'Grupo Modificado 9' WHERE id = 9;
UPDATE Grupo SET nombre = 'Grupo 10' WHERE id = 10;

UPDATE publicaUsuarioComentario SET id_comentario = 6 WHERE id_usuario = '12345678';
UPDATE publicaUsuarioComentario SET id_usuario = '88888888' WHERE id_comentario = 2;
UPDATE publicaUsuarioComentario SET id_comentario = 9 WHERE id_usuario = '33333333';
UPDATE publicaUsuarioComentario SET id_usuario = '55555555' WHERE id_comentario = 4;
UPDATE publicaUsuarioComentario SET id_comentario = 5 WHERE id_usuario = '11111111';
UPDATE publicaUsuarioComentario SET id_usuario = '10101010' WHERE id_comentario = 7;
UPDATE publicaUsuarioComentario SET id_comentario = 1 WHERE id_usuario = '77777777';
UPDATE publicaUsuarioComentario SET id_usuario = '99999999' WHERE id_comentario = 8;
UPDATE publicaUsuarioComentario SET id_comentario = 10 WHERE id_usuario = '66666666';
UPDATE publicaUsuarioComentario SET id_usuario = '44444444' WHERE id_comentario = 3;


-- -----------------------------------DELETES------------------------------------------------
DELETE FROM Usuario WHERE dni = '11111111';
DELETE FROM Usuario WHERE dni = '22222222';
DELETE FROM Usuario WHERE dni = '33333333';
DELETE FROM Usuario WHERE dni = '44444444';
DELETE FROM Usuario WHERE dni = '55555555';
DELETE FROM Usuario WHERE dni = '66666666';
DELETE FROM Usuario WHERE dni = '77777777';
DELETE FROM Usuario WHERE dni = '88888888';
DELETE FROM Usuario WHERE dni = '99999999';
DELETE FROM Usuario WHERE dni = '10101010';

DELETE FROM bloquearUsuario WHERE dni_user = '11111111' AND dni_session = '22222222';
DELETE FROM bloquearUsuario WHERE dni_user = '33333333' AND dni_session = '44444444';
DELETE FROM bloquearUsuario WHERE dni_user = '22222222' AND dni_session = '55555555';
DELETE FROM bloquearUsuario WHERE dni_user = '44444444' AND dni_session = '11111111';
DELETE FROM bloquearUsuario WHERE dni_user = '55555555' AND dni_session = '33333333';
DELETE FROM bloquearUsuario WHERE dni_user = '66666666' AND dni_session = '77777777';
DELETE FROM bloquearUsuario WHERE dni_user = '77777777' AND dni_session = '88888888';
DELETE FROM bloquearUsuario WHERE dni_user = '88888888' AND dni_session = '99999999';
DELETE FROM bloquearUsuario WHERE dni_user = '99999999' AND dni_session = '10101010';
DELETE FROM bloquearUsuario WHERE dni_user = '10101010' AND dni_session = '11111111';

DELETE FROM Email WHERE id_dato = 1;
DELETE FROM Email WHERE id_dato = 2;
DELETE FROM Email WHERE id_dato = 3;
DELETE FROM Email WHERE id_dato = 4;
DELETE FROM Email WHERE id_dato = 5;
DELETE FROM Email WHERE id_dato = 6;
DELETE FROM Email WHERE id_dato = 7;
DELETE FROM Email WHERE id_dato = 8;
DELETE FROM Email WHERE id_dato = 9;
DELETE FROM Email WHERE id_dato = 10;

DELETE FROM Telefono WHERE id_dato = 1;
DELETE FROM Telefono WHERE id_dato = 2;
DELETE FROM Telefono WHERE id_dato = 3;
DELETE FROM Telefono WHERE id_dato = 4;
DELETE FROM Telefono WHERE id_dato = 5;
DELETE FROM Telefono WHERE id_dato = 6;
DELETE FROM Telefono WHERE id_dato = 7;
DELETE FROM Telefono WHERE id_dato = 8;
DELETE FROM Telefono WHERE id_dato = 9;
DELETE FROM Telefono WHERE id_dato = 10;

DELETE FROM Contacto WHERE id = 1;
DELETE FROM Contacto WHERE id = 2;
DELETE FROM Contacto WHERE id = 3;
DELETE FROM Contacto WHERE id = 4;
DELETE FROM Contacto WHERE id = 5;
DELETE FROM Contacto WHERE id = 6;
DELETE FROM Contacto WHERE id = 7;
DELETE FROM Contacto WHERE id = 8;
DELETE FROM Contacto WHERE id = 9;
DELETE FROM Contacto WHERE id = 10;

DELETE FROM Comentarios WHERE id = 1;
DELETE FROM Comentarios WHERE id = 2;
DELETE FROM Comentarios WHERE id = 3;
DELETE FROM Comentarios WHERE id = 4;
DELETE FROM Comentarios WHERE id = 5;
DELETE FROM Comentarios WHERE id = 6;
DELETE FROM Comentarios WHERE id = 7;
DELETE FROM Comentarios WHERE id = 8;
DELETE FROM Comentarios WHERE id = 9;
DELETE FROM Comentarios WHERE id = 10;

DELETE FROM Grupo WHERE id = 1;
DELETE FROM Grupo WHERE id = 2;
DELETE FROM Grupo WHERE id = 3;
DELETE FROM Grupo WHERE id = 4;
DELETE FROM Grupo WHERE id = 5;
DELETE FROM Grupo WHERE id = 6;
DELETE FROM Grupo WHERE id = 7;
DELETE FROM Grupo WHERE id = 8;
DELETE FROM Grupo WHERE id = 9;
DELETE FROM Grupo WHERE id = 10;

DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 1;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 2;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 3;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 4;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 5;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 6;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 7;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 8;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 9;
DELETE FROM organizaUsuarioGrupo WHERE id_grupo = 10;

DELETE FROM formaParteContactoGrupo WHERE id_contacto = 1;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 2;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 3;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 4;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 5;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 6;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 7;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 8;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 9;
DELETE FROM formaParteContactoGrupo WHERE id_contacto = 10;

DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 1;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 2;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 3;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 4;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 5;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 6;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 7;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 8;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 9;
DELETE FROM puede_verGrupoContactoComentario WHERE id_comentario = 10;

DELETE FROM publicaUsuarioComentario WHERE id_usuario = '11111111';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '22222222';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '33333333';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '44444444';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '55555555';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '66666666';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '77777777';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '88888888';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '99999999';
DELETE FROM publicaUsuarioComentario WHERE id_usuario = '10101010';
