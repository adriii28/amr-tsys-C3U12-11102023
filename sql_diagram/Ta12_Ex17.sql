CREATE DATABASE HorarioEscolar; 
USE HorarioEscolar;

CREATE TABLE Profesor (
    DNI VARCHAR(8) PRIMARY KEY,
    direccion VARCHAR(255),
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo_electronico VARCHAR(255),
    num_seg_social VARCHAR(15),
    codigo_interno INT,
    años_antiguedad INT
);

CREATE TABLE Asignatura (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    codigo_interno_centro INT,
    codigo_europeo VARCHAR(15),
    curso_ciclo INT,
    entidad VARCHAR(100),
    id_profesor VARCHAR(8),
    fecha_inicio DATE,
    fecha_finalizacion DATE,
    FOREIGN KEY (id_profesor) REFERENCES Profesor(DNI) ON DELETE CASCADE
);

CREATE TABLE Requiere (
    id_asignatura_pedido INT,
    id_asignatura_nuevo INT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_asignatura_pedido, id_asignatura_nuevo),
    FOREIGN KEY (id_asignatura_pedido) REFERENCES Asignatura(id) ON DELETE CASCADE,
    FOREIGN KEY (id_asignatura_nuevo) REFERENCES Asignatura(id) ON DELETE CASCADE
);

CREATE TABLE Ciclo (
    id INT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    codigo_interno INT,
    id_curso INT
);

CREATE TABLE Importe (
    id_asignatura INT,
    id_ciclo INT,
    PRIMARY KEY (id_asignatura, id_ciclo),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id) ON DELETE CASCADE,
    FOREIGN KEY (id_ciclo) REFERENCES Ciclo(id)
);

CREATE TABLE Aula (
    id INT PRIMARY KEY,
    codigo VARCHAR(15),
    nombre VARCHAR(100) NOT NULL,
    numero_aula INT,
    metros_cuadrados DECIMAL(10, 2)
);

CREATE TABLE Ocupa (
    id_asignatura INT,
    id_aula INT,
    PRIMARY KEY (id_asignatura, id_aula),
    FOREIGN KEY (id_asignatura) REFERENCES Asignatura(id) ON DELETE CASCADE,
    FOREIGN KEY (id_aula) REFERENCES Aula(id)
);

CREATE TABLE Curso (
    id INT PRIMARY KEY,
    dia_semana VARCHAR(15),
    hora_dia DATE
);

CREATE TABLE HorarioEscolar (
    id INT PRIMARY KEY,
    dia_semana VARCHAR(15) NOT NULL,
    hora_dia DATE NOT NULL,
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES Curso(id) ON DELETE CASCADE
);
