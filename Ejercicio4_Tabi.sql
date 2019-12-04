CREATE DATABASE ejercicio4_Tabi;
USE ejercicio4_Tabi;
/*drop database ejercicio4_Tabi;*/
CREATE TABLE Persona(
	nro_persona integer,
    nombre varchar(50),
    calle varchar(50),
    ciudad varchar(50),
    nro_supervisor integer,
    PRIMARY KEY(nro_persona),
    FOREIGN KEY(nro_supervisor) REFERENCES Persona(nro_persona));
    
CREATE TABLE Empresa(
	nro_empresa integer,
    nombre varchar(50),
    razon_social varchar(50),
    calle varchar(50),
    ciudad varchar(50),
    PRIMARY KEY(nro_empresa));
    
CREATE TABLE Trabaja(
	nro_persona integer,
    nro_empresa integer,
    salario integer,
    fecha_ingreso date,
    FOREIGN KEY(nro_persona) REFERENCES Persona(nro_persona),
    FOREIGN KEY(nro_empresa) REFERENCES Empresa(nro_empresa));
    
    INSERT INTO Persona(nro_persona, nombre, calle, ciudad)
    VALUES
    (2021, 'Jennifer', 'C1', 'Ciud 1'),
    (2022, 'Cooke', 'C2', 'Ciud 2'),
    (2023, 'Brie', 'C3', 'Ciud 3'),
    (2024, 'Emma', 'C4', 'Ciud 4'),
    (2025, 'Sam', 'C5', 'Ciud 5'),
    (2026, 'Joy', 'C6', 'Ciud 6'),
    (2027, 'Fury', 'C7', 'Ciud 7'),
    (2028, 'Derek', 'C8', 'Ciud 8'),
    (2029, 'Amy', 'C1', 'Ciud 1'),
    (2030, 'Dominika', 'C2', 'Ciud 2'),
    (2031, 'Shrader', 'C9', 'Ciud 9'),
    (2032, 'Carol', 'C3', 'Ciud 3');
    
    INSERT INTO Empresa(nro_empresa, nombre, razon_social, calle, ciudad)
    VALUES
    (1, 'Balenco', 'RS 1', 'C1', 'Ciud 1'),
    (2, 'Paulinas', 'RS 2', 'C2', 'Ciud 2'),
    (3, 'Tecnosur', 'RS 3', 'C10', 'Ciud 10'),
    (4, 'Sparrow', 'RS 4', 'C11', 'Ciud 11'),
    (5, 'Shield', 'RS 5', 'C12', 'Ciud 12'),
    (6, 'Maroney', 'RS 6', 'C13', 'Ciud 13');
    
    INSERT INTO Trabaja(nro_persona, nro_empresa, salario, fecha_ingreso)
    VALUES
    (2021, 1, 9000, '2000-08-15'),
    (2022, 2, 1550, '2000-10-03'),
    (2023, 1, 900, '2015-01-15'),
    (2024, 2, 1450, '2016-07-09'),
    (2025, 3, 700, '2017-09-13'),
    (2026, 4, 3500, '2018-10-10'),
    (2027, 2, 3500, '2019-12-12'),
    (2028, 3, 1800, '2000-02-10'),
    (2029, 1, 8900, '2005-03-20'),
    (2030, 2, 1915, '2009-04-25'),
    (2031, 3, 10500, '2010-08-20'),
    (2032, 5, 1000, '2011-12-10'),
    (2021, 2, 7850, '2001-08-31'),
    (2021, 3, 9700, '2003-10-01'),
    (2021, 4, 10500, '2000-03-01'),
    (2021, 5, 9000, '2002-05-10'),
    (2022, 6, 1100, '2001-06-04'),
    (2022, 1, 9980, '2002-09-22'),
    (2022, 3, 500, '2003-11-30'),
    (2022, 4, 1996, '2000-10-19');
    
/******************************************** CONSULTAS ****************************************************/

/* PUNTO 1 */
SELECT Persona.nombre AS 'Nombre', Persona.ciudad AS 'Ciudad'
FROM Persona INNER JOIN Trabaja
ON Persona.nro_persona = Trabaja.nro_persona
INNER JOIN Empresa
ON Trabaja.nro_empresa = Empresa.nro_empresa
WHERE Empresa.nombre LIKE 'Balenco';
                                  
/* PUNTO 2 */
SELECT Persona.nombre, Persona.calle, Persona.ciudad
FROM Persona INNER JOIN Trabaja
ON Persona.nro_persona = Trabaja.nro_persona
INNER JOIN Empresa
ON Trabaja.nro_empresa = Empresa.nro_empresa
WHERE Empresa.nombre LIKE 'Paulinas' AND Trabaja.salario >1500; 

/* PUNTO 3 */
SELECT Persona.nombre AS 'Persona nombre'
FROM Persona INNER JOIN Trabaja
ON Persona.nro_persona = Trabaja.nro_persona
INNER JOIN Empresa
ON Trabaja.nro_empresa = Empresa.nro_empresa
WHERE Empresa.ciudad = Persona.ciudad;

/* PUNTO 4 */
/* NO CARGUÉ LOS SUPERVISORES :| */

/* PUNTO 5 */
SELECT Persona.nombre AS 'Nombre', Persona.ciudad AS 'Ciudad'
FROM Persona 
WHERE  EXISTS (SELECT *
				  FROM Empresa
                  WHERE Empresa.nombre NOT LIKE 'Tecnosur' 
                  AND  EXISTS (SELECT *
								  FROM Trabaja
                                  WHERE (Trabaja.nro_persona = Persona.nro_persona) AND (Trabaja.nro_empresa = Empresa.nro_empresa)
                                  AND Trabaja.salario > 1));
						
/* PUNO 7 */
SELECT Persona.nombre AS 'Empleado'
FROM Persona
WHERE EXISTS (SELECT *
			  FROM Trabaja
              WHERE (Trabaja.nro_persona = Persona.nro_persona) 
              AND Trabaja.fecha_ingreso BETWEEN '2000-01-01' AND '2004-03-31'
              GROUP BY Trabaja.nro_persona
              HAVING COUNT(Trabaja.nro_empresa) > 4);
                                  