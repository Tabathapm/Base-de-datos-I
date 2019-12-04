CREATE DATABASE ejercicio5_Tabi;
USE ejercicio5_Tabi;

CREATE TABLE Chofer(
	nro_chofer integer,
    nombre varchar(50),
    f_ingreso date,
    telefono integer,
    PRIMARY KEY(nro_chofer)
);

CREATE TABLE Auto(
	patente varchar(10),
    modelo varchar(10),
    año integer,
    PRIMARY KEY(patente)
);

CREATE TABLE Cliente(
	nro_cliente integer,
    nombre varchar(50),
    domicilio varchar(50),
    localidad varchar(50),
    PRIMARY KEY(nro_cliente)
);

CREATE TABLE Viaje(
	nro_chofer integer,
    nro_cliente integer,
    patente varchar(10),
    fecha date,
    km_totales integer,
    tiempo_espera time,
    PRIMARY KEY(nro_chofer, nro_cliente, patente, fecha),
    FOREIGN KEY(nro_chofer) REFERENCES Chofer(nro_chofer),
    FOREIGN KEY(nro_cliente) REFERENCES Cliente(nro_cliente),
    FOREIGN KEY(patente) REFERENCES Auto(patente)
);

INSERT INTO Chofer(nro_chofer, nombre, f_ingreso, telefono)
VALUES
(1, 'Jen', '2000-08-15', 20839412),
(2, 'Cooke', '2000-10-03', 20831294),
(3, 'Brie', '2015-01-15', 46901531),
(4, 'Emma', '2016-02-16', 46908301),
(5, 'Sam', '2017-03-17', 46690110),
(6, 'Joy', '2018-04-18', 46698190),
(7, 'Fury', '2001-05-19', 12345678),
(8, 'Derek', '2002-06-20', 56781234),
(9, 'Amy', '2003-07-21', 36696667),
(10, 'Dominika', '2004-11-22', 66673669);

INSERT INTO Auto(patente, modelo, año)
VALUES
('A1', 'A', 2010),
('A2', 'B', 2008),
('B1', 'C', 2019),
('B2', 'D', 2015),
('C1', 'E', 2005),
('C2', 'F', 2009),
('D1', 'G', 2015),
('D2', 'H', 2000);

INSERT INTO Cliente(nro_cliente, nombre, domicilio, localidad)
VALUES
(2020, 'Shaila', 'dom 1', 'Casanova'),
(2021, 'Shrader', 'dom 2', 'Ramos Mejia'),
(2022, 'Loki', 'dom 3', 'Moron'),
(2023, 'Tom', 'dom 4', 'San Justo'),
(2024, 'Carol', 'dom 5', 'San Justo'),
(2025, 'Katniss', 'dom 6', 'Ramos Mejia'),
(2026, 'Peeta', 'dom 7', 'Ramos Mejia'),
(2027, 'Prim', 'dom 8', 'Casanova');

INSERT INTO Viaje(nro_cliente, nro_chofer, patente, fecha, km_totales, tiempo_espera)
VALUES
(2020, 1, 'A1', '2000-01-15', 20, '01:30:19'),
(2020, 2, 'A2', '2001-02-16', 30, '00:55:00'),
(2020, 3, 'B1', '2002-03-17', 40, '00:30:15'),
(2020, 4, 'B2', '2003-04-18', 50, '00:40:16'),
(2020, 5, 'C1', '2004-05-19', 60, '00:15:30'),
(2020, 6, 'C2', '2005-06-20', 70, '00:20:40'),
(2020, 7, 'D1', '2006-07-21', 80, '00:45:10'),
(2020, 8, 'D2', '2007-08-22', 90, '00:22:12'),
(2021, 9, 'A2', '2005-09-23', 100, '00:20:15'),
(2022, 10, 'B1', '2009-10-24', 105, '00:30:16'),
(2023, 2, 'B2', '2010-11-25', 120, '00:40:17'),
(2024, 9, 'C1', '2011-12-26', 130, '00:55:18'),
(2025, 4, 'C2', '2005-12-27', 140, '00:43:19'),
(2026, 6, 'D1', '2013-11-28', 150, '00:10:20'),
(2027, 9, 'D2', '2014-10-29', 160, '00:19:21');

/* PUNTO 1 */
SELECT AVG(tiempo_espera) AS 'Tiempo', fecha
FROM Viaje
WHERE Viaje.fecha BETWEEN '2005-01-01' AND '2005-12-31' AND (SELECT SUM(tiempo_espera)
															 FROM Viaje);
                                                             
/* PUNTO 2 */
SELECT Cliente.nombre AS 'nombre'
FROM Cliente
WHERE NOT EXISTS (SELECT *
			  FROM Auto
              WHERE NOT EXISTS(SELECT *
						   FROM Viaje
                           WHERE Viaje.nro_cliente = Cliente.nro_cliente AND Viaje.patente = Auto.patente));
                           
/* PUNTO 3 */
SELECT Chofer.nombre AS 'Nombre del chofer', Chofer.telefono AS 'Telefono'
FROM Chofer
WHERE EXISTS(SELECT *
			 FROM Auto
             WHERE Auto.año < 2010 AND EXISTS (SELECT *
											   FROM Viaje
											   WHERE Viaje.nro_chofer = Chofer.nro_chofer AND Viaje.patente = Auto.patente));
                                               
/* PUNTO 4 */
SELECT Auto.patente, Auto.modelo, SUM(Viaje.km_totales) AS 'KM'
FROM Auto INNER JOIN Viaje
ON Auto.patente = Viaje.patente
GROUP BY Auto.patente, Auto.modelo;

/* PUNTO 5 Y 6 FALTA EL COSTO DEL VIAJE */

/* PUNTO 7 */
