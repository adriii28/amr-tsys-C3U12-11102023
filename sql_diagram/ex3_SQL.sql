CREATE DATABASE Geografia;
USE Geografia;

CREATE TABLE ComunidadAutonoma(
nombre varchar(20) PRIMARY KEY,
poblacion int not null,
superficie varchar(20) NOT NULL
);

CREATE TABLE Provincia(
codigo_provincial varchar(50) PRIMARY KEY,
nombre varchar(50) NOT NULL,
poblacion int,
superficie varchar(20),
nom_comunidad_autonoma varchar(20) NOT NULL,
FOREIGN KEY (nom_comunidad_autonoma) REFERENCES ComunidadAutonoma(nombre)  on delete cascade on update cascade
);

CREATE TABLE Localidad(
id varchar(20) PRIMARY KEY,
nombre varchar(100) NOT NULL,
poblacion int,
codigo_provincial_provincia varchar(50) NOT NULL,
FOREIGN KEY (codigo_provincial_provincia) REFERENCES Provincia(codigo_provincial) on delete cascade on update cascade
);

CREATE TABLE CapitalLocalidad(
id_localidad varchar(20),
codigo_provincial_provincia varchar(50),
FOREIGN KEY (id_localidad) REFERENCES Localidad(id),
FOREIGN KEY (codigo_provincial_provincia) REFERENCES Provincia(codigo_provincial),
PRIMARY KEY(id_localidad,codigo_provincial_provincia)
);

CREATE TABLE CapitalProvincia(
nombre_comunidad_autonoma varchar(20),
codigo_provincial_provincia varchar(50),
FOREIGN KEY (nombre_comunidad_autonoma) REFERENCES ComunidadAutonoma(nombre) on delete cascade on update cascade,
FOREIGN KEY (codigo_provincial_provincia) REFERENCES Provincia(codigo_provincial) on delete cascade on update cascade,
PRIMARY KEY(nombre_comunidad_autonoma,codigo_provincial_provincia)
);

-- -----------------------------------INSERTS------------------------------------------------
-- Insertar comunidad autónoma 1
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Andalucía', 8400000, '87,268 km²');

-- Insertar comunidad autónoma 2
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Cataluña', 7560000, '32,114 km²');

-- Insertar comunidad autónoma 3
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Madrid', 6685000, '802 km²');

-- Insertar comunidad autónoma 4
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Valencia', 5003769, '23,255 km²');

-- Insertar comunidad autónoma 5
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Galicia', 2699499, '29,574 km²');

-- Insertar comunidad autónoma 6
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Aragón', 1319291, '47,719 km²');

-- Insertar comunidad autónoma 7
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Islas Canarias', 2207225, '7,447 km²');

-- Insertar comunidad autónoma 8
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Asturias', 1022800, '10,604 km²');

-- Insertar comunidad autónoma 9
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Castilla y León', 2409164, '94,223 km²');

-- Insertar comunidad autónoma 10
INSERT INTO ComunidadAutonoma (nombre, poblacion, superficie)
VALUES ('Murcia', 1494442, '11,313 km²');

-- Insertar provincia 1
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV001', 'Sevilla', 1950216, '14,042 km²', 'Andalucía');

-- Insertar provincia 2
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV002', 'Barcelona', 5664579, '7,721 km²', 'Cataluña');

-- Insertar provincia 3
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV003', 'Madrid', 6691406, '8,028 km²', 'Madrid');

-- Insertar provincia 4
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV004', 'Valencia', 2565124, '10,809 km²', 'Valencia');

-- Insertar provincia 5
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV005', 'A Coruña', 1121910, '7,951 km²', 'Galicia');

-- Insertar provincia 6
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV006', 'Zaragoza', 977444, '17,274 km²', 'Aragón');

-- Insertar provincia 7
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV007', 'Las Palmas', 1107227, '4,057 km²', 'Islas Canarias');

-- Insertar provincia 8
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV008', 'Oviedo', 1027112, '6,981 km²', 'Asturias');

-- Insertar provincia 9
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV009', 'León', 459838, '15,615 km²', 'Castilla y León');

-- Insertar provincia 10
INSERT INTO Provincia (codigo_provincial, nombre, poblacion, superficie, nom_comunidad_autonoma)
VALUES ('PROV010', 'Murcia', 1494442, '11,313 km²', 'Murcia');

-- Insertar localidad 1
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC001', 'Sevilla', 690566, 'PROV001');

-- Insertar localidad 2
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC002', 'Barcelona', 1620343, 'PROV002');

-- Insertar localidad 3
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC003', 'Madrid', 3334730, 'PROV003');

-- Insertar localidad 4
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC004', 'Valencia', 791413, 'PROV004');

-- Insertar localidad 5
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC005', 'A Coruña', 246028, 'PROV005');

-- Insertar localidad 6
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC006', 'Zaragoza', 666880, 'PROV006');

-- Insertar localidad 7
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC007', 'Las Palmas de Gran Canaria', 380998, 'PROV007');

-- Insertar localidad 8
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC008', 'Oviedo', 220567, 'PROV008');

-- Insertar localidad 9
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC009', 'León', 127067, 'PROV009');

-- Insertar localidad 10
INSERT INTO Localidad (id, nombre, poblacion, codigo_provincial_provincia)
VALUES ('LOC010', 'Murcia', 451322, 'PROV010');

-- Insertar capital de localidad 1
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC001', 'PROV001');

-- Insertar capital de localidad 2
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC002', 'PROV002');

-- Insertar capital de localidad 3
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC003', 'PROV003');

-- Insertar capital de localidad 4
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC004', 'PROV004');

-- Insertar capital de localidad 5
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC005', 'PROV005');

-- Insertar capital de localidad 6
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC006', 'PROV006');

-- Insertar capital de localidad 7
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC007', 'PROV007');

-- Insertar capital de localidad 8
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC008', 'PROV008');

-- Insertar capital de localidad 9
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC009', 'PROV009');

-- Insertar capital de localidad 10
INSERT INTO CapitalLocalidad (id_localidad, codigo_provincial_provincia)
VALUES ('LOC010', 'PROV010');

-- Insertar capital de provincia 1
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Andalucía', 'PROV001');

-- Insertar capital de provincia 2
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Cataluña', 'PROV002');

-- Insertar capital de provincia 3
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Madrid', 'PROV003');

-- Insertar capital de provincia 4
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Valencia', 'PROV004');

-- Insertar capital de provincia 5
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Galicia', 'PROV005');

-- Insertar capital de provincia 6
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Aragón', 'PROV006');

-- Insertar capital de provincia 7
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Islas Canarias', 'PROV007');

-- Insertar capital de provincia 8
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Asturias', 'PROV008');

-- Insertar capital de provincia 9
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Castilla y León', 'PROV009');

-- Insertar capital de provincia 10
INSERT INTO CapitalProvincia (nombre_comunidad_autonoma, codigo_provincial_provincia)
VALUES ('Murcia', 'PROV010');

-- -----------------------------------INSERTS------------------------------------------------
-- Actualizar la población de la comunidad autónoma 'Andalucía'
UPDATE ComunidadAutonoma
SET poblacion = 8500000
WHERE nombre = 'Andalucía';

-- Actualizar la superficie de la comunidad autónoma 'Cataluña'
UPDATE ComunidadAutonoma
SET superficie = '32,445 km²'
WHERE nombre = 'Cataluña';

-- Actualizar la población de la provincia 'Sevilla'
UPDATE Provincia
SET poblacion = 2100000
WHERE codigo_provincial = 'PROV001';

-- Actualizar la superficie de la provincia 'Barcelona'
UPDATE Provincia
SET superficie = '7,800 km²'
WHERE codigo_provincial = 'PROV002';

-- Actualizar la población de la localidad 'Sevilla'
UPDATE Localidad
SET poblacion = 750000
WHERE id = 'LOC001';

-- Actualizar la población de la localidad 'Barcelona'
UPDATE Localidad
SET poblacion = 1700000
WHERE id = 'LOC002';

-- Actualizar la capital de localidad de 'Sevilla'
UPDATE CapitalLocalidad
SET codigo_provincial_provincia = 'PROV002'
WHERE id_localidad = 'LOC001';

-- Actualizar la capital de localidad de 'Barcelona'
UPDATE CapitalLocalidad
SET codigo_provincial_provincia = 'PROV001'
WHERE id_localidad = 'LOC002';

-- Actualizar la capital de provincia de 'Andalucía'
UPDATE CapitalProvincia
SET codigo_provincial_provincia = 'PROV003'
WHERE nombre_comunidad_autonoma = 'Andalucía';

-- Actualizar la capital de provincia de 'Cataluña'
UPDATE CapitalProvincia
SET codigo_provincial_provincia = 'PROV004'
WHERE nombre_comunidad_autonoma = 'Cataluña';

-- -----------------------------------DELETES------------------------------------------------

-- Eliminar la capital de localidad de 'León'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC009';

-- Eliminar la capital de localidad de 'Oviedo'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC008';

-- Eliminar la capital de localidad de 'Murcia'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC010';

-- Eliminar la capital de localidad de 'Las Palmas de Gran Canaria'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC007';

-- Eliminar la capital de localidad de 'Zaragoza'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC006';

-- Eliminar la capital de localidad de 'A Coruña'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC005';

-- Eliminar la capital de localidad de 'Valencia'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC004';

-- Eliminar la capital de localidad de 'Madrid'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC003';

-- Eliminar la capital de localidad de 'Barcelona'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC002';

-- Eliminar la capital de localidad de 'Sevilla'
DELETE FROM CapitalLocalidad
WHERE id_localidad = 'LOC001';


-- Eliminar la capital de provincia de 'Murcia'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Murcia';

-- Eliminar la capital de provincia de 'Castilla y León'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Castilla y León';

-- Eliminar la capital de provincia de 'Asturias'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Asturias';

-- Eliminar la capital de provincia de 'Islas Canarias'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Islas Canarias';

-- Eliminar la capital de provincia de 'Aragón'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Aragón';

-- Eliminar la capital de provincia de 'Galicia'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Galicia';

-- Eliminar la capital de provincia de 'Valencia'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Valencia';

-- Eliminar la capital de provincia de 'Madrid'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Madrid';

-- Eliminar la capital de provincia de 'Cataluña'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Cataluña';

-- Eliminar la capital de provincia de 'Andalucía'
DELETE FROM CapitalProvincia
WHERE nombre_comunidad_autonoma = 'Andalucía';

-- Eliminar la comunidad autónoma 'Asturias'
DELETE FROM ComunidadAutonoma
WHERE nombre = 'Asturias';

-- Eliminar la comunidad autónoma 'Castilla y León'
DELETE FROM ComunidadAutonoma
WHERE nombre = 'Castilla y León';

-- Eliminar la comunidad autónoma 'Murcia'
DELETE FROM ComunidadAutonoma
WHERE nombre = 'Murcia';

-- Eliminar la provincia 'León'
DELETE FROM Provincia
WHERE codigo_provincial = 'PROV009';

-- Eliminar la provincia 'Oviedo'
DELETE FROM Provincia
WHERE codigo_provincial = 'PROV008';

-- Eliminar la provincia 'Murcia'
DELETE FROM Provincia
WHERE codigo_provincial = 'PROV010';

-- Eliminar la localidad 'León'
DELETE FROM Localidad
WHERE id = 'LOC009';

-- Eliminar la localidad 'Oviedo'
DELETE FROM Localidad
WHERE id = 'LOC008';

-- Eliminar la localidad 'Murcia'
DELETE FROM Localidad
WHERE id = 'LOC010';
