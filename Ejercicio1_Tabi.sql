create database ejercicio1_Tabi;
use ejercicio1_Tabi;

create table Almacen(
nro integer ,
nombre varchar(50),
responsable varchar(50) ,
primary key(nro)
);

create table Articulo(
	cod_art integer,
    descripcion varchar(100),
    precio double,
    
    primary key(cod_art)
);

create table Material(
cod_mat integer,
descripcion varchar(100),
primary key(cod_mat)
);

create table Ciudad(
cod_ciu integer ,
nombre varchar(50),
primary key(cod_ciu));

create table Proveedor(
cod_prov integer,
nombre varchar(100),
domicilio varchar(50),
cod_ciu integer,
fecha_alta date,
primary key (cod_prov),
foreign key(cod_ciu) references Ciudad(cod_ciu));

create table Contiene(
nro integer,
cod_art integer,
primary key(nro , cod_art),
foreign key(nro) references Almacen(nro),
foreign key(cod_art) references Articulo(cod_art));

create table Compuesto_por(
cod_art integer,
cod_mat integer,
primary key(cod_art , cod_mat),
foreign key (cod_art) references Articulo(cod_art),
foreign key(cod_mat) references Material(cod_mat));

create table Provisto_por(
cod_mat integer,
cod_prov integer,
primary key(cod_mat , cod_prov),
foreign key (cod_mat) references Material(cod_mat),
foreign key(cod_prov) references Proveedor(cod_prov));

insert into Almacen(nro,nombre,responsable)
values
(1,'Brie' , 'Julieta'),
(2,'Julieta' , 'Macarena'),
(3,'Macarena' , 'Leandro'),
(4,'Leandro' , 'Chris'),
(5,'Chris' , 'Pablo'),
(6,'Pablo' , 'Emma'),
(7,'Emma' , 'Emanuel'),
(8,'Emanuel' , 'Rober'),
(9,'Robert' , 'Miley'),
(10,'Miley' , 'Selena'),
(11,'Selena' , 'Taylor'),
(12,'Taylor' , 'Demi'),
(13,'Demi' , 'Joe'),
(14,'Joe' , 'Nick'),
(15,'Nick' , 'Kevin'),
(16,'Kevin' , 'Brenda'),
(17,'Brenda' , 'Jennifer'),
(18,'Jennifer' , 'Ezequiel'),
(19,'Ezequiel' , 'Carol'),
(20,'Carol' , 'Brie');

insert into Articulo(cod_art , descripcion , precio)
values
(1,'A' , 2500.0),
(2,'B' , 6000.0),
(3,'C' , 300.0),
(4,'B' , 100.0),
(5,'A' , 150.0),
(6,'B' , 10000.0),
(7,'C' , 9750.0),
(8,'B' , 520.75),
(9,'A' , 78.90),
(10,'C' , 2500.0),
(11,'A' , 1500.0),
(12,'A' , 18600.0),
(13,'B' , 3000.0),
(14,'B' , 2110.0),
(15,'C' , 2412.0),
(16,'C' , 1510.0),
(17,'A' , 110.0),
(18,'B' , 890.75),
(19,'C' , 10500.99),
(20,'A' , 50000.0);

insert into Material(cod_mat , descripcion)
values
(123 , 'A'),
(345 , 'B'),
(567 , 'C'),
(890 , 'C'),
(456 , 'B'),
(789 , 'A'),
(901 , 'B'),
(234 , 'C'),
(587 , 'A'),
(898 , 'B'),
(310 , 'C'),
(150 , 'B'),
(111 , 'C'),
(222 , 'A'),
(333 , 'A'),
(444 , 'B'),
(555 , 'C'),
(666 , 'C'),
(777 , 'B'),
(888, 'A');

insert into Ciudad(cod_ciu , nombre)
values
 ( 1, 'La Plata'),
 (2 , 'Zarate'),
 (3, 'Rosario'),
 (4, 'Casanova'),
 (5, 'Luzuriaga'),
 (6, 'Cordoba'),
 (7, 'Buenos Aires'),
 (8, 'Rosario'),
 (9, 'New York'),
 (10, 'Seattle'),
 (11, 'Tokio'),
 (12, 'Los Angeles'),
 (13, 'Osaka'),
 (14, 'Londres'),
 (15, 'Seul'),
 (16, 'Paris'),
 (17, 'La Plata'),
 (18, 'Dallas'),
 (19, 'San Pablo'),
 (20, 'Kentucky');
 
 insert into Proveedor (cod_prov, nombre, domicilio, cod_ciu, fecha_alta)
 values
 (1, 'Rocio', 'calle 1', 1, '1996-10-21'),
 (2, 'Tabatha', 'calle 2', 2, '1996-10-03'),
 (3, 'Melina', 'calle 3', 3, '2015-12-15'),
 (4, 'Nicolas', 'calle 4', 4, '2018-04-05'),
 (5, 'Alex', 'calle 5', 5, '2019-10-15'),
 (6, 'Cristina', 'calle 6', 6 ,'2003-05-10'),
 (7, 'Carlos', 'calle7', 7, '2008-12-11'),
 (8, 'Juan Cruz', 'calle 8', 8, '2010-07-19'),
 (9, 'Tom', 'calle 9', 9, '2005-01-09'),
 (10, 'Luz', 'calle 10', 10, '1998-05-20'),
 (11, 'Iván', 'calle 11', 11, '1995-12-24'),
 (12, 'Zoe', 'calle 12', 12, '2016-08-31'),
 (13, 'Wilson', 'calle 13', 13, '2015-07-06'),
 (14, 'Sasha', 'calle 14', 14, '2007-04-15'),
 (15, 'Saya', 'calle 15', 15, '2019-08-17'),
 (16, 'Felix', 'calle 16', 16, '2018-09-10'),
 (17, 'Kitty', 'calle 17', 17, '2005-10-01'),
 (18, 'Pepito', 'calle 18', 18, '2005-04-22'),
 (19, 'Pepe', 'calle 19', 19, '2013-03-02'),
 (20, 'Lucia', 'calle 20', 20, '2004-05-06');
 
 insert into Proveedor (cod_prov, nombre, domicilio, cod_ciu, fecha_alta)
 values
 (21, 'Karen', 'calle 21', 20, '2004-05-10');

 insert into Contiene(nro, cod_art)
 values
 (1,11),
 (2,12),
 (3,1),
 (4,1),
 (4,5),
 (4,2),
 (5,3),
 (6,4),
 (7,5),
 (8,6),
 (9,7),
 (10,8),
 (11,9),
 (12,10),
 (13,16),
 (14,20),
 (15,14),
 (16,17),
 (17,13),
 (18,19),
 (19,18),
 (20,15);
 
 insert into Compuesto_por(cod_art, cod_mat)
 values
 (1,123),
 (1,345),
 (1,567),
 (1,890),
 (1,456),
 (1,789),
 (1,901),
 (1,234),
 (1,587),
 (1,898),
 (1,310),
 (1,150),
 (1,111),
 (1,222),
 (1,333),
 (1,444),
 (1,555),
 (1,666),
 (1,777),
 (1,888),
 (2,345),
 (3,567),
 (4,789),
 (5,890),
 (6,901),
 (7,234),
 (8,222),
 (9,333),
 (10,111),
 (11,888),
 (12,587),
 (13,898),
 (14,310),
 (15,150),
 (16,777),
 (17,666),
 (18,444),
 (19,456),
 (20,555);

 insert into Provisto_por(cod_mat, cod_prov)
 values
 (345,1),
 (567,1),
 (789,1),
 (890,1),
 (901,1),
 (234,1),
 (222,1),
 (333,1),
 (111,1),
 (888,1),
 (587,1),
 (898,1),
 (310,1),
 (150,1),
 (777,1),
 (666,1),
 (444,1),
 (555,1),
 (456,1),
 (123,1),
 (345,2),
 (567,3),
 (789,4),
 (890,5),
 (901,6),
 (234,7),
 (222,8),
 (333,9),
 (111,10),
 (888,11),
 (587,12),
 (898,13),
 (310,14),
 (150,15),
 (777,16),
 (666,17),
 (444,18),
 (555,19),
 (456,20);
 
 /****CONSULTAS****/
 
 /* PUNTO 1 */
 SELECT cod_art
 FROM Articulo
 WHERE (precio BETWEEN 100 AND 1000) AND (UPPER(descripcion) LIKE 'A%');
 
 /* PUNTO 2 */
 SELECT *
 FROM Proveedor;
 
 /* PUNTO 3 */
 SELECT descripcion as 'Descripcion'
 FROM Material
 WHERE cod_mat IN (1,3,6,9,18);
 /*NO DEVUELVE NADA PORQUE NO HAY DATOS CARGADOS CON ESOS CODIGOS*/
 
 /* PUNTO 4 */
 SELECT cod_prov as 'Codigo Proveedor',nombre as 'Nombre'
 FROM Proveedor
 WHERE (domicilio LIKE 'calle 3') AND (fecha_alta between '2001-01-01' and '2019-12-31');
 
 /* PUNTO 5 */
 SELECT Proveedor.nombre AS 'Proveedor', Ciudad.nombre AS 'Ciudad'
 FROM Proveedor INNER JOIN Ciudad
 ON Proveedor.cod_prov = Ciudad.cod_ciu;
 
 /* PUNTO 6 */
 SELECT Proveedor.nombre AS 'Proveedor', Ciudad.nombre AS 'Ciudad'
 FROM Proveedor INNER JOIN Ciudad
 ON Proveedor.cod_ciu = Ciudad.cod_ciu
 WHERE Ciudad.nombre LIKE 'La Plata';
 
 /* PUNTO 7 */
 SELECT Almacen.nro as 'Numero de Almacen'
 FROM Almacen INNER JOIN Contiene
 ON Almacen.nro = Contiene.nro
 INNER JOIN Articulo
 ON Contiene.cod_art = Articulo.cod_art
 WHERE descripcion LIKE 'A';
 
 /* PUNTO 8 */
 SELECT Material.cod_mat AS 'Código Material', Material.descripcion AS 'Descripcion'
 FROM Material INNER JOIN Provisto_por
 ON Material.cod_mat = Provisto_por.cod_mat
 INNER JOIN Proveedor
 ON Provisto_por.cod_prov = Proveedor.cod_prov
 INNER JOIN Ciudad
 ON Proveedor.cod_ciu = Ciudad.cod_ciu
 WHERE UPPER(Ciudad.nombre) LIKE 'Rosario';
 
 /* PUNTO 9: SALTEANDO LA LINEA DE 'Articulo'*/
 SELECT Proveedor.nombre AS 'Nombre del Proveedor'
 FROM Proveedor INNER JOIN Provisto_por
 ON Proveedor.cod_prov = Provisto_por.cod_prov
 INNER JOIN Material
 ON Provisto_por.cod_mat = Material.cod_mat
 INNER JOIN Compuesto_por
 ON Material.cod_mat = Compuesto_por.cod_mat
 INNER JOIN Contiene
 ON Compuesto_por.cod_art = Contiene.cod_art
 INNER JOIN Almacen
 ON Contiene.nro = Almacen.nro
 WHERE UPPER(Almacen.responsable) LIKE 'Jennifer';
 
  /* PUNTO 9: CON LA LINEA DE 'Articulo'*/
 SELECT Proveedor.nombre AS 'Nombre del Proveedor'
 FROM Proveedor INNER JOIN Provisto_por
 ON Proveedor.cod_prov = Provisto_por.cod_prov
 INNER JOIN Material
 ON Provisto_por.cod_mat = Material.cod_mat
 INNER JOIN Compuesto_por
 ON Material.cod_mat = Compuesto_por.cod_mat
 INNER JOIN Articulo
 ON Compuesto_por.cod_art = Articulo.cod_art
 INNER JOIN Contiene
 ON Articulo.cod_art = Contiene.cod_art
 INNER JOIN Almacen
 ON Contiene.nro = Almacen.nro
 WHERE UPPER(Almacen.responsable) LIKE 'Jennifer';
 
  /* PUNTO 9: SALTEANDO LA LINEA DE 'Articulo' y Material*/
 SELECT Proveedor.nombre AS 'Nombre del Proveedor'
 FROM Proveedor INNER JOIN Provisto_por
 ON Proveedor.cod_prov = Provisto_por.cod_prov
 INNER JOIN Compuesto_por
 ON Provisto_por.cod_mat = Compuesto_por.cod_mat
 INNER JOIN Contiene
 ON Compuesto_por.cod_art = Contiene.cod_art
 INNER JOIN Almacen
 ON Contiene.nro = Almacen.nro
 WHERE UPPER(Almacen.responsable) LIKE 'Jennifer';
 
 /* EJERCICIO ADICIONAL DEL PROFE */
 SELECT Almacen.nombre AS 'Almacen Nombre', Articulo.cod_art AS 'Código del Articulo'
 FROM Almacen INNER JOIN Contiene
 ON Almacen.nro = Contiene.nro
 INNER JOIN Articulo
 ON Contiene.cod_art = Articulo.cod_art;
 
 /* PUNTO 10*/
 UPDATE Contiene
 SET cod_art = 8
 WHERE nro = 20;
 
 /*Verificacion del 10 */
 SELECT *
 FROM Contiene;
 
 /* PUNTO 11 */
 DELETE FROM Proveedor
 WHERE Proveedor.nombre like '%ABC%';
 
 /* PUNTO 12 */
 SELECT COUNT(*)
 FROM Proveedor
 WHERE nombre LIKE 'F%';
 
 /* PUNTO 13 */
 SELECT nombre as 'Nombre Almacen',AVG(precio)
 FROM Almacen INNER JOIN Contiene
 ON Almacen.nro=Contiene.nro
 INNER JOIN Articulo
 ON Contiene.cod_art=Articulo.cod_art
 GROUP BY Contiene.nro;
 
 SELECT AVG(Articulo.precio) AS 'Promedio', Almacen.nro AS 'Almacen'
 FROM Articulo INNER JOIN Contiene
 ON Articulo.cod_art = Contiene.cod_art
 INNER JOIN Almacen
 ON Contiene.nro = Almacen.nro
 GROUP BY Almacen.nro;
 
/* PUNTO 14 */

/*PUNTO 15 */
SELECT COUNT(cod_mat) AS 'Cantidad de materiales', Proveedor.cod_prov AS 'Código de proveedor', nombre AS 'Nombre del proveedor', domicilio AS 'Domicilio del proveedor'
FROM Proveedor INNER JOIN Provisto_por
ON Proveedor.cod_prov = Provisto_por.cod_prov
GROUP BY Provisto_por.cod_prov;

/* PUNTO 16 */
SELECT MAX(precio) AS 'Precio máximo', Proveedor.nombre AS 'Nombre del proveedor'
FROM Articulo INNER JOIN Compuesto_por
ON Articulo.cod_art = Compuesto_por.cod_art
INNER JOIN Provisto_por
ON Compuesto_por.cod_mat = Provisto_por.cod_mat
INNER JOIN Proveedor
ON Provisto_por.cod_prov = Proveedor.cod_prov
INNER JOIN Ciudad
ON Proveedor.cod_ciu = Ciudad.cod_ciu
WHERE Ciudad.nombre LIKE 'Zarate';

/* PUNTO 17 */
SELECT Proveedor.nombre AS 'Proveedor'
FROM Proveedor 
WHERE NOT EXISTS (SELECT Provisto_por.cod_mat
				  FROM Provisto_por INNER JOIN Material
                  ON Provisto_por.cod_mat = Material.cod_mat
                  WHERE Proveedor.cod_prov = Provisto_por.cod_prov);

SELECT nombre
FROM Proveedor
WHERE NOT EXISTS (SELECT *
					FROM Provisto_por INNER JOIN Material
                    ON Provisto_por.cod_mat = Material.cod_mat
                    WHERE Proveedor.cod_prov = Provisto_por.cod_prov);
                  
/* PUNTO 18 */
SELECT Material.cod_mat
FROM Material
WHERE EXISTS (SELECT Proveedor.cod_prov
               FROM Proveedor INNER JOIN
               Provisto_por
               ON Provisto_por.cod_prov = Proveedor.cod_prov
               WHERE (Material.cod_mat=Provisto_por.cod_mat)
               AND ((Proveedor.cod_prov = 10) AND Proveedor.cod_prov != 15));

/* PUNTO 19 */
SELECT Almacen.nro AS 'numero del almacen', Almacen.nombre AS 'nombre del almacen'
FROM Almacen 
WHERE EXISTS ( SELECT *
               FROM Contiene INNER JOIN Articulo
                ON Contiene.cod_art = Articulo.cod_art
                WHERE (Contiene.nro = Almacen.nro ) AND 
                Articulo.descripcion IN ('A', 'B'));
              
/* PUNTO 20* */
SELECT Articulo.descripcion AS 'Descripcion'
FROM Articulo
WHERE NOT EXISTS (SELECT *
				  FROM Material 
				  WHERE NOT EXISTS (SELECT *
									FROM Compuesto_por 
									WHERE Material.cod_mat = Compuesto_por.cod_mat AND Compuesto_por.cod_art = Articulo.cod_art));

/*PUNTO 21*/
SELECT Proveedor.cod_prov AS 'Codigo de proveedor', Proveedor.nombre AS 'Nombre del proveedor'
FROM Proveedor INNER JOIN Provisto_por
ON Proveedor.cod_prov = Provisto_por.cod_prov
INNER JOIN Compuesto_por
ON Provisto_por.cod_mat = Compuesto_por.cod_mat
INNER JOIN Articulo
ON Compuesto_por.cod_art = Articulo.cod_art
WHERE Articulo.precio > 100.0;

/* EJEMPLO PUNTO 20 & 25 */
/* 
SELECT *
FROM Articulo AS 'AA'
WHERE NOT EXISTS 
				(SELECT *
                FROM Color AS 'C'
                WHERE NOT EXISTS 
								(SELECT *
                                FROM Articulo AS 'A'
                                WHERE A.descripcion = AA.descripcion AND C.color = A.color));
*/

/* PUNTO 22 */
SELECT MAX(precio), descripcion
FROM Articulo;

/* PUNTO 23 */                   
SELECT Proveedor.nombre
FROM Proveedor INNER JOIN Ciudad 
ON Proveedor.cod_ciu = Ciudad.cod_ciu
INNER JOIN Provisto_por
ON Proveedor.cod_prov=Provisto_por.cod_prov
WHERE Ciudad.nombre='La Plata' AND Provisto_por.cod_mat IN (SELECT Provisto_por.cod_mat 
															  FROM Provisto_por 			
															  GROUP BY Provisto_por.cod_mat
															  HAVING COUNT(*)=1);

/* PUNTO 24 */
/*SELECT Almacen.nombre
FROM Almacen
WHERE EXISTS (SELECT COUNT(cod_art) AS 'contador'
			  FROM Contiene
              WHERE (Almacen.nro = Contiene.nro) AND ( contador > 1)); */
              
SELECT Almacen.nombre
FROM Almacen
INNER JOIN Contiene
ON Almacen.nro=Contiene.nro
GROUP BY Almacen.nro, Almacen.nombre
HAVING COUNT(*) = (SELECT MAX(nroAlm.cantArt)
				   FROM (SELECT COUNT(*) AS cantArt
				   FROM contiene AS CO2
				   GROUP BY CO2.nro) AS nroAlm);        
              
/* PUNTO 25 */
SELECT Ciudad.nombre AS 'Nombre de la Ciudad'
FROM Ciudad INNER JOIN Proveedor
On Ciudad.cod_ciu = Proveedor.cod_ciu
WHERE NOT EXISTS (SELECT *
                  FROM Material
	          WHERE NOT EXISTS (SELECT *
		  FROM Provisto_por
		  WHERE Proveedor.cod_prov = Provisto_por.cod_prov 
                  AND Material.cod_mat = Provisto_por.cod_mat));
                                    
/* PUNTO 26 */
SELECT Almacen.nro
FROM Almacen
WHERE NOT EXISTS (SELECT *
		  FROM Articulo INNER JOIN Compuesto_por
	          ON Articulo.cod_art = Compuesto_por.cod_art
		  WHERE Compuesto_por.cod_mat LIKE '123' AND NOT EXISTS (SELECT *
									 FROM Contiene
									 WHERE Contiene.nro = Almacen.nro AND Contiene.cod_art = Articulo.cod_art));
              


/****************************************************************************************************************************************
****************************************************************************************************************************************/

/*nombre del almacen y  (descripcion) articulo de los almacenes que tengan precio mayor a 10*/
create view vista1
as (select Almacen.nombre , Articulo.descripcion, Articulo.precio
	From Almacen inner join Contiene
    on almacen.nro = Contiene.nro
    INNER JOIN Articulo
    ON Contiene.cod_art = Articulo.cod_art
    WHERE Articulo.precio > 10.0);
    
select *
from vista1;
