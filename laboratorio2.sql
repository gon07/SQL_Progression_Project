-- crear base de datos con el nombre BONUS_TRACK
CREATE DATABASE BONUS_TRACK;

-- poner en uso la base de datos
USE BONUS_TRACK;

-- crear la tabla AGENDA dentro de la base de datos
CREATE TABLE AGENDA (
    IDCONTACTO INT UNSIGNED PRIMARY KEY,
    NOMBRE VARCHAR(20) NOT NULL,
    APELLIDO VARCHAR(15) NOT NULL,
    DOMICILIO VARCHAR(50),
    TELÉFONO INT NOT NULL
);

/*CREATE TABLE AGENDA (
	IDCONTACTO INT UNSIGNED PRIMARY KEY,
	NOMBRE VARCHAR(20) NOT NULL,
	APELLIDO VARCHAR(15) NOT NULL,
	DOMICILIO VARCHAR(50),
	TELÉFONO INT NOT NULL)
;*/

-- visualizar las tablas existentes de la base de datos
SHOW TABLES;

-- ver la estructura de la tabla agenda
DESC AGENDA;

-- agregar el campo MAIL a la tabla, contener 50 caracteres como max. y su carga es obligatoria
ALTER TABLE AGENDA
ADD MAIL VARCHAR(50) NOT NULL;

-- insertar 4 registros a la tabla AGENDA
INSERT INTO AGENDA VALUES (1, 'LUCIANO', 'FERNANDEZ', 'MARTIN RODRIGUEZ 1271', 1156485201, 'L.FERNANDEZ@GMAIL.COM'),
						  (2, 'SEBASTIÁN', 'GARCÍA', 'LARREA 567', 1152421100,'SEBASTIAN.GARCIA@HOTMAIL.COM'),
						  (3, 'CAROLINA', 'SANCHEZ', 'AV. CORRIENTES 2233 - 4ºB', 1132295741, 'CARO.GARCIA@GMAIL.COM'),
						  (4, 'SABRINA', 'DIAZ', 'CONSTITUCIÓN 3220 - 2ºA', 1128541025, 'SABRI.DIAZ@HOTMAIL.COM');

-- mostrar todo el contenido de la tabla TOP_SPOTIFY
SELECT 
    *
FROM
    TOP_SPOTIFY;

-- sólo observar las columnas ARTISTA, TÍTULO y GÉNERO
SELECT 
    ARTISTA, TITULO, GENERO
FROM
    TOP_SPOTIFY;

-- Ordenar alfabéticamente el resultado de la consulta según los géneros musicales
SELECT 
    ARTISTA, TITULO, GENERO
FROM
    TOP_SPOTIFY
ORDER BY GENERO;

-- En el caso de aquellos géneros que se repiten, ordena alfabéticamente los nombres de los artistas.
SELECT 
    ARTISTA, TITULO, GENERO
FROM
    TOP_SPOTIFY
ORDER BY GENERO , ARTISTA;

/* muestra todos los registros de la tabla TOP_SPOTIFY, las columnas ARTISTA, TÍTULO y GÉNERO. Ordena alfabéticamente el resultado según los 
nombres de los artistas y el nombre de las canciones. Muestra únicamente las 10 primeras canciones. */
SELECT 
    ARTISTA, TITULO, GENERO
FROM
    TOP_SPOTIFY
ORDER BY ARTISTA , TITULO
LIMIT 10;

-- muestra únicamente las canciones ubicadas desde la posición 11 hasta la 15 inclusive
SELECT 
    ARTISTA, TITULO, GENERO
FROM
    TOP_SPOTIFY
ORDER BY ARTISTA , TITULO
LIMIT 5 OFFSET 10;

/*de la tabla TOP_SPOTIFY, muestra una lista de todas aquellas canciones pertenecientes a la cantante llamada Madonna. Muestra todos los campos de
 la tabla en el resultado de la consulta*/
SELECT 
    *
FROM
    TOP_SPOTIFY
WHERE
    ARTISTA = 'MADONNA';

/*De la tabla TOP_SPOTIFY, se obtiene una lista de todas aquellas canciones que pertenecen al género Pop. Muestra todos los campos de la tabla y
 ordenar alfabéticamente el resultado según el nombre de las canciones.*/
SELECT 
    *
FROM
    TOP_SPOTIFY
WHERE
    GENERO = 'POP'
ORDER BY TITULO;

/* De la tabla TOP_SPOTIFY, muestra una lista de todas las canciones pertenecientes al género Pop lanzadas durante el año 2015. Muestra todos los
 campos de la tabla y ordena dicho resultado alfabéticamente según los nombres de los artistas y los nombres de las canciones. */
SELECT 
    *
FROM
    TOP_SPOTIFY
WHERE
    GENERO = 'POP' AND ANO = 2015
ORDER BY ARTISTA , TITULO;

/*De la tabla TOP_SPOTIFY, muestra una lista de todas aquellas canciones lanzadas antes del año 2011 y que pertenezcan al género Dance Pop. 
Muestra todos los campos de la tabla en el resultado de la consulta y ordenar dicho resultado alfabéticamente según los nombres de las canciones*/
SELECT 
    *
FROM
    TOP_SPOTIFY
WHERE
    ANO < 2011 AND GENERO = 'DANCE POP'
ORDER BY TITULO;

/*Genera una lista en la que se muestren todos los artistas y las canciones de la tabla TOP SPOTIFY. El nombre de cada artista y el título de la canción
 se muestran separados con un guión, en una columna llamada CANCIÓN. Utiliza la función CONCAT para realizar. Ordenado alfabéticamente la lista resultante
 por la columna CANCIÓN. Esta consulta, además, muestra el campo GENERO.*/
SELECT 
    CONCAT(ARTISTA, ' - ', TITULO) CANCION, GENERO
FROM
    TOP_SPOTIFY
ORDER BY CANCION;

/* Modifica la consulta anterior para obtener el mismo resultado con la función CONCAT_WS */
SELECT 
    CONCAT_WS(' - ', ARTISTA, TITULO) CANCION, GENERO
FROM
    TOP_SPOTIFY
ORDER BY CANCION;

/*Modificaa la consulta anterior para mostrar los géneros en mayúsculas.*/
SELECT 
    CONCAT_WS(' - ', ARTISTA, TITULO) CANCION,
    UPPER(GENERO) GENERO
FROM
    TOP_SPOTIFY
ORDER BY CANCION;

/*Agrega a la consulta anterior una columna con el nombre AÑOS en la que se calcula la cantidad de años transcurridos desde que se lanzó cada una de las
canciones al año actual.*/
SELECT 
    CONCAT_WS(' - ', ARTISTA, TITULO) CANCION,
    UPPER(GENERO) GENERO,
    YEAR(CURDATE()) - ANO AÑOS
FROM
    TOP_SPOTIFY
ORDER BY CANCION;

/* Genera una consulta que calcule la cantidad de registros que figuran en la tabla TOP SPOTIFY. El resultado se muestra en una columna con el nombre 
CANCIONES.*/
SELECT 
    COUNT(*) CANCIONES
FROM
    TOP_SPOTIFY;
/*Genera una consulta que muestra la cantidad de canciones lanzadas al mercado por año.*/
SELECT 
    ANO, COUNT(*) CANCIONES
FROM
    TOP_SPOTIFY
GROUP BY ANO;

/*Modifica la consulta anterior para no mostrar aquellos años en los que se hayan lanzado menos de 50 canciones. */
SELECT 
    ANO, COUNT(*) CANCIONES
FROM
    TOP_SPOTIFY
GROUP BY ANO
HAVING CANCIONES >= 50;

/*Genera una consulta de actualización para lograr que todos los títulos de las canciones y los nombres de los artistas de la tabla TOP_SPOTIFY queden
cargados en la tabla en mayúsculas*/
SET SQL_SAFE_UPDATES = 0;
UPDATE TOP_SPOTIFY 
SET 
    TITULO = UPPER(TITULO),
    ARTISTA = UPPER(ARTISTA);

/*Agrega a la tabla TOP_SPOTIFY una columna con el nombre PERMANENCIA. Completa la columna con la cantidad de años (al año actual) de permanencia de cada
 canción dentro de la plataforma digital*/
ALTER TABLE TOP_SPOTIFY ADD PERMANENCIA INT;
UPDATE TOP_SPOTIFY 
SET 
    PERMANENCIA = YEAR(CURDATE()) - ANO;

/*Crea una tabla nueva: ÚLTIMOS_LANZAMIENTOS a partir de la tabla TOP_SPOTIFY, tomando todos los campos de la tabla original. Vuelca en la tabla nueva
todas aquellas canciones que tengan 3 años o menos de permanencia en la plataforma digital. Una vez copiados los registros correspondientes en la tabla
nueva, eliminarlos de la tabla original (TOP_SPOTIFY)*/
CREATE TABLE ULTIMOS_LANZAMIENTOS SELECT * FROM
    TOP_SPOTIFY
WHERE
    PERMANENCIA <= 3;
DELETE FROM TOP_SPOTIFY 
WHERE
    PERMANENCIA <= 3;

/*Agrega el registro solicitado a la tabla TOP_SPOTIFY*/
INSERT INTO TOP_SPOTIFY
VALUES (610, 'GOD CONTROL', 'MADONNA', 'POP', 2018, 3);

/*Copia a la tabla ÚLTIMOS_LANZAMIENTOS todas aquellas canciones que tengan 3 años o menos de permanencia en la plataforma digital. Una vez copiados los
 registros en la tabla nueva, eliminarlos de la tabla original (TOP_SPOTIFY). */
INSERT INTO ULTIMOS_LANZAMIENTOS (ID, TITULO, ARTISTA, GENERO, ANO, PERMANENCIA)
SELECT ID, TITULO, ARTISTA, GENERO, ANO, PERMANENCIA
FROM TOP_SPOTIFY
WHERE PERMANENCIA <= 3;
DELETE FROM TOP_SPOTIFY 
WHERE
    PERMANENCIA <= 3;

/*Usando la tabla ÚLTIMOS LANZAMIENTOS, obtiene una lista de todos aquellos temas lanzados durante el último año (año más alto que figure en la tabla). En el
 resultado de la consulta, muestra solo las columnas ARTISTA y TÍTULO. Ordena alfabéticamente el resultado por los nombres de los artistas; en el caso de
 que un mismo artista haya tenido más de un lanzamiento, organiza el resultado por los títulos de esos lanzamientos. */
SELECT 
    ARTISTA, TITULO
FROM
    ULTIMOS_LANZAMIENTOS
WHERE
    ANO = (SELECT 
            MAX(ANO)
        FROM
            ULTIMOS_LANZAMIENTOS)
ORDER BY ARTISTA , TITULO;

/*Utiliza la tabla TOP SPOTIFY y obtiene una lista de todos aquellos lanzamientos correspondientes a LADY GAGA con mayor permanencia en la plataforma
digital. En el resultado de la consulta, sólo mostrar los títulos de las canciones de la artista. Ordenar el resultado alfabéticamente por los títulos de 
las canciones*/
SELECT 
    TITULO
FROM
    TOP_SPOTIFY
WHERE
    PERMANENCIA = (SELECT 
            MAX(PERMANENCIA)
        FROM
            TOP_SPOTIFY)
        AND ARTISTA = 'LADY GAGA'
ORDER BY TITULO;

/*Utiliza la tabla TOP SPOTIFY y genera una consulta que muestra los campos ARTISTA y TÍTULO. Agrega una columna con el nombre TIPO en la que se muestra
 los valores definidos en el ejercicio. Ordena el resultado alfabéticamente por nombres de los artistas. En el caso de que haya un artista con más de una
 canción en el listado, muestra ordenados alfabéticamente los nombres de las canciones.*/
SELECT 
    TITULO,
    ARTISTA,
    CASE
        WHEN GENERO LIKE '%POP%' THEN 'POP'
        WHEN
            GENERO LIKE '%ELECTRO%'
                OR GENERO LIKE '%HOUSE%'
        THEN
            'ELECTRÓNICA'
        ELSE 'OTRO'
    END AS TIPO
FROM
    TOP_SPOTIFY
ORDER BY ARTISTA , TITULO;

/*Obtiene una lista de todos aquellas canciones que contengan en su título la palabra BREAK. La lista resultante muestra las canciones de las tablas 
TOP SPOTIFY y ÚLTIMOS LANZAMIENTOS. En el resultado de la consulta, muestra todos los campos de ambas tablas. Ordena alfabéticamente el resultado por los
 nombres de las canciones. Por último, agrega a la consulta una columna con el nombre ESTADO en la que figura la palabra ANTERIOR para todos aquellos 
 registros que provienen de la tabla TOP SPOTIFY y la palabra ÚLTIMO para todos aquellos que provienen de la tabla ÚLTIMOS LANZAMIENTOS.*/
SELECT 
    *, 'ANTERIOR' AS ESTADO
FROM
    TOP_SPOTIFY
WHERE
    TITULO LIKE '%BREAK%' 
UNION SELECT 
    *, 'ULTIMO' AS ESTADO
FROM
    ULTIMOS_LANZAMIENTOS
WHERE
    TITULO LIKE '%BREAK%'
ORDER BY TITULO;

