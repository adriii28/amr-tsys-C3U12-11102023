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
