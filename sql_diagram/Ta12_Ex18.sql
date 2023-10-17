CREATE DATABASE Inmuebles; 
USE Inmuebles;

CREATE TABLE Persona (
    id INT PRIMARY KEY,
    DNI VARCHAR(8) NOT NULL,
    telefono_fijo VARCHAR(15),
    movil VARCHAR(15),
    nombre VARCHAR(100) NOT NULL,
    apellidos VARCHAR(255) NOT NULL
);

CREATE TABLE Cliente (
    codigo_personal INT PRIMARY KEY,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Trabajador (
    codigo_personal INT PRIMARY KEY,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Compra (
    codigo_compra INT PRIMARY KEY,
    fecha DATE NOT NULL,
    valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Alquiler (
    id INT PRIMARY KEY,
    codigo_inmueble INT NOT NULL,
    persona_alquilando INT,
    nombre_agente_empresa VARCHAR(255),
    FOREIGN KEY (codigo_inmueble) REFERENCES Inmueble(codigo_inmueble) ON DELETE CASCADE,
    FOREIGN KEY (persona_alquilando) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Alquilar (
    id_alquiler INT PRIMARY KEY,
    id_persona INT NOT NULL,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE Comprar (
    codigo_compra INT PRIMARY KEY,
    codigo_inmueble INT NOT NULL,
    id_persona INT NOT NULL,
    FOREIGN KEY (codigo_inmueble) REFERENCES Inmueble(codigo_inmueble) ON DELETE CASCADE,
    FOREIGN KEY (id_persona) REFERENCES Persona(id) ON DELETE CASCADE
);

CREATE TABLE PagosAlquiler (
    id INT PRIMARY KEY,
    año INT NOT NULL,
    mes INT NOT NULL,
    valor DECIMAL(10, 2) NOT NULL,
    id_alquiler INT NOT NULL,
    FOREIGN KEY (id_alquiler) REFERENCES Alquiler(id) ON DELETE CASCADE
);

CREATE TABLE Inmueble (
    codigo_inmueble INT PRIMARY KEY,
    direccion NVARCHAR(255) NOT NULL,
    metros_cuadrados DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Garajes (
    codigo_inmueble INT PRIMARY KEY,
    numero_garaje INT NOT NULL,
    planta INT NOT NULL
);

CREATE TABLE Pisos (
    codigo_inmueble INT PRIMARY KEY,
    codigo_especial VARCHAR(100) NOT NULL
);

CREATE TABLE Locales (
    codigo_inmueble INT PRIMARY KEY,
    uso VARCHAR(100) NOT NULL,
    servicio VARCHAR(255) NOT NULL
);

CREATE TABLE OtroTipo (
    codigo_inmueble INT PRIMARY KEY,
    uso VARCHAR(100) NOT NULL,
    servicio VARCHAR(255) NOT NULL
);

CREATE TABLE AsociarGarajePiso (
    codigo_inmueble_garaje INT,
    codigo_inmueble_piso INT,
    PRIMARY KEY (codigo_inmueble_garaje, codigo_inmueble_piso),
    FOREIGN KEY (codigo_inmueble_garaje) REFERENCES Garajes(codigo_inmueble) ON DELETE CASCADE,
    FOREIGN KEY (codigo_inmueble_piso) REFERENCES Pisos(codigo_inmueble) ON DELETE CASCADE
);
