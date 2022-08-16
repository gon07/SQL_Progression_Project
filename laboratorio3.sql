-- crear base de datos con el nombre LIBRERIA
CREATE DATABASE LIBRERÍA;

-- poner en uso la base de datos
USE LIBRERÍA;

-- crear tabla AUTORES
CREATE TABLE autores (
    autor_id VARCHAR(11),
    apellido VARCHAR(40),
    nombre VARCHAR(20),
    telefono VARCHAR(12),
    direccion VARCHAR(40),
    ciudad VARCHAR(20),
    provincia CHAR(2),
    c_postal CHAR(5),
    estado TINYINT(1)
);

-- crear tabla VENTAS
CREATE TABLE ventas(
	local_id char(4),
	factura_nro varchar(20),
	fecha datetime,
	cantidad smallint,
	forma_pago varchar(12),
	libro_id varchar(6)
);

-- crear tabla LOCALES
CREATE TABLE locales (
    local_id CHAR(4),
    nombre VARCHAR(40),
    direccion VARCHAR(40),
    ciudad VARCHAR(20),
    provincia CHAR(2),
    c_postal CHAR(5)
);

-- crear tabla EDITORIALES
CREATE TABLE editoriales (
    editorial_id CHAR(4),
    nombre VARCHAR(40),
    ciudad VARCHAR(20),
    provincia CHAR(2),
    pais VARCHAR(30)
);

-- crear tabla LIBROS
CREATE TABLE libros (
    libro_id VARCHAR(6),
    titulo VARCHAR(80),
    categoria CHAR(12),
    editorial_id CHAR(4),
    precio DOUBLE,
    comentarios VARCHAR(200),
    fecha_publicacion DATETIME
);

-- crear tabla LIBROAUTOR
CREATE TABLE libroautor (
    autor_id VARCHAR(11),
    libro_id VARCHAR(6)
);

-- crear tabla PUESTOS
CREATE TABLE puestos (
    puesto_id SMALLINT,
    descripcion VARCHAR(50)
);

-- crear tabla EMPLEADOS
CREATE TABLE empleados (
    empleado_id CHAR(9),
    nombre VARCHAR(20),
    apellido VARCHAR(30),
    puesto_id SMALLINT,
    editorial_id CHAR(4),
    fecha_ingreso DATETIME
);

-- insertar 23 registros a la tabla AUTORES
INSERT INTO autores VALUES 
('172-32-1176','Quiroga','Horacio','44967223','','Salto','ER','4025',1),
('213-46-8915','Bioy Casares','Adolfo','49867020','','Buenos Aires','CF','4618',1),
('238-95-7766','Vargas LLosa','Mario','45487723','','Lima','LI','4705',1),
('267-41-2394','Giardinelli','Mempo','42862428','','Resistencia','CH','5128',1),
('274-80-9391','Ocampo','Victoria','48342919','','Beccar','BA','4609',1),
('341-22-1782','Walsh','Rodolfo','98430462','','Choele Choel','R','6044',0),
('409-56-7008','Lugones','Leopoldo','46589932','','Río Seco','CO','4705',1),
('427-17-2319','Echeverría','Esteba','48367128','','','','',1),
('472-27-2349','Kafka','Frank','79386445','','Praga','AU','5428',1),
('486-29-1786','Sábato','Ernesto','45854620','','Rojas','BA','4130',1),
('527-72-3246','Borges','Jorge Luis','62972723','','Buenos Aires','CF','7215',0),
('648-92-1872','Martinez','Tomas Eloy','57456402','','San Miguel','TU','7330',1),
('672-71-3249','Arlt','Roberto','49354228','','Flores','CF','4595',1),
('712-45-1867','Dolina','Alejandro','69968275','','Morse','BA','8105',1),
('722-51-5454','Pigna','Felipe','25479982','','Mercedes','BA','6403',1),
('724-08-9931','Cortazar','Julio','48432991','','Ixelles','BE','4609',0),
('724-80-9391','Piglia','Ricardo','43547128','','Adrogué','BA','4612',1),
('756-30-7391','Saer','Juan José','45349219','','Serodino','SF','4609',1),
('807-91-6654','Ocampo','Silvina','39468853','','Microcentro','CF','8853',1),
('846-92-7186','Puig','Manuel','48367128','','General Villegas','BA','4301',1),
('893-72-1158','Hernández','José','74484982','','Chacras de Perdirel','BA','5688',0),
('899-46-2035','Di Benedetto','Antonio','88260752','','Bermejo','ME','4152',1),
('998-72-3567','Fogwill','Rodolfo','49810752','','Quilmes','BA','4152',1);

-- insertar 8 registros a la tabla EDITORIALES
INSERT INTO editoriales VALUES 
('0736','Losada','Buenos Aires','CF','Argentina'),
('0877','Ediciones de la Flor','Buenos Aires','CF','Argentina'),
('1389','Abeledo-Perrot','Buenos Aires','CF','Argentina'),
('1622','Amorrortu Editores','Buenos Aires','CF','Argentina'),
('1756','Editorial Atlántida','Buenos Aires','CF','Argentina'),
('9901','Centro Editor de América Latina','Buenos Aires','CF','Argentina'),
('9952','Editorial Columba','Buenos Aires','CF','Argentina'),
('9999','Editorial Emecé','Buenos Aires','CF','Argentina');

-- insertar 43 registros a la tabla EMPLEADOS
INSERT INTO empleados VALUES 
('PMA42628M','Paolo','Accorti',13,'0877','1992-08-27 00:00:00'),
('PSA89086M','Pedro','Afonso',14,'1389','1990-12-24 00:00:00'),
('VPA30890F','Victoria','Ashworth',6,'0877','1990-09-13 00:00:00'),
('H-B39728F','Hele','Bennett',12,'0877','1989-09-21 00:00:00'),
('L-B31947F','Lesley','Brow',7,'0877','1991-02-13 00:00:00'),
('F-C16315M','Francisco','Chang',4,'9952','1990-11-03 00:00:00'),
('PTC11962M','Philip','Cramer',2,'9952','1989-11-11 00:00:00'),
('A-C71970F','Aria','Cruz',10,'1389','1991-10-26 00:00:00'),
('AMD15433F','An','Devo',3,'9952','1991-07-16 00:00:00'),
('ARD36773F','Anabela','Domingues',8,'0877','1993-01-27 00:00:00'),
('PHF38899M','Peter','Franke',10,'0877','1992-05-17 00:00:00'),
('PXH22250M','Paul','Henriot',5,'0877','1993-08-19 00:00:00'),
('CFH28514M','Carlos','Hernandez',5,'9999','1989-04-21 00:00:00'),
('PDI47470M','Palle','Ibse',7,'0736','1993-05-09 00:00:00'),
('KJJ92907F','Karla','Jablonski',9,'9999','1994-03-11 00:00:00'),
('KFJ64308F','Kari','Josephs',14,'0736','1992-10-17 00:00:00'),
('MGK44605M','Matti','Karttune',6,'0736','1994-05-01 00:00:00'),
('POK93028M','Pirkko','Koskitalo',10,'9999','1993-11-29 00:00:00'),
('JYL26161F','Janine','Labrune',5,'9901','1991-05-26 00:00:00'),
('M-L67958F','Maria','Larsso',7,'1389','1992-03-27 00:00:00'),
('Y-L77953M','Yoshi','Latimer',12,'1389','1989-06-11 00:00:00'),
('LAL21447M','Laurence','Lebiha',5,'0736','1990-06-03 00:00:00'),
('ENL44273F','Elizabeth','Lincol',14,'0877','1990-07-24 00:00:00'),
('PCM98509F','Patricia','McKenna',11,'9999','1989-08-01 00:00:00'),
('R-M53550M','Roland','Mendel',11,'0736','1991-09-05 00:00:00'),
('RBM23061F','Rita','Muller',5,'1622','1993-10-09 00:00:00'),
('HAN90777M','Helvetius','Nagy',7,'9999','1993-03-19 00:00:00'),
('TPO55093M','Timothy','O\'Rourke',13,'0736','1988-06-19 00:00:00'),
('SKO22412M','Sve','Ottlieb',5,'1389','1991-04-05 00:00:00'),
('MAP77183M','Miguel','Paolino',11,'1389','1992-12-07 00:00:00'),
('PSP68661F','Paula','Parente',8,'1389','1994-01-19 00:00:00'),
('M-P91209M','Manuel','Pereira',8,'9999','1989-01-09 00:00:00'),
('MJP25939M','Maria','Pontes',5,'1756','1989-03-01 00:00:00'),
('M-R38834F','Martine','Rance',9,'0877','1992-02-05 00:00:00'),
('DWR65030M','Diego','Roel',6,'1389','1991-12-16 00:00:00'),
('A-R89858F','Annette','Roulet',6,'9999','1990-02-21 00:00:00'),
('MMS49649F','Mary','Saveley',8,'0736','1993-06-29 00:00:00'),
('CGS88322F','Carine','Schmitt',13,'1389','1992-07-07 00:00:00'),
('MAS70474F','Margaret','Smith',9,'1389','1988-09-29 00:00:00'),
('HAS54740M','Howard','Snyder',12,'0736','1988-11-19 00:00:00'),
('MFS52347M','Marti','Sommer',10,'0736','1990-04-13 00:00:00'),
('GHT50241M','Gary','Thomas',9,'0736','1988-08-09 00:00:00'),
('DBT39435M','Daniel','Tonini',11,'0877','1990-01-01 00:00:00');

-- insertar 25 registros a la tabla LIBROAUTOR
INSERT INTO libroautor VALUES 
('172-32-1176','PS3333'),
('213-46-8915','BU1032'),
('213-46-8915','BU2075'),
('238-95-7766','PC1035'),
('267-41-2394','BU1111'),
('267-41-2394','TC7777'),
('274-80-9391','BU7832'),
('409-56-7008','BU1033'),
('427-17-2319','PC8888'),
('472-27-2349','TC7778'),
('486-29-1786','PC9999'),
('486-29-1786','PS7777'),
('648-92-1872','TC4203'),
('672-71-3249','TC7779'),
('712-45-1867','MC2222'),
('722-51-5454','MC3021'),
('724-80-9391','BU1112'),
('724-80-9391','PS1372'),
('756-30-7391','PS1373'),
('807-91-6654','TC3218'),
('846-92-7186','PC8889'),
('899-46-2035','MC3022'),
('899-46-2035','PS2091'),
('998-72-3567','PS2092'),
('998-72-3567','PS2106');

-- insertar 26 registros a la tabla LIBROS
INSERT INTO libros VALUES 
('BU1032','La invención de Morel','Novelas','1389',19.99,'','1991-06-12 00:00:00'),
('BU1033','El Imperio jesuítico','Ensayos','0877',22.98,NULL,'1904-06-12 00:00:00'),
('BU1111','El castigo de Dios','Cuentos','1389',11.95,'','1991-06-09 00:00:00'),
('BU1112','Los casos del comisario Croce','Cuentos','0736',20,NULL,'2018-12-01 00:00:00'),
('BU2075','De las cosas maravillosas','Ensayos','0736',29.9,'','1991-06-30 00:00:00'),
('BU7832','La mujer y su expresió','Ensayos','1389',19.99,'','1991-06-22 00:00:00'),
('MC2222','Crónicas del angel gris','Relato','0877',19.99,'','1991-06-09 00:00:00'),
('MC3021','El mundo contemporáneo','Historia','0877',29.9,'','1991-06-18 00:00:00'),
('MC3022','El silenciero','Novelas','9901',32,NULL,'1964-03-10 00:00:00'),
('MC3026','The Psychology of Computer Cooking','Sin asignar','0877',NULL,'','2004-12-13 00:00:00'),
('PC1035','Pantaleón y las visitadoras','Novelas','1389',22.95,'','1991-06-30 00:00:00'),
('PC8888','El matadero','Cuentos','1389',20,'','1994-06-12 00:00:00'),
('PC8889','Sangre de amor correspondido','Novelas','1756',13,NULL,'1982-01-01 00:00:00'),
('PC9999','La robotización del hombre y otras páginas','Antologías','1389',NULL,'','2004-12-13 00:00:00'),
('PS1372','La ciudad ausente','Novelas','0877',21.59,'','1991-10-21 00:00:00'),
('PS1373','Nadie nada nunca','Novelas','1622',20,NULL,'1980-06-12 00:00:00'),
('PS2091','Caballo en el salitral','Antologías','0736',10.95,'','1991-06-15 00:00:00'),
('PS2092','Memoria romana','Cuentos','9952',13.5,NULL,'2018-05-29 00:00:00'),
('PS2106','Vivir afuera','Novelas','0736',70,'','1991-10-05 00:00:00'),
('PS3333','Cuentos de Amor, de Locura y Muerte','Cuentos','0736',19.99,'','1991-06-12 00:00:00'),
('PS7777','Sobre héroes y tumbas','Novelas','0736',79.9,'','1991-06-12 00:00:00'),
('TC3218','La promesa','Novelas','0877',20.95,'','1991-10-21 00:00:00'),
('TC4203','La pasión según Trelew','Crónicas','0877',11.95,'','1991-06-12 00:00:00'),
('TC7777','La revolución en bicicleta','Novelas','0877',14.99,'','1991-06-12 00:00:00'),
('TC7778','La metamorfosis','Novelas','9999',18,NULL,'1975-05-05 00:00:00'),
('TC7779','El juguete rabioso','Novelas','9999',22,NULL,'1964-01-15 00:00:00');

-- insertar 6 registros a la tabla LOCALES
INSERT INTO locales VALUES 
('6380','Yenny - El Ateneo','Petaonal San Martin 732','Paraná','ER','98056'),
('7066','Librería Hernández','Diagonal 104 1436','La Plata','BA','92789'),
('7067','Librería Santa Fe','Ovidio Lagos 3253','Rosario','SF','96745'),
('7131','Librería Cúspide','Av San Martin 931','Capital','ME','98014'),
('7896','SBS Librerías','Av Rivadavia 4791','Capital','CO','90019'),
('8042','Planeta de Libros','Av Independencia 1682','Buenos Aires','CF','89076');

-- insertar 14 registros a la tabla PUESTOS
INSERT INTO puestos VALUES 
(1,'Nuevo Ingreso - Puesto no definido'),
(2,'CEO'),
(3,'Director de Operaciones de Negocio'),
(4,'CFO'),
(5,'Editorialista'),
(6,'Director de Edición'),
(7,'Director de Marketing'),
(8,'Director de Relaciones Públicas'),
(9,'Director de Compras'),
(10,'Director de Producción'),
(11,'Director de Operaciones'),
(12,'Editor'),
(13,'Representante de Ventas'),
(14,'Diseñador');

-- insertar 21 registros a la tabla VENTAS
INSERT INTO ventas VALUES 
('6380','6871','1994-09-14 00:00:00',5,'Efectivo','BU1032'),
('6380','722','1994-09-13 00:00:00',3,'Efectivo','PS2091'),
('7066','2976','1993-05-24 00:00:00',50,'Cheque','PC8888'),
('7066','7442','1994-09-13 00:00:00',75,'Transf','PS2091'),
('7067','4482','1994-09-14 00:00:00',10,'Efectivo','PS2091'),
('7067','2121','1992-06-15 00:00:00',40,'Cheque','TC3218'),
('7067','2121','1992-06-15 00:00:00',20,'Cheque','TC4203'),
('7067','2121','1992-06-15 00:00:00',20,'Cheque','TC7777'),
('7131','914008','1994-09-14 00:00:00',20,'Cheque','PS2091'),
('7131','914014','1994-09-14 00:00:00',25,'Cheque','MC3021'),
('7131','3087','1993-05-29 00:00:00',20,'Efectivo','PS1372'),
('7131','3087','1993-05-29 00:00:00',25,'Efectivo','PS2106'),
('7131','3087','1993-05-29 00:00:00',15,'Efectivo','PS3333'),
('7131','3087','1993-05-29 00:00:00',25,'Efectivo','PS7777'),
('7896','2299','1993-10-28 00:00:00',15,'Efectivo','BU7832'),
('7896','456','1993-12-12 00:00:00',10,'Efectivo','MC2222'),
('7896','999','1993-02-21 00:00:00',35,'Transf','BU2075'),
('8042','423','1994-09-14 00:00:00',15,'Transf','MC3021'),
('8042','423','1994-09-14 00:00:00',10,'Transf','BU1032'),
('8042','723','1993-03-11 00:00:00',25,'Cheque','BU1111'),
('8042','8791','1993-05-22 00:00:00',30,'Cheque','PC1035');

-- definir claves primarias primary keys en cada tabla, cada tabla tiene un campo con el sufijo _id que identifica la clave
alter table autores add primary key(autor_id);
alter table puestos add primary key(puesto_id);
alter table empleados add primary key(empleado_id);
alter table libroautor add primary key(autor_id, libro_id);
alter table locales add primary key(local_id);
alter table editoriales add primary key(editorial_id);
alter table libros add primary key(libro_id);
alter table ventas add primary key(local_id, factura_nro, libro_id);

-- muestra todos los datos de los autores nacidos en la Ciudad de Buenos Aires.
SELECT 
    *
FROM
    AUTORES
WHERE
    CIUDAD = 'BUENOS AIRES';

-- muestra todos los datos de los libros con precio mayor a 30 dólares. Ordenar los precios de mayor a menor
SELECT 
    *
FROM
    LIBROS
WHERE
    PRECIO > 30
ORDER BY PRECIO DESC;

/*muestra todos los datos de los autores que no residen en la Provincia de Buenos Aires (BA). Ordenar de manera alfabética las provincias
 resultantes.*/
SELECT 
    *
FROM
    AUTORES
WHERE
    PROVINCIA <> 'BA'
ORDER BY PROVINCIA;

/* muestra todos los datos de los libros que forman parte de la categoría cuentos y cuyo precio sea inferior a 20 dólares. Ordenar los títulos 
resultantes de manera alfabética.  */
SELECT 
    *
FROM
    LIBROS
WHERE
    CATEGORIA = 'CUENTOS' AND PRECIO < 20
ORDER BY TITULO;

/* muestra todos los datos de los libros que forman parte de las categorías novelas o ensayos. Ordena alfabéticamente los títulos de los libros
 obtenidos */
SELECT 
    *
FROM
    LIBROS
WHERE
    CATEGORIA = 'NOVELAS'
        OR CATEGORIA = 'ENSAYOS'
ORDER BY TITULO;

-- muestra todos los datos de los libros cuyo precio oscile entre 20 y 35 dólares inclusive. Ordenaa los precios resultantes de menor a mayor. 
SELECT 
    *
FROM
    LIBROS
WHERE
    PRECIO BETWEEN 20 AND 35
ORDER BY PRECIO;

-- muestra todos los datos de los autores cuyo nombre sea Jorge Luis, Victoria, Ernesto o Adolfo. Ordenaa los resultados en orden alfabético. 
SELECT 
    *
FROM
    AUTORES
WHERE
    NOMBRE IN ('JORGE LUIS' , 'VICTORIA', 'ERNESTO', 'ADOLFO')
ORDER BY NOMBRE;

-- muestra todos los datos de los libros cuyo título contenga la palabra mundo. Ordena los títulos alfabéticamente. 
SELECT 
    *
FROM
    LIBROS
WHERE
    TITULO LIKE '%MUNDO%'
ORDER BY TITULO;

-- muestra todos los datos de los libros cuyo título contenga la preposición “de”. Ordenaa los títulos alfabéticamente. 
SELECT 
    *
FROM
    LIBROS
WHERE
    TITULO LIKE '% DE %'
ORDER BY TITULO;

-- muestra todos los datos de los libros que no tengan cargado su precio. Luego, ordena alfabéticamente los resultados. 
SELECT 
    *
FROM
    LIBROS
WHERE
    PRECIO IS NULL
ORDER BY TITULO;

/*De la base de datos LIBRERIA, genera una lista en la que se muestren todos los autores y la provincia en la que nacieron. El apellido y el nombre de cada
 autor se muestran en una columna con el nombre AUTOR, separados con una coma y un espacio. Utiliza la función CONCAT  Ordenar alfabéticamente los apellidos
 resultantes*/
SELECT 
    CONCAT(APELLIDO, ', ', NOMBRE) AUTOR, PROVINCIA
FROM
    AUTORES
ORDER BY AUTOR;

/*Modifica la consulta anterior para obtener el mismo resultado con la función CONCAT_WS.*/
SELECT 
    CONCAT_WS(', ', APELLIDO, NOMBRE) AUTOR, PROVINCIA
FROM
    AUTORES
ORDER BY AUTOR;

/*Modifica la consulta anterior para mostrar los nombres de los autores en mayúsculas.*/
SELECT 
    UPPER(CONCAT_WS(', ', APELLIDO, NOMBRE)) AUTOR, PROVINCIA
FROM
    AUTORES
ORDER BY AUTOR;

/*Modifica la consulta anterior para mostrar únicamente la inicial del nombre del autor y su apellido*/
SELECT 
    UPPER(CONCAT(APELLIDO, ', ', LEFT(NOMBRE, 1), '.')) AUTOR,
    PROVINCIA
FROM
    AUTORES
ORDER BY AUTOR;

/*Genera una columna con el nombre INGRESO en la que se muestran todos los empleados y el año en el que ingresaron a trabajar a la empresa. El apellido y el
nombre de cada empleado se muestran separados con una coma y un espacio en una columna con el nombre EMPLEADO. Utiliza la función CONCAT y ordenado el 
resultado de la consulta de mayor a menor según los años de ingreso de cada empleado.*/
SELECT 
    CONCAT(APELLIDO, ', ', NOMBRE) EMPLEADO,
    YEAR(FECHA_INGRESO) AS INGRESO
FROM
    EMPLEADOS
ORDER BY INGRESO DESC;

/*Modifica la consulta anterior para agregar una columna con el nombre ANTIGÜEDAD. Esta calcula la cantidad de años de antigüedad de cada empleado dentro de
 la empresa al día de hoy*/
SELECT 
    CONCAT(APELLIDO, ', ', NOMBRE) EMPLEADO,
    YEAR(FECHA_INGRESO) AS INGRESO,
    TIMESTAMPDIFF(YEAR,
        FECHA_INGRESO,
        CURDATE()) AS ANTIGÜEDAD
FROM
    EMPLEADOS
ORDER BY INGRESO DESC;

-- Genera una consulta para obtener el precio más bajo de la tabla LIBROS. El resultado se muestra en una columna con el nombre MENOR PRECIO.
SELECT 
    MIN(PRECIO) 'MENOR PRECIO'
FROM
    LIBROS;

/* modifica la consulta anterior para agregar una columna que calcule el precio más alto de la tabla LIBROS. Muestra el resultado en una columna con el
nombre MAYOR PRECIO.*/
SELECT 
    MIN(PRECIO) 'MENOR PRECIO', MAX(PRECIO) 'MAYOR PRECIO'
FROM
    LIBROS;

/*Modifica la consulta anterior para agregar una columna que calcule el precio promedio de todos los libros. Muestra el resultado en una columna con el
nombre PRECIO PROMEDIO. El promedio resultante se muestra con 2 decimales como máximo.*/
SELECT 
    MIN(PRECIO) 'MENOR PRECIO',
    MAX(PRECIO) 'MAYOR PRECIO',
    ROUND(AVG(PRECIO), 2) AS 'PRECIO PROMEDIO'
FROM
    LIBROS;

-- Genera una consulta que permite obtener el precio más bajo, el más alto y el promedio de los libros pertenecientes a cada categoría.
SELECT 
    CATEGORIA,
    MIN(PRECIO) 'MENOR PRECIO',
    MAX(PRECIO) 'MAYOR PRECIO',
    ROUND(AVG(PRECIO), 2) AS 'PRECIO PROMEDIO'
FROM
    LIBROS
GROUP BY CATEGORIA;

-- Modifica la consulta anterior para no mostrar la categoría “SIN ASIGNAR”.
SELECT 
    CATEGORIA,
    MIN(PRECIO) 'MENOR PRECIO',
    MAX(PRECIO) 'MAYOR PRECIO',
    ROUND(AVG(PRECIO), 2) AS 'PRECIO PROMEDIO'
FROM
    LIBROS
GROUP BY CATEGORIA
HAVING CATEGORIA <> 'SIN ASIGNAR';

/*Genera una consulta de actualización en la que se modifique el nombre del autor de apellido ECHEVERRÍA por Esteban. Se modificará el nombre de este autor 
y no su apellido*/
SET SQL_SAFE_UPDATES = 0;
UPDATE AUTORES 
SET 
    NOMBRE = 'Esteban'
WHERE
    APELLIDO = 'ECHEVERRÍA';

/*Agrega a la tabla EMPLEADOS una columna llamada PERMANENCIA. Completa la columna con la antigüedad (expresada en años) de cada empleado, tomando como base
 la fecha de ingreso de cada uno de ellos. */
ALTER TABLE EMPLEADOS ADD PERMANENCIA INT;
UPDATE EMPLEADOS 
SET 
    PERMANENCIA = TIMESTAMPDIFF(YEAR,
        FECHA_INGRESO,
        CURDATE());

/*Agrega a la tabla LIBROS una columna llamada PRECIO_PÚBLICO. A continuación, completar la columna con el precio de venta al público de cada libro 
agregándole un 21% en concepto de IVA a los precios originales. Mantiene un máximo de 2 decimales*/
ALTER TABLE LIBROS ADD PRECIO_PUBLICO FLOAT;
UPDATE LIBROS 
SET 
    PRECIO_PUBLICO = ROUND(PRECIO * 1.21, 2);

/*Genera una tabla nueva con el nombre EMPLEADOS_ANTERIORES, a partir de la tabla EMPLEADOS, tomando todos los campos de la tabla original. Luego, vuelca en
la tabla nueva los empleados cuyos apellidos sean THOMAS, PEREIRA y DEVO. Una vez copiados estos 3 empleados en la tabla nueva, elimina de la tabla
 original (EMPLEADOS):*/
CREATE TABLE EMPLEADOS_ANTERIORES SELECT * FROM
    EMPLEADOS
WHERE
    APELLIDO IN ('THOMAS' , 'PEREIRA', 'DEVO');
DELETE FROM EMPLEADOS 
WHERE
    APELLIDO IN ('THOMAS' , 'PEREIRA', 'DEVO');

-- Copia a la tabla EMPLEADOS_ANTERIORES al empleado de apellido CRUZ desde la tabla EMPLEADOS. Una vez copiado a la tabla nueva, elimina de la original.
INSERT INTO EMPLEADOS_ANTERIORES (EMPLEADO_ID, NOMBRE, APELLIDO,
PUESTO_ID, EDITORIAL_ID, FECHA_INGRESO, PERMANENCIA)
SELECT EMPLEADO_ID, NOMBRE, APELLIDO, PUESTO_ID, EDITORIAL_ID,
FECHA_INGRESO, PERMANENCIA
FROM EMPLEADOS
WHERE APELLIDO = 'CRUZ';
DELETE FROM EMPLEADOS 
WHERE
    APELLIDO = 'CRUZ';

/*Utilizando la tabla LIBROS, obtiene una lista de todos aquellos productos cuyo precio supere al precio promedio de todos los libros. La lista 
contiene todos los campos de la tabla. Ordena el resultado alfabéticamente por los títulos de los libros. */
SELECT 
    *
FROM
    LIBROS
WHERE
    PRECIO > (SELECT 
            AVG(PRECIO)
        FROM
            LIBROS)
ORDER BY TITULO;

/*Dada la tabla LIBROS, extrae una lista de todos los libros pertenecientes a la categoría NOVELAS cuyo precio sea superior al libro más caro de la 
categoría ENSAYOS. La lista contiene todos los campos de la tabla. Muestra el resultado de la consulta ordenado de mayor a menor por los precios de los
 libros.*/
SELECT 
    *
FROM
    LIBROS
WHERE
    CATEGORIA = 'NOVELAS'
        AND PRECIO > (SELECT 
            MAX(PRECIO)
        FROM
            LIBROS
        WHERE
            CATEGORIA = 'ENSAYOS')
ORDER BY PRECIO DESC;

-- Utilizando la tabla EMPLEADOS, obtiene una lista de todos aquellos empleados con mayor permanencia dentro de la empresa.
SELECT 
    *
FROM
    EMPLEADOS
WHERE
    PERMANENCIA = (SELECT 
            MAX(PERMANENCIA)
        FROM
            EMPLEADOS);

/*A partir de la tabla EMPLEADOS, extraer una lista de todos aquellos empleados con el puesto más alto.*/
SELECT 
    *
FROM
    EMPLEADOS
WHERE
    PUESTO_ID = (SELECT 
            MAX(PUESTO_ID)
        FROM
            EMPLEADOS);

/*Utilizando la tabla LIBROS, genera una consulta que muestra los campos LIBRO_ID, TÍTULO, CATEGORÍA y PRECIO_PÚBLICO. Agrega una columna con el nombre TIPO
en la que se muestren los valores solicitados. Ordena alfabéticamente el resultado, por el título de los libros. No muestra en el resultado de la consulta
 aquellos libros que no tienen precio (falta de stock).*/
SELECT 
    LIBRO_ID,
    TITULO,
    CATEGORIA,
    PRECIO_PUBLICO,
    CASE
        WHEN PRECIO_PUBLICO < 15 THEN 'ECONOMICO'
        WHEN PRECIO_PUBLICO <= 30 THEN 'REGULAR'
        ELSE 'DELUXE'
    END AS TIPO
FROM
    LIBROS
WHERE
    PRECIO_PUBLICO IS NOT NULL
ORDER BY TITULO;

/*Obtiene una lista de todos los empleados que ocupen o hayan ocupado el puesto 9. La lista muestra los empleados que actualmente estén trabajando en la
 empresa y los que se hayan desvinculado; por lo tanto, la consulta se lleva a cabo en las tablas EMPLEADOS y EMPLEADOS ANTERIORES.
En el resultado de la consulta, sólo muestra una columna (con el nombre EMPLEADO) en la que figuren el nombre y el apellido de los empleados, separando
ambos datos por una coma y un espacio (por ejemplo, GARCIA, MONICA). Por último, ordena el resultado alfabéticamente.*/
SELECT 
    CONCAT(APELLIDO, ', ', NOMBRE) EMPLEADO
FROM
    EMPLEADOS
WHERE
    PUESTO_ID = 9 
UNION SELECT 
    CONCAT(APELLIDO, ', ', NOMBRE)
FROM
    EMPLEADOS_ANTERIORES
WHERE
    PUESTO_ID = 9
ORDER BY EMPLEADO;

/*Genera una consulta que muestre las siguientes columnas: LIBRO_ID, TÍTULO, PRECIO_PÚBLICO, LOCAL_ID, FACTURA_NRO y CANTIDAD. Estos campos se hallan
 en las tablas LIBROS y VENTAS. Ordena alfabéticamente el resultado, por los títulos de los libros.*/
SELECT 
    V.LIBRO_ID,
    TITULO,
    PRECIO_PUBLICO,
    LOCAL_ID,
    FACTURA_NRO,
    CANTIDAD
FROM
    LIBROS L,
    VENTAS V
WHERE
    L.LIBRO_ID = V.LIBRO_ID
ORDER BY L.TITULO;

/*Modifica la consulta anterior para agregar una columna con el nombre TOTAL en la que se multipliquen los valores de las columnas PRECIO_PÚBLICO y
CANTIDAD. Esta nueva columna muestra como máximo sólo 2 decimales*/
SELECT 
    V.LIBRO_ID,
    TITULO,
    PRECIO_PUBLICO,
    LOCAL_ID,
    FACTURA_NRO,
    CANTIDAD,
    ROUND(PRECIO_PUBLICO * CANTIDAD, 2) AS TOTAL
FROM
    LIBROS L,
    VENTAS V
WHERE
    L.LIBRO_ID = V.LIBRO_ID
ORDER BY L.TITULO;

/*Crea una consulta en la que se muestren sólo los títulos de aquellos libros que nunca hayan sido vendidos. Ordena el resultado alfabéticamente.*/
SELECT 
    L.TITULO
FROM
    LIBROS L
        LEFT JOIN
    VENTAS V ON L.LIBRO_ID = V.LIBRO_ID
WHERE
    FACTURA_NRO IS NULL
ORDER BY TITULO;

