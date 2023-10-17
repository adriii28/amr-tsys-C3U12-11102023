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
