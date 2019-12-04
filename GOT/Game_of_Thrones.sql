CREATE DATABASE Game_of_Thrones; 
USE Game_of_Thrones;

CREATE TABLE Fuerte(
	tipo_fuerte varchar(2),
    descripcion varchar(50),
    PRIMARY KEY(tipo_fuerte)
);

CREATE TABLE Emblema(
	id_emblema integer,
    animal varchar(50),
    color varchar(50),
    PRIMARY KEY(id_emblema)
);

CREATE TABLE Continente(
	id_continente integer,
    nombre varchar(50),
    posicion varchar(50),
    PRIMARY KEY(id_continente)
);

CREATE TABLE Estatus(
	id_estatus integer,
    nombre varchar(50),
    PRIMARY KEY(id_estatus)
);

CREATE TABLE Especie(
	nombre_cientifico varchar(50),
    existe varchar(2),
    hostil varchar(2),
    PRIMARY KEY(nombre_cientifico)
);

CREATE TABLE Profesion(
	nombre_profesion varchar(50),
    tipo varchar(2),
    PRIMARY KEY(nombre_profesion)
);

CREATE TABLE Maestro(
	codigo integer,
    nombre_profesion varchar(50),
    PRIMARY KEY(codigo, nombre_profesion),
    FOREIGN KEY(nombre_profesion) REFERENCES Profesion(nombre_profesion)
);

CREATE TABLE Habilidad(
	id_habilidad varchar(50),
    nombre_cientifico varchar(50),
    PRIMARY KEY(id_habilidad, nombre_cientifico),
    FOREIGN KEY(nombre_cientifico) REFERENCES Especie(nombre_cientifico)
);

CREATE TABLE Reino(
	nombre_reino varchar(50),
    cant_habitantes integer,
    id_continente integer,
    PRIMARY KEY(nombre_reino),
    FOREIGN KEY(id_continente) REFERENCES Continente(id_continente)
);

CREATE TABLE Casa(
	nombre_casa varchar(50),
    lema varchar(50),
    fecha_fundacion integer,
    religion varchar(50),
    nombre_reino varchar(50),
    id_emblema integer,
    PRIMARY KEY(nombre_casa),
    FOREIGN KEY(nombre_reino) REFERENCES Reino(nombre_reino),
    FOREIGN KEY(id_emblema) REFERENCES Emblema(id_emblema)
);

CREATE TABLE Castillo(
	nombre_castillo varchar(50),
    cant_sirvientes integer,
    nombre_reino varchar(50),
    tipo_fuerte varchar(2),
    PRIMARY KEY(nombre_castillo, nombre_reino),
    FOREIGN KEY(nombre_reino) REFERENCES Reino(nombre_reino),
    FOREIGN KEY(tipo_fuerte) REFERENCES Fuerte(tipo_fuerte)
);

CREATE TABLE Personaje(
	fecha_nacimiento integer,
    nombre_personaje varchar(50),
    bastardo varchar(2),
    nombre_madre varchar(50),
    f_nac_madre integer,
    nombre_padre varchar(50),
    f_nac_padre integer,
    nombre_cientifico varchar(50),
    id_estatus integer,
    nombre_casa varchar(50),
    PRIMARY KEY(fecha_nacimiento, nombre_personaje),
    FOREIGN KEY(f_nac_madre, nombre_madre) REFERENCES Personaje(fecha_nacimiento, nombre_personaje) ,
	FOREIGN KEY(f_nac_padre, nombre_padre) REFERENCES Personaje(fecha_nacimiento, nombre_personaje),
    FOREIGN KEY(nombre_cientifico) REFERENCES Especie(nombre_cientifico),
    FOREIGN KEY(id_estatus) REFERENCES Estatus(id_estatus),
    FOREIGN KEY(nombre_casa) REFERENCES Casa(nombre_casa)
);

CREATE TABLE Guerra(
	año_inicio integer,
    cant_muertes integer,
    id_continente integer,
    PRIMARY KEY(año_inicio, id_continente),
    FOREIGN KEY(id_continente) REFERENCES Continente(id_continente)
);

CREATE TABLE Ejerce(
	nombre_profesion varchar(50),
    nombre_personaje varchar(50),
    fecha_nacimiento integer,
    PRIMARY KEY(nombre_profesion, nombre_personaje, fecha_nacimiento),
    FOREIGN KEY(nombre_profesion) REFERENCES Profesion(nombre_profesion),
    FOREIGN KEY(fecha_nacimiento, nombre_personaje) REFERENCES Personaje(fecha_nacimiento, nombre_personaje)
);

CREATE TABLE Participa(
	nombre_casa varchar(50),
    año_inicio integer,
    id_continente integer,
    resultado varchar(20),
    PRIMARY KEY(nombre_casa, año_inicio, id_continente),
    FOREIGN KEY(nombre_casa) REFERENCES Casa(nombre_casa),
    FOREIGN KEY(año_inicio) REFERENCES Guerra(año_inicio),
    FOREIGN KEY(id_continente) REFERENCES Guerra(id_continente)
);

CREATE TABLE Ciudad(
	id_ciudad integer,
    nombre varchar(50),
    extension_km integer,
    nombre_reino varchar(50),
    PRIMARY KEY(id_ciudad),
    FOREIGN KEY(nombre_reino) REFERENCES Reino(nombre_reino)
);

INSERT INTO Fuerte(tipo_fuerte, descripcion)
VALUES
('A', 'descripcion A'),
('B', 'descripcion B'),
('C', 'descripcion C'),
('D', 'descripcion D'),
('E', 'descripcion E');

INSERT INTO Emblema(id_emblema, animal, color)
VALUES
(1, 'lobo', 'gris'),
(2, 'leon', 'dorado'),
(3, 'venado', 'negro'),
(4, 'dragon', 'negro');

INSERT INTO Continente(id_continente, nombre, posicion)
VALUES
(1, 'Poniente', 'Norte'),
(2, 'Essos', 'Sur'),
(3, 'Sothoryos', 'Este'),
(4, 'Ulthos', 'Oeste');

INSERT INTO Especie(nombre_cientifico, existe, hostil)
VALUES
('Humano', 'si', 'si'),
('Gigante', 'no', 'si'),
('Hijo del Bosque', 'no', 'no');

INSERT INTO Profesion(nombre_profesion, tipo)
VALUES
('profesion 1', 'A'),
('profesion 2', 'B'),
('profesion 3', 'C'),
('profesion 4', 'A');

INSERT INTO Estatus(id_estatus, nombre)
VALUES
(2020, 'vivo'),
(2021, 'muerto'),
(2022, 'inactivo');

INSERT INTO Reino(nombre_reino, cant_habitantes, id_continente)
VALUES
('Reino del Norte', 2000000, 1),
('Reino de la Roca', 2370500, 1),
('Reino de las Tormentas', 2350000, 1),
('Reino Targaryen', 1978072, 2);

INSERT INTO Casa(nombre_casa, lema, fecha_fundacion, religion, nombre_reino, id_emblema)
VALUES
('Stark', 'Se acerca el invierno', 125, 'La Fe de los Siete', 'Reino del Norte', 1),
('Lannister', 'Oye mi rugido', 126, 'El Dios Ahogado', 'Reino de la Roca', 2),
('Baratheon', 'Nuestra es la furia', 125, 'Los Viejos Dioses', 'Reino de las Tormentas', 3),
('Targaryen', 'Fuego y sangre', 126, 'Rhllor', 'Reino Targaryen', 4);

INSERT INTO Habilidad(id_habilidad, nombre_cientifico)
VALUES
('h1', 'Humano'),
('h2', 'Humano'),
('h3', 'Gigante'),
('h4', 'Hijo del Bosque'),
('h5', 'Humano'),
('h6', 'Humano'),
('h7', 'Humano'),
('h8', 'Humano');

INSERT INTO Castillo(nombre_castillo, cant_sirvientes, nombre_reino, tipo_fuerte)
VALUES
('C1', 100, 'Reino de las Tormentas', 'A'),
('C2', 150, 'Reino del Norte', 'B'),
('C3', 70, 'Reino de la Roca', 'C'),
('C4', 95, 'Reino Targaryen' , 'D'),
('C5', 13, 'Reino del Norte', 'E'),
('C2', 66, 'Reino de la Roca', 'B'),
('C4', 70, 'Reino de las Tormentas', 'D');

/****************** SIN MADRE NI PADRE **********************/
INSERT INTO Personaje(fecha_nacimiento, nombre_personaje, bastardo, nombre_cientifico, id_estatus, nombre_casa)
VALUES
(230, 'Rickard Stark', 'No', 'Humano', 2021, 'Stark'),
(264, 'Catelyn Stark', 'No', 'Humano', 2022, 'Stark'), 
(283, 'Jon Snow', 'Si', 'Humano', 2022, 'Stark'), 
(244, 'Aerys Targaryen', 'No', 'Humano', 2021, 'Targaryen'),
(266, 'Cersei Lannister', 'No', 'Humano', 2020, 'Baratheon'),
(262, 'Robert Baratheon', 'No', 'Humano', 2020, 'Baratheon'),
(266, 'Jaime Lannister', 'No', 'Humano', 2020, 'Lannister');

/****************** CON PADRE, SIN MADRE ********************/
INSERT INTO Personaje(fecha_nacimiento, nombre_personaje, bastardo, f_nac_padre, nombre_padre, nombre_cientifico, id_estatus, nombre_casa)
VALUES
(263, 'Eddard Stark', 'No', 230, 'Rickard Stark', 'Gigante', 2021, 'Stark'),
(266, 'Lyanna Stark', 'No', 230, 'Rickard Stark', 'Humano', 2021, 'Stark'),
(276, 'Viserys Targaryen', 'No', 244, 'Aerys Targaryen', 'Humano', 2020, 'Targaryen'),
(284, 'Daenerys Targaryen', 'No', 244, 'Aerys Targaryen', 'Humano', 2020, 'Targaryen');

/******************* CON MADRE Y PADRE **********************/
INSERT INTO Personaje(fecha_nacimiento, nombre_personaje, bastardo, f_nac_madre, nombre_madre, f_nac_padre, nombre_padre, nombre_cientifico, id_estatus, nombre_casa)
VALUES
(283, 'Robb Stark', 'No', 264, 'Catelyn Stark', 263, 'Eddard Stark', 'Humano', 2020, 'Stark'),
(286, 'Sansa Stark', 'No', 264, 'Catelyn Stark', 263, 'Eddard Stark', 'Humano', 2020, 'Stark'),
(289, 'Arya Stark', 'No', 264, 'Catelyn Stark', 263, 'Eddard Stark', 'Humano', 2020, 'Stark'),
(286, 'Joffrey Baratheon', 'No', 266, 'Cersei Lannister', 266, 'Jaime Lannister', 'Humano', 2020, 'Lannister'),
(291, 'Tommen Baratheon', 'No', 266, 'Cersei Lannister', 266, 'Jaime Lannister', 'Humano', 2020, 'Lannister');

INSERT INTO Maestro(codigo, nombre_profesion)
VALUES
(112, 'profesion 1'),
(113, 'profesion 2'),
(114, 'profesion 3'),
(115, 'profesion 1');

INSERT INTO Guerra(año_inicio, cant_muertes, id_continente)
VALUES
(130, 800, 1),
(135, 570, 2),
(140, 1270, 4);

INSERT INTO Ejerce(nombre_profesion, fecha_nacimiento, nombre_personaje)
VALUES
('profesion 1', 283, 'Jon Snow'),
('profesion 2', 283, 'Jon Snow'),
('profesion 3', 283, 'Jon Snow'),
('profesion 4', 283, 'Jon Snow'),
('profesion 1', 289, 'Arya Stark'),
('profesion 2', 262, 'Robert Baratheon'),
('profesion 3', 291, 'Tommen Baratheon'),
('profesion 1', 266, 'Jaime Lannister'),
('profesion 2', 284, 'Daenerys Targaryen'),
('profesion 3', 284, 'Daenerys Targaryen');


INSERT INTO Participa(nombre_casa, año_inicio, id_continente, resultado)
VALUES
('Stark', 130, 1, 'Gano'),
('Baratheon', 130, 1, 'Perdio'),
('Lannister', 135, 2, 'Gano'),
('Stark', 135, 2, 'Perdio'),
('Baratheon', 140, 4, 'Gano'),
('Lannister', 140, 4, 'Perdio');

INSERT INTO Ciudad(id_ciudad, nombre, extension_km, nombre_reino)
VALUES
(131, 'ciudad 1', 12000, 'Reino Targaryen'),
(132, 'ciudad 2', 15000, 'Reino Targaryen'),
(133, 'ciudad 3', 11500, 'Reino del Norte'),
(134, 'ciudad 4', 18750, 'Reino del Norte'),
(135, 'ciudad 5', 11800, 'Reino de la Roca'),
(136, 'ciudad 6', 11855, 'Reino de la Roca'),
(137, 'ciudad 7', 16782, 'Reino de las Tormentas'),
(138, 'ciudad 8', 10550, 'Reino de las Tormentas');

/* CONSULTA 1 */
SELECT Ciudad.nombre AS 'Nombre de la ciudad'
FROM Ciudad
WHERE NOT EXISTS (SELECT *
				  FROM Reino
                  WHERE Ciudad.nombre_reino = Reino.nombre_reino);
                  
/* CONSULTA 2 */
SELECT Casa.nombre_casa AS 'Casa'
FROM Casa
WHERE NOT EXISTS (SELECT *
				  FROM Participa
                  WHERE Participa.nombre_casa = Casa.nombre_casa);
                  
/* CONSULTA 3 */
SELECT COUNT(Personaje.nombre_casa) AS 'Cantidad de integrantes', nombre_casa AS 'Nombre de la Casa'
FROM Personaje 
GROUP BY nombre_casa
ORDER BY COUNT(Personaje.nombre_casa) DESC;

/* CONSULTA 4 */              
SELECT Personaje.nombre_personaje AS 'Personaje', SUM(Ciudad.extension_km) AS 'KM'
FROM Personaje INNER JOIN Casa
ON Personaje.nombre_casa = Casa.nombre_casa
INNER JOIN Ciudad
ON Casa.nombre_reino = Ciudad.nombre_reino
GROUP BY Personaje.nombre_personaje
/*HAVING SUM(Ciudad.extension_km)*/
ORDER BY SUM(Ciudad.extension_km) DESC;

/* CONSULTA 5 */
SELECT Personaje.nombre_personaje AS 'Personaje'
FROM Personaje
WHERE NOT EXISTS (SELECT*
				  FROM Profesion
				  WHERE NOT EXISTS (SELECT *
									FROM Ejerce
									WHERE (Ejerce.nombre_profesion = Profesion.nombre_profesion) 
									AND (Personaje.nombre_personaje = Ejerce.nombre_personaje) 
									AND (Personaje.fecha_nacimiento = Ejerce.fecha_nacimiento)));
                            
/* CONSULTA 6 */
SELECT Personaje.nombre_casa AS 'Casa'
FROM Personaje
WHERE NOT EXISTS (SELECT*
				  FROM Profesion
				  WHERE NOT EXISTS (SELECT *
									FROM Ejerce
									WHERE (Ejerce.nombre_profesion = Profesion.nombre_profesion) 
									AND (Personaje.nombre_personaje = Ejerce.nombre_personaje) 
									AND (Personaje.fecha_nacimiento = Ejerce.fecha_nacimiento)));
                            
/* CONSULTA 7 */              
SELECT COUNT(Personaje.nombre_cientifico) AS 'Ranking', Personaje.nombre_cientifico AS 'Especie', Personaje.nombre_casa AS 'Casa'
FROM Personaje INNER JOIN Casa
ON Personaje.nombre_casa = Casa.nombre_casa
WHERE Casa.fecha_fundacion BETWEEN 1 AND 1000
GROUP BY Casa.nombre_casa
ORDER BY COUNT(Personaje.nombre_cientifico) ASC;

/* CONSULTA 8 */
SELECT SUM(Guerra.cant_muertes) AS 'Cantidad de muertes', ((SUM(Guerra.cant_muertes)*100) / (SELECT SUM(Reino.cant_habitantes) FROM Reino)) AS 'Porcentaje'
FROM Guerra
WHERE Guerra.año_inicio BETWEEN 1 AND 1000; 

/* CONSULTA 9 */
SELECT Especie.nombre_cientifico AS 'Especies que se han cruzado'
FROM Especie
WHERE EXISTS (SELECT *
				FROM Personaje
                WHERE Personaje.nombre_cientifico = Especie.nombre_cientifico);