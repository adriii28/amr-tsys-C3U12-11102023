CREATE DATABASE Vuelos;

USE Vuelos;

drop table Clientes;
drop table Aeropuerto;
drop table Vuelo;
drop table TarjetaEmbarque;
drop table Plazas;
drop table Avion;

CREATE TABLE Clientes(
dni varchar(9) ,
nombre varchar(20) not null,
apellidos varchar(20) not null,
direccion varchar(20),
tarjeta_credito varchar(20) not null,
PRIMARY KEY (dni)
);

SELECT * FROM Clientes; 

INSERT INTO Clientes (dni, nombre, apellidos, direccion, tarjeta_credito) VALUES 
('12345678A', 'Adrian', 'Gallego', 'Calle 1', '1111 1111 1111 1111'),
('87654321B', 'Robert', 'Lopez', 'Calle 2', '2222 2222 2222 2222'),
('11223344C', 'Manel', 'Castellvi', 'Calle 3', '1234 1234 1234 1234'),
('12121212V', 'Pepe', 'Gonzalez', 'Calle 4', '4321 4321 4321 4321'),
('41821923P', 'Jorge', 'Martinez', 'Calle 5', '1212 3434 5656 7878'),
('45678901F', 'Carlos', 'Perez', 'Calle 6', '1414 2323 7878 9090'),
('78901234G', 'Maria', 'Torres', 'Calle 7', '5525 5525 2252 2252'),
('56789012I', 'Francisco', 'Perez', 'Calle 8', '0909 1234 3912 1234'),
('76543210M', 'Dani', 'Gonzalez', 'Calle 9', '1234 4321 5678 4321'),
('12345098L', 'Toni', 'Martinez', 'Calle 10', '3512 6764 1253 1353');


UPDATE Clientes SET direccion = 'Calle 55' WHERE dni = '12345678A';
UPDATE Clientes SET tarjeta_credito = '9999 9999 9999 9999' WHERE dni = '87654321B';
UPDATE Clientes SET apellidos = 'Lorenzo' WHERE dni = '11223344C';
UPDATE Clientes SET direccion = 'Calle docker' WHERE dni = '12121212V';
UPDATE Clientes SET apellidos = 'Apellido' WHERE dni = '41821923P';
UPDATE Clientes SET nombre = 'Marc' WHERE dni = '45678901F';
UPDATE Clientes SET apellidos = 'Apellido' WHERE dni = '78901234G';
UPDATE Clientes SET direccion = 'Calle calle' WHERE dni = '56789012I';
UPDATE Clientes SET nombre= 'Nombre' WHERE dni = '76543210M';
UPDATE Clientes SET tarjeta_credito = '7777 7777 7777 7777' WHERE dni = '12345098L';


DELETE FROM Clientes WHERE dni='12345678A';
DELETE FROM Clientes WHERE dni='87654321B';
DELETE FROM Clientes WHERE dni='11223344C';
DELETE FROM Clientes WHERE dni='12121212V';
DELETE FROM Clientes WHERE dni='41821923P';
DELETE FROM Clientes WHERE dni='45678901F';
DELETE FROM Clientes WHERE dni='78901234G';
DELETE FROM Clientes WHERE dni='56789012I';
DELETE FROM Clientes WHERE dni='76543210M';
DELETE FROM Clientes WHERE dni='12345098L';



CREATE TABLE Aeropuerto (
id_aero int auto_increment,
nombre varchar(50) not null,
localidad varchar(20) not null,
pais varchar(20) not null,
PRIMARY KEY (id_aero)
);

SELECT * FROM Aeropuerto; 

INSERT INTO Aeropuerto (nombre, localidad, pais) VALUES 
('Aeropuerto el prat', 'Barcelona', 'España'),
('Aeropuerto Internacional de Dubái', 'Garhoud', 'Dubai'),
('Aeropuerto Internacional de Denver', 'Denver', 'Estados Unidos'),
('Aeropuerto Internacional de Tokio-Haneda', 'Ota', 'Japon'),
('Aeropuerto de Londres-Heathrowt', 'Hillingdon', 'Reino Unido'),
('Aeropuerto Internacional de Sídney', 'Sidney', 'Australia'),
('Aeropuerto Internacional John F. Kennedy', 'Queens', 'Estados Unidos'),
('Aeropuerto Internacional de Cancún', 'Cancun', 'Mexico'),
('Aeropuerto Internacional de Los Ángeles ', 'Los Angeles', 'Estados Unidos'),
('Aeropuerto Internacional de Madrid-Barajas', 'Madrid', 'España');


UPDATE Aeropuerto SET nombre = 'Aeropuerto de Múnich' WHERE id_aero = 1;
UPDATE Aeropuerto SET localidad = 'Baviera' WHERE id_aero = 1;
UPDATE Aeropuerto SET pais = 'Alemania' WHERE id_aero = 1;
UPDATE Aeropuerto SET nombre = 'Aeropuerto Internacional de Pekín-Capital ' WHERE id_aero = 2;
UPDATE Aeropuerto SET localidad = 'Tokio' WHERE id_aero = 2;
UPDATE Aeropuerto SET pais = 'China' WHERE id_aero = 2;
UPDATE Aeropuerto SET localidad = 'Pekin' WHERE id_aero = 2;
UPDATE Aeropuerto SET nombre = 'Aeropuerto Internacional de Roma-Fiumicino ' WHERE id_aero = 2;
UPDATE Aeropuerto SET localidad = 'Roma' WHERE id_aero = 2;
UPDATE Aeropuerto SET pais = 'Italia' WHERE id_aero = 2;


DELETE FROM Aeropuerto WHERE id_aero=1;
DELETE FROM Aeropuerto WHERE id_aero=2;
DELETE FROM Aeropuerto WHERE id_aero=3;
DELETE FROM Aeropuerto WHERE id_aero=4;
DELETE FROM Aeropuerto WHERE id_aero=5;
DELETE FROM Aeropuerto WHERE id_aero=6;
DELETE FROM Aeropuerto WHERE id_aero=7;
DELETE FROM Aeropuerto WHERE id_aero=8;
DELETE FROM Aeropuerto WHERE id_aero=9;
DELETE FROM Aeropuerto WHERE id_aero=10;


CREATE TABLE Vuelo (
id_vuelo int auto_increment,
hora_salida time,
hora_llegada time,
fecha_salida date,
fecha_llegada date,
id_aerop_salida int not null,
id_aerop_llegada int not null,
PRIMARY KEY (id_vuelo),
FOREIGN KEY (id_aerop_salida) REFERENCES Aeropuerto(id_aero)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_aerop_llegada) REFERENCES Aeropuerto(id_aero)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Vuelo;

INSERT INTO Vuelo (hora_salida, hora_llegada, fecha_salida,fecha_llegada,id_aerop_salida,id_aerop_llegada) VALUES 
('14:15:00', '16:30:00', '2023-10-21', '2023-10-21', 3, 7),
('09:30:00', '11:45:00', '2023-10-22', '2023-10-22', 2, 8),
('17:45:00', '20:00:00', '2023-10-23', '2023-10-23', 4, 5),
('10:30:00', '12:45:00', '2023-10-24', '2023-10-24', 1, 3),
('19:15:00', '21:30:00', '2023-10-25', '2023-10-25', 3, 6),
('11:30:00', '13:45:00', '2023-10-26', '2023-10-26', 4, 2),
('20:45:00', '23:00:00', '2023-10-27', '2023-10-27', 3, 10),
('12:30:00', '14:45:00', '2023-10-28', '2023-10-28', 9, 5),
('21:15:00', '23:30:00', '2023-10-29', '2023-10-29', 5, 6),
('13:30:00', '15:45:00', '2023-10-30', '2023-10-30', 10, 4);

UPDATE Vuelo SET hora_salida = '20:30:00' WHERE id_vuelo = 1;
UPDATE Vuelo SET fecha_llegada = '2023-10-21' WHERE id_vuelo = 2;
UPDATE Vuelo SET hora_salida = '16:45:00' WHERE id_vuelo = 3;
UPDATE Vuelo SET fecha_llegada = '2023-10-25' WHERE id_vuelo = 4;
UPDATE Vuelo SET hora_salida = '20:30:00' WHERE id_vuelo = 5;
UPDATE Vuelo SET fecha_llegada = '2023-10-27' WHERE id_vuelo = 6;
UPDATE Vuelo SET hora_salida = '20:30:00' WHERE id_vuelo = 7;
UPDATE Vuelo SET fecha_llegada = '2023-10-29' WHERE id_vuelo = 8;
UPDATE Vuelo SET hora_salida = '20:30:00' WHERE id_vuelo = 9;
UPDATE Vuelo SET fecha_llegada = '2023-10-31' WHERE id_vuelo = 10;

DELETE FROM Vuelo WHERE id_vuelo=1;
DELETE FROM Vuelo WHERE id_vuelo=2;
DELETE FROM Vuelo WHERE id_vuelo=3;
DELETE FROM Vuelo WHERE id_vuelo=4;
DELETE FROM Vuelo WHERE id_vuelo=5;
DELETE FROM Vuelo WHERE id_vuelo=6;
DELETE FROM Vuelo WHERE id_vuelo=7;
DELETE FROM Vuelo WHERE id_vuelo=8;
DELETE FROM Vuelo WHERE id_vuelo=9;
DELETE FROM Vuelo WHERE id_vuelo=10;

CREATE TABLE TarjetaEmbarque(
num_tarjeta_embarque int auto_increment,
dni_cliente varchar(9),
id_vuelo int not null,
PRIMARY KEY (num_tarjeta_embarque),
FOREIGN KEY (dni_cliente) REFERENCES Clientes(dni)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM TarjetaEmbarque;

INSERT INTO TarjetaEmbarque (dni_cliente, id_vuelo) VALUES 
('12345678A', 1),
('87654321B', 2),
('11223344C', 3),
('12121212V', 4),
('41821923P', 5),
('45678901F', 6),
('78901234G', 7),
('56789012I', 8),
('76543210M', 9),
('12345098L', 10);

UPDATE TarjetaEmbarque SET dni_cliente = '12345678A' WHERE id_vuelo = 10;
UPDATE TarjetaEmbarque SET dni_cliente = '87654321B' WHERE id_vuelo = 9;
UPDATE TarjetaEmbarque SET dni_cliente = '11223344C' WHERE id_vuelo = 8;
UPDATE TarjetaEmbarque SET dni_cliente = '12121212V' WHERE id_vuelo = 7;
UPDATE TarjetaEmbarque SET dni_cliente = '41821923P' WHERE id_vuelo = 6;
UPDATE TarjetaEmbarque SET dni_cliente = '45678901F' WHERE id_vuelo = 5;
UPDATE TarjetaEmbarque SET dni_cliente = '78901234G' WHERE id_vuelo = 4;
UPDATE TarjetaEmbarque SET dni_cliente = '56789012I' WHERE id_vuelo = 3;
UPDATE TarjetaEmbarque SET dni_cliente = '76543210M' WHERE id_vuelo = 2;
UPDATE TarjetaEmbarque SET dni_cliente = '12345098L' WHERE id_vuelo = 1;

DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 1;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 2;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 3;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 4;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 5;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 6;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 7;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 8;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 9;
DELETE FROM TarjetaEmbarque where num_tarjeta_embarque = 10;


CREATE TABLE Plazas(
id_plaza int auto_increment,
fecha_reserva date,
PRIMARY KEY (id_plaza)
);

SELECT * FROM Plazas;

INSERT INTO Plazas (fecha_reserva) VALUES 
('2023-10-21'),
('2023-10-22'),
('2023-10-23'),
('2023-10-24'),
('2023-10-25'),
('2023-10-26'),
('2023-10-27'),
('2023-10-28'),
('2023-10-29'),
('2023-10-30');

UPDATE Plazas SET fecha_reserva = '2023-9-21' WHERE id_plaza = 1;
UPDATE Plazas SET fecha_reserva = '2023-9-22' WHERE id_plaza = 2;
UPDATE Plazas SET fecha_reserva = '2023-9-23' WHERE id_plaza = 3;
UPDATE Plazas SET fecha_reserva = '2023-9-24' WHERE id_plaza = 4;
UPDATE Plazas SET fecha_reserva = '2023-9-25' WHERE id_plaza = 5;
UPDATE Plazas SET fecha_reserva = '2023-9-26' WHERE id_plaza = 6;
UPDATE Plazas SET fecha_reserva = '2023-9-27' WHERE id_plaza = 7;
UPDATE Plazas SET fecha_reserva = '2023-9-28' WHERE id_plaza = 8;
UPDATE Plazas SET fecha_reserva = '2023-9-29' WHERE id_plaza = 9;
UPDATE Plazas SET fecha_reserva = '2023-9-30' WHERE id_plaza = 10;

DELETE FROM Plazas where id_plaza = 1;
DELETE FROM Plazas where id_plaza = 2;
DELETE FROM Plazas where id_plaza = 3;
DELETE FROM Plazas where id_plaza = 4;
DELETE FROM Plazas where id_plaza = 5;
DELETE FROM Plazas where id_plaza = 6;
DELETE FROM Plazas where id_plaza = 7;
DELETE FROM Plazas where id_plaza = 8;
DELETE FROM Plazas where id_plaza = 9;
DELETE FROM Plazas where id_plaza = 10;


CREATE TABLE Avion(
id_avion int auto_increment,
num_plazas int,
id_plaza int not null,
id_vuelo int not null,
PRIMARY KEY (id_avion),
FOREIGN KEY (id_plaza) REFERENCES Plazas(id_plaza)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (id_vuelo) REFERENCES Vuelo(id_vuelo)
ON DELETE CASCADE ON UPDATE CASCADE
);

SELECT * FROM Avion;

INSERT INTO Avion (num_plazas,id_plaza,id_vuelo) VALUES 
(100,1,1),
(100,2,2),
(100,3,3),
(100,4,4),
(100,5,5),
(100,6,6),
(100,7,7),
(100,8,8),
(100,9,9),
(100,10,10);


UPDATE Avion SET num_plazas = 120 WHERE id_avion = 1;
UPDATE Avion SET num_plazas = 150 WHERE id_avion = 2;
UPDATE Avion SET num_plazas = 200 WHERE id_avion = 3;
UPDATE Avion SET num_plazas = 210 WHERE id_avion = 4;
UPDATE Avion SET num_plazas = 230 WHERE id_avion = 5;
UPDATE Avion SET num_plazas = 140 WHERE id_avion = 6;
UPDATE Avion SET num_plazas = 300 WHERE id_avion = 7;
UPDATE Avion SET num_plazas = 85 WHERE id_avion = 8;
UPDATE Avion SET num_plazas = 195 WHERE id_avion = 9;
UPDATE Avion SET num_plazas = 200 WHERE id_avion = 10;

DELETE FROM Avion where id_avion = 1;
DELETE FROM Avion where id_avion = 2;
DELETE FROM Avion where id_avion = 3;
DELETE FROM Avion where id_avion = 4;
DELETE FROM Avion where id_avion = 5;
DELETE FROM Avion where id_avion = 6;
DELETE FROM Avion where id_avion = 7;
DELETE FROM Avion where id_avion = 8;
DELETE FROM Avion where id_avion = 9;
DELETE FROM Avion where id_avion = 10;





