CREATE DATABASE ejercicio2_Tabi;
USE ejercicio2_Tabi;

CREATE TABLE Avion(
	nro_avion integer,
    tipo_avion varchar(50),
    modelo varchar(50),
    primary key(nro_avion)
);
    
CREATE TABLE Vuelo(
	nro_vuelo integer,
    desde varchar(50),
    hasta varchar(50), 
    fecha date, 
    nro_avion integer,
    primary key(nro_vuelo),
    foreign key(nro_avion) references Avion(nro_avion)
);

CREATE TABLE Pasajero(
	nro_vuelo integer,
    documento integer,
    nombre varchar(50),
    primary key(nro_vuelo, documento),
    foreign key(nro_vuelo) references Vuelo(nro_vuelo)
);

INSERT INTO Avion (nro_avion, tipo_avion, modelo)
VALUES 
(2020, 'comercial', 'B-777'),
(2021, 'carga', '737-700'),
(2022, 'carga', 'MD-11'),
(2023, 'comercial', '777-200'),
(2024, 'comercial', '777-300ER'),
(2025, 'carga', '747-8i');

INSERT INTO Vuelo(nro_vuelo, desde, hasta, fecha, nro_avion)
VALUES
(1, 'Argentina', 'Camerum', '2019-06-26', 2020),
(2, 'Australia', 'Egipto', '2019-06-28', 2025),
(3, 'Alemania', 'Filipinas', '2019-06-30', 2022),
(4, 'Camerum', 'Japon', '2019-07-15', 2025),
(5, 'Filipinas', 'Mexico', '2019-07-12', 2021),
(6, 'Argentina', 'Francia', '2019-06-26', 2020),
(7, 'Marruecos', 'Panama', '2019-10-04', 2024),
(8, 'Rusia', 'Francia', '2019-12-30', 2023),
(9, 'Venezuela', 'Paraguay', '2019-08-12', 2025),
(10, 'Portugal', 'Uruguay', '2019-10-04', 2021),
(11, 'Portugal', 'Holanda', '2019-09-13', 2024);

INSERT  INTO Pasajero(nro_vuelo, documento, nombre)
VALUES
(1, 87654321, 'Jennifer'),
(6, 12345678, 'Brie'),
(4, 87651234, 'Emma'),
(2, 43218765, 'San'),
(7, 56781234, 'Cooke'),
(1, 32145678, 'Joy'),
(3, 45678321, 'Fury'),
(8, 12387654, 'Derek'),
(2, 21345678, 'Amy'),
(4, 23145678, 'Dominika'),
(9, 41235678, 'Shrader'),
(5, 51234678, 'Loki'),
(10, 61234578, 'Tom'),
(11, 12345679, 'Carol');

/* PUNTO 1 */
SELECT nro_vuelo
FROM Vuelo
WHERE (desde LIKE 'A%') AND (hasta LIKE 'F%');

/* PUNTO 2 */
SELECT nombre, Pasajero.nro_vuelo AS 'nro_vuelo'
FROM Pasajero INNER JOIN Vuelo
ON Pasajero.nro_vuelo = Vuelo.nro_vuelo
WHERE Vuelo.desde BETWEEN 'A%' AND'D%';

/* PUNTO 3 */
SELECT tipo_avion
FROM Avion INNER JOIN Vuelo
ON Avion.nro_avion = Vuelo.nro_avion
WHERE Vuelo.desde LIKE 'C%'
GROUP BY Vuelo.desde;

/* PUNTO 4 */
SELECT nro_avion, tipo_avion
FROM Avion
WHERE EXISTS (SELECT *
			  FROM Vuelo
              WHERE (Avion.nro_avion = Vuelo.nro_avion) AND (Vuelo.hasta LIKE 'H%'));
              
/* PUNTO 5 */
SELECT Avion.nro_avion AS 'nro de avion', Avion.modelo AS 'Modelo del avion', COUNT(Vuelo.nro_avion) AS 'Cantidad de vuelos'
FROM Avion INNER JOIN Vuelo
ON Avion.nro_avion = Vuelo.nro_avion
GROUP BY (Avion.nro_avion);

/* PUNTO 6 */
SELECT COUNT(DISTINCT Pasajero.nombre) AS 'Cantidad de pasajeros'
FROM Pasajero INNER JOIN Vuelo
ON Pasajero.nro_vuelo = Vuelo.nro_vuelo
INNER JOIN Avion
ON Vuelo.nro_avion = Avion.nro_avion
WHERE Avion.modelo LIKE 'B-777';

/* PUNTO 7 */	
SELECT COUNT(Pasajero.documento) AS 'Cantidad de pasajeros', Avion.tipo_avion AS 'Tipo de avion',
(COUNT(Pasajero.documento) / COUNT(Avion.tipo_avion)) AS Promedio
FROM Pasajero INNER JOIN Vuelo
ON Pasajero.nro_vuelo = Vuelo.nro_vuelo
INNER JOIN Avion
ON Vuelo.nro_avion = Avion.nro_avion
GROUP BY Avion.tipo_avion;

/* PUNTO 8 */                
SELECT Avion.tipo_avion AS 'Tipo de avion', nro_vuelo
FROM Avion INNER JOIN Vuelo
ON Avion.nro_avion = Vuelo.nro_avion
WHERE Vuelo.desde NOT LIKE 'B%' AND Vuelo.hasta NOT LIKE 'B%'
ORDER BY nro_vuelo;