CREATE DATABASE Parcial_Empleados;
USE Parcial_Empleados;

CREATE TABLE Empleado(
	legajo integer,
    nombre varchar(50),
    apellido varchar(50),
    sueldo integer,
    superior integer,
    PRIMARY KEY(legajo),
    FOREIGN KEY(superior) REFERENCES Empleado(legajo)
);

CREATE TABLE Proyecto(
	codigo integer,
    nombre varchar(50),
    inicio DATE,
    fin DATE,
    PRIMARY KEY(codigo)
);

CREATE TABLE Cargo(
	codigo integer,
    descripcion varchar(50),
    PRIMARY KEY(codigo)
);

CREATE TABLE Asignado_a(
	legajo integer,
    codigo integer,
    cargo integer,
    PRIMARY KEY(legajo, codigo, cargo),
    FOREIGN KEY(legajo) REFERENCES Empleado(legajo),
    FOREIGN KEY(codigo) REFERENCES Proyecto(codigo),
    FOREIGN KEY(cargo) REFERENCES Cargo(codigo)
);

INSERT INTO Empleado(legajo, nombre, apellido, sueldo)
VALUES
(1, 'Shrader', 'Egorova', 100),
(2, 'Brie', 'Larson', 50500),
(3, 'Jennifer', 'Lawrence', 60500),
(4, 'Taylor', 'Swift', 7800),
(5, 'Cooke', 'Maroney', 15300);

INSERT INTO Proyecto(codigo, nombre, inicio, fin)
VALUES
(20, 'P1', '2009-10-03', '2019-12-10'),
(21, 'P2', '2019-10-03', '2019-12-11'),
(22, 'P3', '2018-08-31', '2020-08-15'),
(23, 'P4', '2015-08-15', '2021-08-15');

INSERT INTO Cargo(codigo, descripcion)
VALUES
(1, 'lider'),
(2, 'superior'),
(3, 'analista'),
(4, 'ayudante');

INSERT INTO Asignado_a(legajo, codigo, cargo)
VALUES
(1, 20, 1),
(1, 20, 2),
(2, 20, 3),
(4, 20, 4),
(1, 21, 1),
(1, 22, 1),
(2, 23, 3);

/***************************************************** CONSULTAS ********************************************************/

/* A */
SELECT Empleado.legajo AS 'Legajo', Empleado.nombre AS 'Empleado'
FROM Empleado
WHERE (Empleado.sueldo > 60000) AND NOT EXISTS (SELECT *
												FROM Asignado_a
                                                WHERE Asignado_a.legajo = Empleado.legajo);
/* B */
SELECT Proyecto.nombre AS 'Proyecto'
FROM Proyecto
WHERE Proyecto.fin BETWEEN '2019-01-01' AND '2019-12-31' AND EXISTS (SELECT *
																	 FROM Asignado_a
                                                                     WHERE Asignado_a.codigo = Proyecto.codigo
                                                                     GROUP BY Asignado_a.codigo
                                                                     HAVING COUNT(Asignado_a.legajo) > 5);
                                                                     
/* C */
SELECT Empleado.nombre AS 'Empleado'
FROM Empleado
WHERE EXISTS (SELECT *
			  FROM Proyecto
              WHERE (Proyecto.inicio BETWEEN '2019-01-01' AND '2019-12-31') AND (Proyecto.fin BETWEEN '2019-01-01' AND '2019-12-31')
              AND EXISTS (SELECT *
						  FROM Asignado_a
                          WHERE (Asignado_a.legajo = Empleado.legajo) AND (Asignado_a.codigo = Proyecto.codigo)
                          GROUP BY Asignado_a.legajo
                          HAVING COUNT(Asignado_a.codigo) > 1))
GROUP BY Empleado.nombre; /* NO SALE ERROR; PERO NO DEVUELVE NADA */

/* D */
SELECT Cargo.codigo AS 'Cargo'
FROM Cargo
WHERE NOT EXISTS (SELECT *
				  FROM Asignado_a
                  WHERE Asignado_a.cargo = Cargo.codigo);
                  
/* E */
SELECT Empleado.legajo AS 'Legajo', Empleado.nombre AS 'Empleado', Asignado_a.codigo AS 'Proyecto'
FROM Empleado INNER JOIN Asignado_a
ON Empleado.legajo = Asignado_a.legajo
INNER JOIN Proyecto
ON Asignado_a.codigo = Proyecto.codigo
GROUP BY Proyecto.nombre; /* FUNCIONA, PERO NO DEL TODO */

/* F */
SELECT Empleado.nombre AS 'Empleado'
FROM Empleado INNER JOIN Asignado_a
ON Empleado.legajo = Asignado_a.legajo
WHERE EXISTS (SELECT *
			  FROM Proyecto
              WHERE Proyecto.codigo = Asignado_a.codigo)
GROUP BY Asignado_a.legajo
HAVING COUNT(Asignado_a.cargo) >1; /* FUNCIONA, PERO CON UN ERROR :| */

/* G */
SELECT Proyecto.nombre AS 'Proyecto'
FROM Proyecto
WHERE NOT EXISTS (SELECT *
			  FROM Cargo
              WHERE NOT EXISTS (SELECT *
							FROM Asignado_a
                            WHERE Asignado_a.codigo = Proyecto.codigo AND Asignado_a.cargo = Cargo.codigo));
                            
/* i */
SELECT Empleado.nombre AS 'Empleado'
FROM Empleado
WHERE EXISTS (SELECT *
			  FROM Asignado_a
              WHERE (Asignado_a.legajo = Empleado.legajo)
              GROUP BY Asignado_a.legajo
              HAVING COUNT(Asignado_a.codigo) > 1)
GROUP BY Empleado.nombre;