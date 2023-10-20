CREATE DATABASE Futbol;

USE Futbol;

CREATE TABLE Liga (
nombre varchar(20),
fecha_inicio date,
fecha_fin date,
PRIMARY KEY (nombre)
);

SELECT * FROM Liga;

INSERT INTO Liga (nombre, fecha_inicio, fecha_fin) VALUES 
('Liga Española', '2023-08-10', '2024-05-20'),
('Premier League', '2023-08-12', '2024-05-19'),
('Serie A', '2023-08-18', '2024-05-26'),
('Bundesliga', '2023-08-16', '2024-05-25'),
('Ligue 1', '2023-08-11', '2024-05-21'),
('Eredivisie', '2023-08-09', '2024-05-24'),
('Primeira Liga', '2023-08-07', '2024-05-27'),
('Major League Soccer', '2023-02-25', '2023-10-28'),
('Superliga Argentina', '2023-07-30', '2024-05-19'),
('Brasileirao', '2023-05-14', '2024-12-12');

UPDATE Liga SET fecha_inicio = '2023-07-11' WHERE nombre = 'Ligue 1';
UPDATE Liga SET fecha_fin = '2024-04-21' WHERE nombre = 'Ligue 1';

DELETE FROM Liga WHERE nombre = 'Eredivisie';
DELETE FROM Liga WHERE nombre = 'Bundesliga';

CREATE TABLE Equipo (
id int auto_increment,
nombre_equipo varchar(20) not null,
pais varchar(20),
entrendador varchar(20) not null,
nombre_liga varchar(20),
PRIMARY KEY (id),
FOREIGN KEY (nombre_liga) REFERENCES Liga(nombre)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Equipo;

INSERT INTO Equipo (nombre_equipo, pais, entrendador, nombre_liga) VALUES
('Real Madrid', 'España', 'Zinedine Zidane', 'Liga Española'),
('FC Barcelona', 'España', 'Ronald Koeman', 'Liga Española'),
('Manchester United', 'Inglaterra', 'Ole Gunnar Solskjær', 'Premier League'),
('Liverpool', 'Inglaterra', 'Jürgen Klopp', 'Premier League'),
('AC Milan', 'Italia', 'Stefano Pioli', 'Serie A'),
('Inter de Milán', 'Italia', 'Simone Inzaghi', 'Serie A'),
('Bayern Munich', 'Alemania', 'Julian Nagelsmann', 'Bundesliga'),
('Borussia Dortmund', 'Alemania', 'Marco Rose', 'Bundesliga'),
('Paris Saint-Germain', 'Francia', 'Mauricio Pochettino', 'Ligue 1'),
('AS Monaco', 'Francia', 'Niko Kovač', 'Ligue 1');

UPDATE Equipo SET entrendador = 'Ronald Ronald' WHERE id = 1;
UPDATE Equipo SET pais = 'España' WHERE id = 2;

DELETE FROM Equipo WHERE id = 1;
DELETE FROM Equipo WHERE id = 2;
DELETE FROM Equipo WHERE id = 3;

CREATE TABLE Jugador (
dni varchar(20),
nombre varchar(20) not null,
posicion varchar(20) not null,
fecha_nacimiento date,
id_equipo int not null,
PRIMARY KEY (dni),
FOREIGN KEY (id_equipo) REFERENCES Equipo(id)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Jugador;

INSERT INTO Jugador (dni, nombre, posicion, fecha_nacimiento, id_equipo) VALUES
('11111111A', 'Cristiano Ronaldo', 'Delantero', '1985-02-05', 1),
('44444444D', 'Lionel Messi', 'Delantero', '1987-06-24', 2),
('77777777G', 'Bruno Fernandes', 'Centrocampista', '1994-09-08', 3),
('10101010J', 'Virgil van Dijk', 'Defensa', '1991-07-08', 4),
('13131313M', 'Gianluigi Donnarumma', 'Portero', '1999-02-25', 5),
('16161616P', 'Romelu Lukaku', 'Delantero', '1993-05-13', 6),
('19191919S', 'Robert Lewandowski', 'Delantero', '1988-08-21', 7),
('22222222V', 'Erling Haaland', 'Delantero', '2000-07-21', 8),
('25252525Y', 'Neymar Jr.', 'Delantero', '1992-02-05', 9),
('28282828AB', 'Wissam Ben Yedder', 'Delantero', '1990-08-12', 10);

UPDATE Jugador SET nombre = 'CR7' WHERE dni = '11111111A';
UPDATE Jugador SET posicion = 'Centro' WHERE dni = '44444444D';
UPDATE Jugador SET id_equipo = 2 WHERE dni = '77777777G';

DELETE FROM Jugador WHERE dni = '11111111A';
DELETE FROM Jugador WHERE dni = '22222222V';
DELETE FROM Jugador WHERE dni = '28282828AB';

CREATE TABLE Partidos (
id_partido int auto_increment,
estadio varchar(50) not null,
fecha_partido date,
nombre_liga varchar(20) not null,
PRIMARY KEY (id_partido),
FOREIGN KEY (nombre_liga) REFERENCES Liga(nombre)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Partidos;

INSERT INTO Partidos (estadio, fecha_partido, nombre_liga) VALUES
('Estadio Santiago Bernabéu', '2023-08-20', 'Liga Española'),
('Old Trafford', '2023-08-19', 'Premier League'),
('San Siro', '2023-08-21', 'Serie A'),
('Allianz Arena', '2023-08-17', 'Bundesliga'),
('Parc des Princes', '2023-08-20', 'Ligue 1'),
('Johan Cruyff Arena', '2023-08-18', 'Ligue 1'),
('Estadio do Dragão', '2023-08-20', 'Primeira Liga'),
('Mercedes-Benz Stadium', '2023-03-04', 'Major League Soccer'),
('Estadio Monumental', '2023-08-10', 'Superliga Argentina'),
('Maracanã', '2023-05-20', 'Brasileirao');

UPDATE Partidos SET estadio = 'Camp Nou' WHERE id_partido = 1;
UPDATE Partidos SET fecha_partido = '2023-08-20' WHERE id_partido = 2;
UPDATE Partidos SET estadio = 'Santiago Bernabeu' WHERE id_partido = 3;

DELETE FROM Partidos WHERE id_partido = 1;
DELETE FROM Partidos WHERE id_partido = 2;
DELETE FROM Partidos WHERE id_partido = 10;

CREATE TABLE Juega (
id_equipo1 int ,
id_equipo2 int ,
id_partido int,
PRIMARY KEY (id_equipo1,id_equipo2,id_partido),
FOREIGN KEY (id_equipo1) REFERENCES Equipo(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_equipo2) REFERENCES Equipo(id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_partido) REFERENCES Partidos(id_partido)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Juega;

INSERT INTO Juega (id_equipo1, id_equipo2, id_partido) VALUES 
(1, 2, 1),
(3, 4, 2),
(5, 6, 3),
(7, 8, 4),
(9, 10, 5),
(10, 1, 6),
(9, 2, 7),
(8, 3, 8),
(7, 4, 9),
(6, 5, 10);

UPDATE Juega SET id_equipo1 = 2 WHERE id_partido = 4;
UPDATE Juega SET id_equipo2 = 1 WHERE id_partido = 2;

DELETE FROM Juega WHERE id_partido = 1;
DELETE FROM Juega WHERE id_partido = 2;
DELETE FROM Juega WHERE id_partido = 10;







