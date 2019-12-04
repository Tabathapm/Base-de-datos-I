CREATE DATABASE Parcial_Veterinario;
USE Parcial_Veterinario;

CREATE TABLE Veterinario(
	matricula integer,
    apellido varchar(50),
    nombre varchar(50),
    direccion varchar(50),
    cp varchar (5),
    PRIMARY KEY(matricula)
);

CREATE TABLE Dueño(
	dni integer,
    apellido varchar(50),
    nombre varchar(50),
    direccion varchar(50),
    cp varchar (5),
    PRIMARY KEY(dni)
);

CREATE TABLE Mascota(
	codigo integer,
    duenio integer,
    nombre varchar(50),
    animal varchar(50),
    PRIMARY KEY(codigo),
    FOREIGN KEY(duenio) REFERENCES Dueño(dni)
);

CREATE TABLE HC(
	matricula integer,
    codigo integer,
    fecha date,
    diagnostico varchar(50),
    tratamiento varchar(5),
    PRIMARY KEY(matricula, codigo, fecha),
    FOREIGN KEY(matricula) REFERENCES Veterinario(matricula),
    FOREIGN KEY(codigo) REFERENCES Mascota(codigo)
);

INSERT INTO Veterinario(matricula, apellido, nombre, direccion, cp)
VALUES
(2020, 'Maroney', 'Cooke', 'San Justo', 1111),
(2021, 'Egorova', 'Dominika', 'San Justo', 1111),
(2022, 'Shepherd', 'Derek', 'Moron', 2222),
(2023, 'Hutcherson', 'Josh', 'Luzuriaga', 3333);

INSERT INTO Dueño(dni, apellido, nombre, direccion, cp)
VALUES
(1, 'Lawrence', 'Jennifer', 'San Justo', 1111),
(2, 'Stone', 'Emma', 'Castillo', 4444),
(3, 'Larson', 'Brie', 'Moron', 2222),
(4, 'Swift', 'Taylor', 'Luzuriaga', 3333),
(5, 'Spellman', 'Sabrina', 'San Justo', 1111);

INSERT INTO Mascota(codigo, duenio, nombre, animal)
VALUES
(1, 1, 'Zoe', 'Perro'),
(2, 2, 'Wilson', 'Perro'),
(3, 3, 'Sasha', 'Perro'),
(4, 4, 'Taz', 'Perro'),
(5, 5, 'Pompin', 'Conejo');

INSERT INTO HC(matricula, codigo, fecha, diagnostico, tratamiento)
VALUES
(2020, 1, '2019-11-15', 'vacunado', 'A'),
(2020, 2, '2019-06-15', 'vacunado', 'A'),
(2021, 3, '2008-06-10', 'castrado', 'B'),
(2022, 4, '1996-10.03', 'castrado', 'B'),
(2023, 5, '1999-12-31', 'vacunado', 'A'),
(2020, 1, '2019-12-15', 'vacunado', 'A');

/***************************************************** CONSULTAS ********************************************************/

/* A */
SELECT Mascota.nombre AS 'Mascota', Dueño.nombre AS 'Dueño'
FROM Dueño INNER JOIN Mascota
ON Dueño.dni = Mascota.duenio
INNER JOIN HC
ON Mascota.codigo = HC.codigo
INNER JOIN Veterinario
ON HC.matricula = Veterinario.matricula
WHERE Veterinario.direccion = Dueño.direccion;

/* B */
SELECT COUNT(HC.fecha) AS 'Cant_consultas'
FROM HC INNER JOIN Mascota
ON HC.codigo = Mascota.codigo
WHERE Mascota.nombre LIKE '%bobby%'
GROUP BY Mascota.nombre
HAVING COUNT(HC.fecha) < '2019-10-10';

/* C */
SELECT Dueño.nombre AS 'Dueño'
FROM Dueño INNER JOIN Mascota
ON Dueño.dni = Mascota.duenio
WHERE EXISTS (SELECT COUNT(HC.codigo)
			  FROM HC
              WHERE HC.codigo = Mascota.codigo
              GROUP BY HC.codigo
              HAVING COUNT(*) > 1)
GROUP BY Dueño.nombre
HAVING COUNT(*)>1;

/* D */


/* E */
SELECT COUNT(HC.codigo) AS 'Cant_Consultas', Mascota.nombre AS 'Mascota', Dueño.nombre AS 'Dueño'
FROM HC INNER JOIN Mascota
ON HC.codigo = Mascota.codigo
INNER JOIN Dueño
ON Mascota.duenio = Dueño.dni
GROUP BY Mascota.nombre, Dueño.nombre;

/* F */
SELECT Mascota.nombre AS 'Mascota'
FROM Mascota INNER JOIN HC
ON Mascota.codigo = HC.codigo
WHERE (HC.diagnostico LIKE 'Vacunado') AND (HC.diagnostico NOT LIKE 'Castrado');

/* G */
SELECT Veterinario.nombre AS 'Veterinario'
FROM Veterinario
WHERE NOT EXISTS (SELECT *
			  FROM Mascota
              WHERE NOT EXISTS (SELECT *
								FROM HC
								WHERE HC.matricula = Veterinario.matricula AND HC.codigo = Mascota.codigo));
                                
/* i */
SELECT COUNT(HC.fecha) AS 'Cant_consultas', matricula
FROM HC
GROUP BY HC.matricula
ORDER BY COUNT(HC.fecha) DESC;