#comentario de linea
-- comentario de linea
/*comentarios de bloque
*/

-- crear la base de datos LABORATORIO
CREATE DATABASE LABORATORIO;

-- poner en uso la base
USE LABORATORIO;

-- crear la tabla FACTURAS dentro de la base de datos
CREATE TABLE FACTURAS (
    LETRA CHAR,
    NUMERO INT,
    CLIENTEID INT,
    ARTICULOID INT,
    FECHA DATE,
    MONTO DOUBLE,
    PRIMARY KEY (LETRA , NUMERO)
);

-- crear la tabla ARTICULOS dentro de la base de datos
CREATE TABLE ARTICULOS (
	ARTICULOID INT PRIMARY KEY,
	NOMBRE VARCHAR(50),
	PRECIO DOUBLE,
	STOCK INT
);

-- crear la tabla CLIENTES dentro de la base de datos
CREATE TABLE CLIENTES (
    CLIENTEID INT PRIMARY KEY,
    NOMBRE VARCHAR(25),
    APELLIDO VARCHAR(25),
    CUIT CHAR(16),
    DIRECCION VARCHAR(50),
    COMENTARIOS VARCHAR(50)
);

-- mostrar un listado de todas las base de datos
SHOW DATABASES;

-- mostrar un listado de todas las tablas de la base
SHOW TABLES;
# SHOW TABLES;

-- describir la estructura de la tabla clientes
DESCRIBE CLIENTES;
DESC CLIENTES; 

-- modificar la tabla FACTURAS
ALTER TABLE FACTURAS
CHANGE CLIENTEID IDCLIENTE INT,
CHANGE ARTICULOID IDARTICULO INT,
MODIFY MONTO DOUBLE UNSIGNED;

-- modificar la tabla ARTICULOS
ALTER TABLE ARTICULOS
CHANGE ARTICULOID IDARTICULO INT,
MODIFY NOMBRE VARCHAR(75),
MODIFY PRECIO DOUBLE UNSIGNED NOT NULL,
MODIFY STOCK INT UNSIGNED NOT NULL;

-- modificar la tabla CLIENTES
ALTER TABLE CLIENTES
CHANGE CLIENTEID IDCLIENTE INT,
MODIFY NOMBRE VARCHAR(30) NOT NULL,
MODIFY APELLIDO VARCHAR(35) NOT NULL,
CHANGE COMENTARIOS OBSERVACIONES VARCHAR(255);

-- cargar 5 registros en la tabla FACTURAS
INSERT INTO FACTURAS VALUES ('A', 28, 14, 335, '2021-03-18', 1589.50),
							('A', 39, 26, 157, '2021-04-12', 979.75),
							('B', 8, 17, 95, '2021-04-25', 513.35),
							('B', 12, 5, 411, '2021-05-03', 2385.70),
							('B', 19, 50, 157, '2021-05-26', 979.75);

-- cargar 4 registros en la tabla ARTICULOS                            
INSERT INTO ARTICULOS VALUES (95, 'Webcam con Micrófono Plug & Play', 513.35, 39),
							 (157, 'Apple AirPods Pro', 979.75, 152),
							 (335, 'Lavasecarropas Automático Samsung', 1589.50, 12),
							 (411, 'Gloria Trevi / Gloria / CD+DVD', 2385.70, 2);

-- cargar 5 registros en la tabla CLIENTES
INSERT INTO CLIENTES VALUES (5, 'Santiago', 'González', '23-24582359-9', 'Uriburu 558 - 7ºA', 'VIP'),
							(14, 'Gloria', 'Fernández', '23-35965852-5', 'Constitución 323', 'GBA'),
							(17, 'Gonzalo', 'López', '23-33587416-0', 'Arias 2624', 'GBA'),
							(26, 'Carlos', 'García', '23-42321230-9', 'Pasteur 322 - 2ºC', 'VIP'),
							(50, 'Micaela', 'Altieri', '23-22885566-5', 'Santamarina 1255', 'GBA');

-- cambios en la tabla CLIENTES_NEPTUNO (importada)
ALTER TABLE CLIENTES_NEPTUNO
MODIFY IDCLIENTE VARCHAR(5) PRIMARY KEY,
MODIFY NOMBRECOMPANIA VARCHAR(100) NOT NULL,
MODIFY PAIS VARCHAR(15) NOT NULL;

-- cambiar el nombre de la tabla CLIENTES por CONTACTOS                            
RENAME TABLE CLIENTES TO CONTACTOS;

-- cambios en la tabla CLIENTES (importada)
ALTER TABLE CLIENTES
MODIFY COD_CLIENTE VARCHAR(7) PRIMARY KEY,
MODIFY EMPRESA VARCHAR(100) NOT NULL,
MODIFY CIUDAD VARCHAR(25) NOT NULL,
MODIFY TELEFONO INT UNSIGNED,
MODIFY RESPONSABLE VARCHAR(30);

-- cambios en la tabla PEDIDOS (importada)
ALTER TABLE PEDIDOS
MODIFY NUMERO_PEDIDO INT UNSIGNED PRIMARY KEY,
MODIFY CODIGO_CLIENTE VARCHAR(7) NOT NULL,
MODIFY FECHA_PEDIDO DATE NOT NULL,
MODIFY FORMA_PAGO ENUM('CONTADO', 'APLAZADO', 'TARJETA'),
MODIFY ENVIADO ENUM ('SI', 'NO');

-- cambios en la tabla PRODUCTOS (importada)
ALTER TABLE PRODUCTOS
MODIFY COD_PRODUCTO INT UNSIGNED PRIMARY KEY,
MODIFY SECCION VARCHAR(20) NOT NULL,
MODIFY NOMBRE VARCHAR(40) NOT NULL,
MODIFY IMPORTADO ENUM('VERDADERO', 'FALSO') NOT NULL,
MODIFY ORIGEN VARCHAR(25) NOT NULL,
MODIFY DIA INT UNSIGNED NOT NULL,
MODIFY MES INT UNSIGNED NOT NULL,
MODIFY ANO INT UNSIGNED NOT NULL;

-- mostrar todo el contenido de la tabla CLIENTES_NEPTUNO (importada)
SELECT 
    *
FROM
    CLIENTES_NEPTUNO;

-- mostrar todos los registros de la tabla CLIENTES_NEPTUNO
SELECT 
    NOMBRECOMPANIA, CIUDAD, PAIS
FROM
    CLIENTES_NEPTUNO;
    
-- Mostrar todos los registros de la tabla CLIENTES_NEPTUNO. El resultado de la consulta ordenados alfabéticamente, por los nombres de los países.
SELECT 
    NOMBRECOMPANIA, CIUDAD, PAIS
FROM
    CLIENTES_NEPTUNO
ORDER BY PAIS;

/* mostrar los registros de la tabla CLIENTES_NEPTUNO, ordenado alfabéticamente por los nombres de los paises, para paises que se repiten ordena por
 ciudades alfabéticamente */
SELECT 
    NOMBRECOMPANIA, CIUDAD, PAIS
FROM
    CLIENTES_NEPTUNO
ORDER BY PAIS , CIUDAD;

-- muestra todos los registros de la tabla CLIENTES_NEPTUNO, ordenado alfabeticamente por nombre de paises, muestra los 10 primeros clientes
SELECT 
    NOMBRECOMPANIA, CIUDAD, PAIS
FROM
    CLIENTES_NEPTUNO
ORDER BY PAIS , CIUDAD
LIMIT 10;

/* muestra todos los registros de la tabla CLIENTES_NEPTUNO, ordenado alfabeticamente por nombre de paises, muestra los clientes ubicados desde
 la posicion 11 a 15 */
SELECT 
    NOMBRECOMPANIA, CIUDAD, PAIS
FROM
    CLIENTES_NEPTUNO
ORDER BY PAIS , CIUDAD
LIMIT 5 OFFSET 10;

-- muestra una lista de todos aquellos bebes nacidos de madres extranjeras, muestra todos los campos de la tabla NACIMIENTOS
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    NACIONALIDAD = 'EXTRANJERA';

/* De la tabla NACIMIENTOS, obtenemos una lista de todos aquellos bebés nacidos de madres menores de edad. Muestra todos los campos de la tabla y
 ordena el resultado de menor a mayor por la edad de las madres.*/
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    EDAD_MADRE < 18
ORDER BY EDAD_MADRE;

/* De la tabla NACIMIENTOS, muestra una lista de todos aquellos bebés nacidos de madres que tengan la misma edad que el padre. Muestra todos los
 campos de la tabla*/
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    EDAD_MADRE = EDAD_PADRE;

/*De la tabla NACIMIENTOS, muestra una lista de todos aquellos bebés nacidos de madres que, con respecto al padre, tengan 40 años o menos que 
el padre.*/
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    EDAD_PADRE - EDAD_MADRE > 40;

/*De la tabla CLIENTES_NEPTUNO, muestra una lista de todos aquellos clientes que residen en Argentina. Muestra todos los campos de la tabla*/
SELECT 
    *
FROM
    CLIENTES_NEPTUNO
WHERE
    PAIS = 'ARGENTINA';

/*De la tabla CLIENTES_NEPTUNO, muestra una lista de todos los clientes, con excepción de los que residen en Argentina. Muestra todos los campos de
 la tabla y ordena alfabéticamente por los nombres de los países. */
SELECT 
    *
FROM
    CLIENTES_NEPTUNO
WHERE
    PAIS <> 'ARGENTINA'
ORDER BY PAIS;

/*De la tabla NACIMIENTOS, muestra una lista de todos aquellos bebés que nacieron con menos de 20 semanas de gestación. Muestra todos los campos de
 la tabla y ordena de mayor a menor, por los valores de la columna SEMANAS. */
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    SEMANAS < 20
ORDER BY SEMANAS DESC;

/*De la tabla NACIMIENTOS, muestra una lista de todos los bebés de sexo femenino, nacidos de madresextranjeras solteras, de más de 40 años. Muestra
todos los campos de la tabla */
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    SEXO = 'FEMENINO'
        AND NACIONALIDAD = 'EXTRANJERA'
        AND ESTADO_CIVIL_MADRE = 'SOLTERA'
        AND EDAD_MADRE > 40;

/*De la tabla CLIENTES_NEPTUNO, muestra una lista de todos aquellos clientes que residan en países sudamericanos.(figuran en esta tabla Argentina,
 Brasil y Venezuela). Muestra todos los campos de la tabla y ordena de manera alfabética los registros, por los nombres de los países y las 
 ciudades.*/
SELECT 
    *
FROM
    CLIENTES_NEPTUNO
WHERE
    PAIS = 'ARGENTINA' OR PAIS = 'VENEZUELA'
        OR PAIS = 'BRASIL'
ORDER BY PAIS , CIUDAD;

/*De la tabla NACIMIENTOS, muestra una lista de todos aquellos bebés que hayan nacido con una cantidad de semanas de gestación de entre 20 y 25 
semanas, inclusive. Muestra todos los campos de la tabla y ordena el resultado según las semanas de gestación de los recién nacidos, de menor a 
mayor*/
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    SEMANAS BETWEEN 20 AND 25
ORDER BY SEMANAS;

/* De la tabla NACIMIENTOS, utiliza el operador IN y muestra una lista de todos aquellos bebés que nacieron en las comunas 1101, 3201, 5605, 8108,
 9204, 13120 y 15202. Muestra todos los campos de la tabla en el resultado de la consulta y ordena de menor a mayor los registros, por los números
 de comuna */
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    COMUNA IN (1101 , 3201, 5605, 8108, 9204, 13120, 15202)
ORDER BY COMUNA;

/*De la tabla CLIENTES_NEPTUNO, muestra una lista de todos aquellos clientes cuyo ID comience con la letra C. Muestra todos los campos de la tabla,
en el resultado de la consulta*/
SELECT 
    *
FROM
    CLIENTES_NEPTUNO
WHERE
    IDCLIENTE LIKE 'C%';

/*De la tabla CLIENTES_NEPTUNO, muestra una lista de todos aquellos clientes que residan en una ciudad que comience con la letra B y en total posea
 5 caracteres. Muestra todos los campos de la tabla. */
SELECT 
    *
FROM
    CLIENTES_NEPTUNO
WHERE
    CIUDAD LIKE 'B____';

/*De la tabla NACIMIENTOS, muestra una lista de todos aquellos padres que tengan más de 10 hijos.*/
SELECT 
    *
FROM
    NACIMIENTOS
WHERE
    HIJOS_TOTAL > 10;

-- eliminar la base de datos LABORATORIO
DROP DATABASE LABORATORIO;

/*De la tabla CLIENTES_NEPTUNO se genera una consulta que muestra las columnas IDCLIENTE y NOMBRECOMPANIA. En el resultado, se muestra una nueva
 columna con el nombre UBICACION que concatene las columnas DIRECCION, CIUDAD y PAIS, separando los valores de estos campos por un guión. Se utiliza
 la función CONCAT.
*/
SELECT 
    IDCLIENTE,
    NOMBRECOMPANIA,
    CONCAT(DIRECCION, ' - ', CIUDAD, ' - ', PAIS) AS UBICACION
FROM
    CLIENTES_NEPTUNO;

-- misma al anterior, utilizando la funcion CONCAT_WS.
SELECT 
    IDCLIENTE,
    NOMBRECOMPANIA,
    CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) AS UBICACION
FROM
    CLIENTES_NEPTUNO;

/*Del anterior, muestra en mayúsculas los valores cargados en el campo cuyo nombre es NOMBRECOMPANIA. Esta columna se muestra con el nombre EMPRESA.*/
SELECT 
    IDCLIENTE,
    UPPER(NOMBRECOMPANIA) AS EMPRESA,
    CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) AS UBICACION
FROM
    CLIENTES_NEPTUNO;

/* Del ejercicio anterior muestra los valores cargados en el campo IDCLIENTE en minúsculas. Esta columna se muestra con el nombre CODIGO. */
SELECT 
    LOWER(IDCLIENTE) AS CODIGO,
    UPPER(NOMBRECOMPANIA) AS EMPRESA,
    CONCAT_WS(' - ', DIRECCION, CIUDAD, PAIS) AS UBICACION
FROM
    CLIENTES_NEPTUNO;

/* Utilizando la tabla NACIMIENTOS, se muestra la columna FECHA. En el resultado de la consulta, se muestra una nueva columna con el nombre SEXO
 que muestre la inicial de los datos cargados en el campo SEXO y otra columna con el nombre TIPO que muestre la inicial de los datos cargados
 en el campo TIPO_PARTO.*/
SELECT 
    FECHA, LEFT(SEXO, 1) AS SEXO, LEFT(TIPO_PARTO, 1) AS TIPO
FROM
    NACIMIENTOS;

/* Utilizando la tabla CLIENTES_NEPTUNO, se muestra todos los campos de la tabla. Agrega una nueva columna a la consulta con el nombre CODIGO. 
La misma, debe concatenar la primera letra del campo CIUDAD y la primera y las 2 últimas letras del campo PAIS. Los datos de esta nueva columna
 se deben mostrar en mayúsculas */
SELECT 
    *,
    UPPER(CONCAT(LEFT(CIUDAD, 1),
                    LEFT(PAIS, 1),
                    RIGHT(PAIS, 2))) AS CODIGO
FROM
    CLIENTES_NEPTUNO;

/* Utilizando la tabla NACIMIENTOS,se muestra las 5 primeras columnas de la tabla. se agrega una nueva columna a la consulta con el nombre MES que 
tome el mes de nacimiento de los bebés del campo FECHA. Ordena el resultado de menor a mayor por los valores de la columna MES. */
SELECT 
    SEXO,
    FECHA,
    TIPO_PARTO,
    ATENC_PART,
    LOCAL_PART,
    SUBSTRING(FECHA, 4, 2) AS MES
FROM
    NACIMIENTOS
ORDER BY MES;

/*Utilizando la tabla NACIMIENTOS, se muestra las columnas SEXO, FECHA y TIPO_PARTO. En el resultado de la consulta, se muestra una nueva 
columna llamada NACIONALIDAD donde se reemplazan los valores Chilena de la columna NACIONALIDAD original por Ciudadana*/
SELECT 
    SEXO,
    FECHA,
    TIPO_PARTO,
    REPLACE(NACIONALIDAD,
        'Chilena',
        'Ciudadana') AS NACIONALIDAD
FROM
    NACIMIENTOS;

-- De la tabla PEDIDOS_NEPTUNO, muestra una lista de todos aquellos pedidos efectuados a lo largo del año 1998
SELECT 
    *
FROM
    PEDIDOS_NEPTUNO
WHERE
    YEAR(FECHAPEDIDO) = 1998;

-- De la tabla PEDIDOS_NEPTUNO, muestra una lista de todos aquellos pedidos efectuados durante los meses de agosto y septiembre del año 1997. 
SELECT 
    *
FROM
    PEDIDOS_NEPTUNO
WHERE
    MONTH(FECHAPEDIDO) BETWEEN 8 AND 9
        AND YEAR(FECHAPEDIDO) = 1997;

-- De la tabla PEDIDOS_NEPTUNO, muestra una lista de todos aquellos pedidos efectuados el primer día de cada mes de cualquier año
SELECT 
    *
FROM
    PEDIDOS_NEPTUNO
WHERE
    DAY(FECHAPEDIDO) = 1;

/* De la tabla PEDIDOS_NEPTUNO, muestra una lista de todos los registros contenidos en la tabla. En una nueva columna llamada DIAS TRANSCURRIDOS,
muestra la cantidad de días transcurridos desde la fecha en que fue realizado cada pedido, al día de hoy */
SELECT 
    *, DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS'
FROM
    PEDIDOS_NEPTUNO;

/* Se modifica la consulta anterior y agrega otra columna con el nombre DIA, que refleja el nombre del día en el que se efectuó cada uno de los 
pedidos. */
SELECT 
    *,
    DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS',
    DAYNAME(FECHAPEDIDO) AS DIA
FROM
    PEDIDOS_NEPTUNO;

/*Se modifica la consulta anterior y agrega otra columna llamada DIA DEL AÑO, que refleja el número del día del año en el que se efectuó cada uno
 de los pedidos.*/
SELECT 
    *,
    DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS',
    DAYNAME(FECHAPEDIDO) AS DIA,
    DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO'
FROM
    PEDIDOS_NEPTUNO;

/*Se modifica la consulta anterior y agrega otra columna con el nombre MES, que refleje el nombre del mes del año en el que se efectuó cada uno de
 los pedidos*/
SELECT 
    *,
    DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS',
    DAYNAME(FECHAPEDIDO) AS DIA,
    DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO',
    MONTHNAME(FECHAPEDIDO) AS 'MES'
FROM
    PEDIDOS_NEPTUNO;

/*Se modifica la consulta anterior y agrega otra columna llamada PRIMER VENCIMIENTO que calcule el primer vencimiento de cada factura, suponiendo 
que dicho vencimiento es a los 30 días de haber sido emitida.*/
SELECT 
    *,
    DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS',
    DAYNAME(FECHAPEDIDO) AS DIA,
    DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO',
    MONTHNAME(FECHAPEDIDO) AS 'MES',
    ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) AS 'PRIMER VENCIMIENTO'
FROM
    PEDIDOS_NEPTUNO;

/*Se modifica la consulta anterior y agrega otra columna llamada SEGUNDO VENCIMIENTO que calcula el segundo vencimiento de cada factura, suponiendo
que el mismo es a los 2 meses de haber sido emitida.*/
SELECT 
    *,
    DATEDIFF(CURDATE(), FECHAPEDIDO) AS 'DIAS TRANSCURRIDOS',
    DAYNAME(FECHAPEDIDO) AS DIA,
    DAYOFYEAR(FECHAPEDIDO) AS 'DIA DEL AÑO',
    MONTHNAME(FECHAPEDIDO) AS 'MES',
    ADDDATE(FECHAPEDIDO, INTERVAL 30 DAY) AS 'PRIMER VENCIMIENTO',
    ADDDATE(FECHAPEDIDO, INTERVAL 2 MONTH) AS 'SEGUNDO VENCIMIENTO'
FROM
    PEDIDOS_NEPTUNO;


/*De la tabla PEDIDOS_NEPTUNO muestra una lista de todos los registros cargados en la tabla. Genera una nueva columna con el nombre IVA que calcula
 el 21% del cargo de cada pedido, obteniendo un valor numérico que, como máximo, contenga 2 decimales. */
SELECT 
    *, ROUND(CARGO * 0.21, 2) AS IVA
FROM
    PEDIDOS_NEPTUNO;

/*Se modifica la consulta anterior, agregando una nueva columna con el nombre NETO, que calcula el total a pagar por cada cliente por las compras
 realizadas (es decir, sumándole el IVA al cargo original, manteniendo como máximo 2 decimales). */
SELECT 
    *,
    ROUND(CARGO * 0.21, 2) AS IVA,
    ROUND(CARGO * 1.21, 2) AS NETO
FROM
    PEDIDOS_NEPTUNO;

/*Se modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO A FAVOR CLIENTE que devuelva el valor entero inferior del
 neto calculado anteriormente. */
SELECT 
    *,
    ROUND(CARGO * 0.21, 2) AS IVA,
    ROUND(CARGO * 1.21, 2) AS NETO,
    FLOOR(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR CLIENTE'
FROM
    PEDIDOS_NEPTUNO;

/*Se modifica la consulta anterior, agregando una nueva columna con el nombre REDONDEO A FAVOR EMPRESA que devuelva el valor entero superior del 
neto antes calculado.*/
SELECT 
    *,
    ROUND(CARGO * 0.21, 2) AS IVA,
    ROUND(CARGO * 1.21, 2) AS NETO,
    FLOOR(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR CLIENTE',
    CEIL(ROUND(CARGO * 1.21, 2)) AS 'REDONDEO A FAVOR EMPRESA'
FROM
    PEDIDOS_NEPTUNO;

/*Calcula la cantidad de registros cargados en la tabla PEDIDOS_NEPTUNO.*/
SELECT 
    COUNT(*)
FROM
    PEDIDOS_NEPTUNO;

/*Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido entregados por el transportista con el nombre SPEEDY EXPRESS.
La columna en la que se obtiene el resultado se mostrará con el nombre ENTREGAS SPEEDY EXPRESS */
SELECT 
    COUNT(TRANSPORTISTA) AS 'ENTREGAS SPEEDY EXPRESS'
FROM
    PEDIDOS_NEPTUNO
WHERE
    TRANSPORTISTA = 'SPEEDY EXPRESS';

/*Calcula la cantidad de pedidos cargados en la tabla PEDIDOS_NEPTUNO que hayan sido atendidos por empleados cuyo apellido comience con la letra C.
La columna en la que se obtiene el resultado se muestra econ el nombre VENTAS*/
SELECT 
    COUNT(EMPLEADO) VENTAS
FROM
    PEDIDOS_NEPTUNO
WHERE
    EMPLEADO LIKE 'C%';

/*Calcula el precio promedio de todos los productos cargados en la tabla PRODUCTOS_NEPTUNO. La columna del resultado, se mmuestra con el
 nombre PRECIO PROMEDIO. Y el resultado debe mostrar, como máximo, sólo 2 decimales.*/
SELECT 
    ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO'
FROM
    PRODUCTOS_NEPTUNO;

/*Se modifica la consulta anterior, para obtener el precio más bajo de la tabla. La columna en la que se obtiene el resultado, se muestra con el
 nombre PRECIO MINIMO.*/
SELECT 
    ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO',
    MIN(PRECIOUNIDAD) 'PRECIO MINIMO'
FROM
    PRODUCTOS_NEPTUNO;

/* Se modifica la consulta anterior para obtener el precio más alto de la tabla. La nueva columna se muestra con el nombre PRECIO MAXIMO*/
SELECT 
    ROUND(AVG(PRECIOUNIDAD), 2) 'PRECIO PROMEDIO',
    MIN(PRECIOUNIDAD) 'PRECIO MINIMO',
    MAX(PRECIOUNIDAD) 'PRECIO MAXIMO'
FROM
    PRODUCTOS_NEPTUNO;

/*De la tabla PRODUCTOS_NEPTUNO, se muestra el precio más alto correspondiente a cada categoría. La columna en la que se obtiene dicho precio
se muestra con el nombre PRECIO MAXIMO. La columna que muestra las categorías se muestra con el nombre CATEGORIA.*/
SELECT 
    NOMBRECATEGORIA AS CATEGORIA,
    MAX(PRECIOUNIDAD) AS 'PRECIO MAXIMO'
FROM
    PRODUCTOS_NEPTUNO
GROUP BY CATEGORIA;

/*se calcula la cantidad de entregas efectuadas por cada transportista, utilizando la tabla PEDIDOS_NEPTUNO. La columna en la que se obtienen los
 resultados se muestra con el nombre ENTREGAS. */
SELECT 
    TRANSPORTISTA, COUNT(IDPEDIDO) AS ENTREGAS
FROM
    PEDIDOS_NEPTUNO
GROUP BY TRANSPORTISTA;

/* De la tabla NACIMIENTOS se calcula la cantidad de nacimientos según el sexo de los bebés. La columna en la que se obtienen los resultados
 se muestra con el nombre NACIMIENTOS. */
SELECT 
    SEXO, COUNT(SEXO) AS NACIMIENTOS
FROM
    NACIMIENTOS
GROUP BY SEXO;

/*De la tabla PEDIDOS_NEPTUNO, se calcula el total de gastos por cliente. La columna en la que se obtienen los resultados se muestra con el nombre
TOTAL GASTOS y se muestra como máximo 2 decimales. La columna en la que figuran los nombres de los clientes tiene el título CLIENTE.*/
SELECT 
    NOMBRECOMPANIA AS CLIENTE,
    ROUND(SUM(CARGO), 2) AS 'TOTAL GASTOS'
FROM
    PEDIDOS_NEPTUNO
GROUP BY CLIENTE;

/*De la tabla PRODUCTOS, se calcula la cantidad de productos pertenecientes a cada sección. La columna en la que se obtienen los resultados se
muestra con el nombre CANTIDAD y se ordena la consulta de mayor a menor según los valores de la columna CANTIDAD*/
SELECT 
    SECCION, COUNT(SECCION) AS CANTIDAD
FROM
    PRODUCTOS
GROUP BY SECCION
ORDER BY CANTIDAD DESC;

/* De la tabla PEDIDOS_NEPTUNO, se calcula el total de gastos por cliente. La columna en la que se obtienen los resultados se muestra con el nombre
 TOTAL GASTOS y se muestran como máximo 2 decimales. La columna en la que figuran los nombres de los clientes tiene el título CLIENTE.*/
SELECT 
    NOMBRECOMPANIA AS CLIENTE,
    ROUND(SUM(CARGO), 2) AS 'TOTAL GASTOS'
FROM
    PEDIDOS_NEPTUNO
GROUP BY CLIENTE;

/*De la tabla PRODUCTOS, se calcula la cantidad de productos pertenecientes a cada sección. La columna en la que se obtienen los resultados
se muestra con el nombre CANTIDAD y se ordena la consulta  de mayor a menor según los valores de la columna CANTIDAD*/
SELECT 
    SECCION, COUNT(SECCION) AS CANTIDAD
FROM
    PRODUCTOS
GROUP BY SECCION
ORDER BY CANTIDAD DESC;

/*De la tabla PEDIDOS_NEPTUNO, se calcula la cantidad de ventas efectuadas por mes y año. Las columnas se muestran con los nombres AÑO, MES y VENTAS
 respectivamente y se ordena el resultado por año y mes, para obtener un listado cronológico de las ventas*/
SELECT 
    YEAR(FECHAPEDIDO) AS 'AÑO',
    MONTHNAME(FECHAPEDIDO) AS MES,
    COUNT(IDPEDIDO) AS VENTAS
FROM
    PEDIDOS_NEPTUNO
GROUP BY AÑO , MES
ORDER BY AÑO , MONTH(FECHAPEDIDO);

/*Utiliza la tabla PEDIDOS_NEPTUNO y calcula las estadísticas,*/
SELECT 
    EMPLEADO,
    ROUND(SUM(CARGO), 2) AS FACTURACION,
    ROUND(AVG(CARGO), 2) AS PROMEDIO,
    MAX(CARGO) AS 'MEJOR VENTA',
    MIN(CARGO) AS 'PEOR VENTA',
    COUNT(CARGO) AS VENTAS
FROM
    PEDIDOS_NEPTUNO
GROUP BY EMPLEADO;

/*Genera, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre VARONES con todos los campos de la tabla original y copia en esta nueva tabla 
todos los registros en los que figure el sexo MASCULINO. Al ejecutar la consulta, se guarda la tabla con 98.397 filas.*/
CREATE TABLE VARONES SELECT * FROM
    NACIMIENTOS
WHERE
    SEXO = 'MASCULINO';

/*Genera, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre MUJERES con todos los campos de la tabla original y copia en esta nueva tabla 
todos los registros en los que figure el sexo FEMENINO. Al ejecutar la consulta, se genera la tabla con 94.763 filas. */
CREATE TABLE MUJERES SELECT * FROM
    NACIMIENTOS
WHERE
    SEXO = 'FEMENINO';
/*Genera, a partir de la tabla NACIMIENTOS, una nueva tabla con el nombre INDETERMINADOS con todos los campos de la tabla original y copia en esta nueva 
tabla todos los registros en los que figure INDETERMINADO. como sexo. Al ejecutar la consulta, se genera la tabla con 24 filas.*/
CREATE TABLE INDETERMINADOS SELECT * FROM
    NACIMIENTOS
WHERE
    SEXO = 'INDETERMINADO';

-- Elimina la tabla NACIMIENTOS.
DROP TABLE NACIMIENTOS;

/*Actualiza la tabla CLIENTES_NEPTUNO. Cuando figure el valor ESTADOS UNIDOS en el campo PAIS, cambia dicho valor por USA. Para verificar el cambio 
realizado, muestra el contenido de la tabla CLIENTES_NEPTUNO.*/
SET SQL_SAFE_UPDATES = 0;
UPDATE CLIENTES_NEPTUNO 
SET 
    PAIS = 'USA'
WHERE
    PAIS = 'ESTADOS UNIDOS';
SELECT 
    *
FROM
    CLIENTES_NEPTUNO;

/*Actualiza la tabla CLIENTES_NEPTUNO para mostrar todos los valores del campo NOMBRECOMPANIA en mayúsculas. Para verificar el cambio realizado, muestra
 el contenido de la tabla CLIENTES_NEPTUNO.*/
UPDATE CLIENTES_NEPTUNO 
SET 
    NOMBRECOMPANIA = UPPER(NOMBRECOMPANIA);
SELECT 
    *
FROM
    CLIENTES_NEPTUNO;

/*Actualiza la tabla CLIENTES_NEPTUNO para mostrar todos los valores de los campos CIUDAD y PAIS en mayúsculas. De la tabla CLIENTES_NEPTUNO muestra el
 contenido, para verificar el cambio realizado*/
UPDATE CLIENTES_NEPTUNO 
SET 
    CIUDAD = UPPER(CIUDAD),
    PAIS = UPPER(PAIS);
SELECT 
    *
FROM
    CLIENTES_NEPTUNO;

/*En la tabla EMPLEADOS genera una nueva columna llamada NOMBRE_EMPLEADO que admite cadenas de texto con un máximo de 30 caracteres. Ubicada esta columna a
 la derecha del campo IDEMPLEADO. Se completa esta nueva columna, concatenando los valores cargados en los campos APELLIDOS y NOMBRE, separando dichos
 valores por una coma y un espacio. Se eliminan las columnas APELLIDOS y NOMBRE. Muestra el contenido de la tabla EMPLEADOS para verificar el cambio llevado
 a cabo.*/
ALTER TABLE EMPLEADOS ADD NOMBRE_EMPLEADO VARCHAR(30) AFTER IDEMPLEADO;
UPDATE EMPLEADOS 
SET 
    NOMBRE_EMPLEADO = CONCAT(APELLIDOS, ', ', NOMBRE);
ALTER TABLE EMPLEADOS DROP APELLIDOS, DROP NOMBRE;
SELECT 
    *
FROM
    EMPLEADOS;

/*En la tabla CLIENTES, genera una nueva columna llamada TIPO que admite cadenas de texto con un máximo de 3 caracteres. Esta columna se ubica al final de
 la tabla. Completa esta nueva columna estableciendo el valor VIP para todos aquellos clientes que residan en la ciudad de MADRID. Para verificar el cambio
 llevado a cabo, se muestra el contenido de la tabla CLIENTES. */
ALTER TABLE CLIENTES ADD TIPO VARCHAR(3);
UPDATE CLIENTES 
SET 
    TIPO = 'VIP'
WHERE
    CIUDAD = 'MADRID';
SELECT 
    *
FROM
    CLIENTES;

/*Dado que todos los clientes que figuran en la tabla CLIENTES residen en España, se agrega el prefijo +34- a cada uno de los teléfonos que figuran en el 
campo TELEFONO. En caso de que un cliente no tuviera el teléfono cargado, a ese teléfono no se le debería agregar el prefijo. Muestra el contenido de
 la tabla CLIENTES para verificar el cambio realizado.*/
ALTER TABLE CLIENTES MODIFY TELEFONO VARCHAR(20);
UPDATE CLIENTES 
SET 
    TELEFONO = CONCAT('+34-', TELEFONO)
WHERE
    TELEFONO IS NOT NULL;
SELECT 
    *
FROM
    CLIENTES;

/*En la tabla PRODUCTOS se genera una nueva columna con el nombre FECHA que admite la carga de fechas. Completa la nueva columna con fechas coherentes,
 concatenando los campos DIA, MES y ANO. Cargados los datos en la nueva columna, se elimina las columnas originales (DIA, MES y ANO). Además, se actualiza
 el campo ORIGEN de manera que, donde figure el valor ESPANA, sea reemplazado por ESPAÑA. Muestra el contenido de la tabla PRODUCTOS para verificar el 
 cambio llevado a cabo.*/
ALTER TABLE PRODUCTOS ADD FECHA DATE;
UPDATE PRODUCTOS 
SET 
    FECHA = CONCAT(ANO, '-', MES, '-', DIA);
ALTER TABLE PRODUCTOS DROP DIA, DROP MES, DROP ANO;
UPDATE PRODUCTOS 
SET 
    ORIGEN = 'ESPAÑA'
WHERE
    ORIGEN = 'ESPANA';
SELECT 
    *
FROM
    PRODUCTOS;

-- Actualiza el campo SUSPENDIDO de la tabla PRODUCTOS_NEPTUNO.
ALTER TABLE PRODUCTOS_NEPTUNO MODIFY SUSPENDIDO VARCHAR(2);
UPDATE PRODUCTOS_NEPTUNO 
SET 
    SUSPENDIDO = IF(SUSPENDIDO = '0', 'NO', 'SI');
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO;
/*Actualiza los precios de todos los productos de la tabla PRODUCTOS_NEPTUNO, recargándolos un 10% y manteniendo un total de 2 decimales para cada uno de los
 precios. Muestra el contenido de la tabla PRODUCTOS_NEPTUNO para verificar el cambio llevado a cabo.*/
UPDATE PRODUCTOS_NEPTUNO 
SET 
    PRECIOUNIDAD = ROUND(PRECIOUNIDAD * 1.1, 2);
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO;

/*Observa la tabla PROVEEDORES y su contenido. Para todos aquellos proveedores que no tengan cargado un valor en el campo REGION,se mmuestra el valor NULL
 en dicho campo. Muestra el contenido de la tabla PROVEEDORES para verificar el cambio llevado a cabo. */
UPDATE PROVEEDORES 
SET 
    REGION = NULL
WHERE
    REGION = '';
SELECT 
    *
FROM
    PROVEEDORES;

/*Observa el contenido de la tabla CLIENTES. Se actualiza el campo CIUDAD de manera que todos los valores cargados en esta columna muestren la primera 
letra en mayúsculas y el resto en minúsculas. Muestra el contenido de la tabla PROVEEDORES para verificar el cambio llevado a cabo. */
UPDATE CLIENTES 
SET 
    CIUDAD = CONCAT(UPPER(LEFT(CIUDAD, 1)),
            LOWER(SUBSTRING(CIUDAD, 2, LENGTH(CIUDAD))));
SELECT 
    *
FROM
    CLIENTES;

/*Genera una nueva tabla con el nombre PRODUCTOS_SUSPENDIDOS a partir de la tabla PRODUCTOS_NEPTUNO. Vuelca en esta nueva tabla todos los campos de la tabla
PRODUCTOS_NEPTUNO, pero sólo aquellos registros en los que en el campo SUSPENDIDO figure la palabra SI. Muestra de la tabla PRODUCTOS_SUSPENDIDOS el
contenido, una vez generada. La nueva tabla contiene 8 productos (registros).*/
CREATE TABLE PRODUCTOS_SUSPENDIDOS SELECT * FROM
    PRODUCTOS_NEPTUNO
WHERE
    SUSPENDIDO = 'SI';
SELECT 
    *
FROM
    PRODUCTOS_SUSPENDIDOS;

-- todos los productos provistos por el proveedor 1 pasan a estar suspendidos por tiempo indeterminado.
UPDATE PRODUCTOS_NEPTUNO 
SET 
    SUSPENDIDO = 'SI'
WHERE
    IDPROVEEDOR = 1;
INSERT INTO PRODUCTOS_SUSPENDIDOS (IDPRODUCTO,
NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, PRECIOUNIDAD, SUSPENDIDO, IDPROVEEDOR)
SELECT IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, PRECIOUNIDAD,
SUSPENDIDO, IDPROVEEDOR
FROM PRODUCTOS_NEPTUNO
WHERE SUSPENDIDO = 'SI';
DELETE FROM PRODUCTOS_NEPTUNO 
WHERE
    SUSPENDIDO = 'SI';
    
/*En la etapa anterior, se creó una tabla nueva con el nombre PRODUCTOS_SUSPENDIDOS y se copió en ella, todos los productos que se encontraban suspendidos 
de la tabla PRODUCTOS_NEPTUNO. Sin embargo, estos registros se copiaron de una tabla a la otra; es decir, aún se encuentran cargados en la tabla 
PRODUCTOS_NEPTUNO. Por lo tanto, se lleva a cabo una consulta de eliminación para que los productos suspendidos se eliminen de la tabla PRODUCTOS_NEPTUNO. 
Al ejecutar esta consulta deberían eliminarse de la tabla PRODUCTOS_NEPTUNO 8 registros.*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM PRODUCTOS_NEPTUNO 
WHERE
    SUSPENDIDO = 'SI';

/*Utilizando la tabla PRODUCTOS_NEPTUNO, obtiene una lista de todos aquellos productos cuyo precio supere el precio promedio. Esta contiene todos los
 campos de la tabla. Por último, ordena alfabéticamente el resultado según los nombres de los productos.*/
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    PRECIOUNIDAD > (SELECT 
            AVG(PRECIOUNIDAD)
        FROM
            PRODUCTOS_NEPTUNO)
ORDER BY NOMBREPRODUCTO;

/*Toma la tabla PRODUCTOS_NEPTUNO y obtiene una lista de todos aquellos productos cuyo precio sea superior al producto más caro de la tabla 
PRODUCTOS_SUSPENDIDOS. Esta contiene todos los campos de la tabla. Luego, ordena el resultado de mayor a menor de acuerdo con los precios obtenidos. */
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    PRECIOUNIDAD > (SELECT 
            MAX(PRECIOUNIDAD)
        FROM
            PRODUCTOS_SUSPENDIDOS)
ORDER BY PRECIOUNIDAD DESC;

/*Utilizando la tabla VARONES, obtiene una lista de todos aquellos bebés que hayan nacido con una cantidad de semanas de gestación menor que el bebé
de sexo indeterminado con menor gestación. La lista debe mostrar todos los campos de la tabla. */
SELECT 
    *
FROM
    VARONES
WHERE
    SEMANAS < (SELECT 
            MIN(SEMANAS)
        FROM
            INDETERMINADOS);

/*Dada la tabla PRODUCTOS_NEPTUNO, obtiene una lista de todos los productos cuyo nombre comience con la inicial del apellido del empleado cuyo IDEMPLEADO
es el número 8. Esta muestra todos los campos de la tabla PRODUCTOS_NEPTUNO y  ordena alfabéticamente según los nombres de los productos.*/
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    LEFT(NOMBREPRODUCTO, 1) = (SELECT 
            LEFT(NOMBRE_EMPLEADO, 1)
        FROM
            EMPLEADOS
        WHERE
            IDEMPLEADO = 8)
ORDER BY NOMBREPRODUCTO;

/*Utilizando la tabla PRODUCTOS_NEPTUNO, obtiene una lista de todos los productos que pertenezcan al proveedor con el ID más alto. La lista muestra
todos los campos de la tabla PRODUCTOS_NEPTUNO y debe ordenarse alfabéticamente por los nombres de los productos. */
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    IDPROVEEDOR = (SELECT 
            MAX(IDPROVEEDOR)
        FROM
            PROVEEDORES)
ORDER BY NOMBREPRODUCTO;

/*Dada la tabla PRODUCTOS_NEPTUNO, extrae una lista de todos aquellos productos que pertenezcan a la categoría BEBIDAS y cuyo precio sea superior al
producto más caro de la categoría CONDIMENTOS. La lista muestra todos los campos de la tabla.*/
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    NOMBRECATEGORIA = 'BEBIDAS'
        AND PRECIOUNIDAD > (SELECT 
            MAX(PRECIOUNIDAD)
        FROM
            PRODUCTOS_NEPTUNO
        WHERE
            NOMBRECATEGORIA = 'CONDIMENTOS');

/*A partir de la tabla MUJERES, obtener una lista de todas aquellas bebas que hayan nacido de madres con una edad superior a la madre más longeva que 
figure en la tabla VARONES. La lista muestra todos los campos de la tabla MUJERES*/
SELECT 
    *
FROM
    MUJERES
WHERE
    EDAD_MADRE > (SELECT 
            MAX(EDAD_MADRE)
        FROM
            VARONES);

/*Utilizando la tabla CLIENTES_NEPTUNO, extrae una lista de todos los clientes que hayan realizado compras por un cargo superior a 500 dólares. La lista
 muestra los campos NOMBRECOMPANIA, CIUDAD y PAÍS y esta ordenada alfabéticamente por los nombres de las compañías*/
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    NOMBRECATEGORIA = 'BEBIDAS'
        AND PRECIOUNIDAD > (SELECT 
            MAX(PRECIOUNIDAD)
        FROM
            PRODUCTOS_NEPTUNO
        WHERE
            NOMBRECATEGORIA = 'CONDIMENTOS');

/*Utiliza la tabla CLIENTES_NEPTUNO, genera una consulta que muestra los campos IDCLIENTE, NOMBRECOMPANÍA, CIUDAD y PAÍS. Luego, agrega una columna 
llamada CONTINENTE, en la que se muestren los valores definidos en las condiciones.*/
SELECT 
    IDCLIENTE,
    NOMBRECOMPANIA,
    CIUDAD,
    PAIS,
    CASE
        WHEN PAIS IN ('ARGENTINA' , 'BRASIL', 'VENEZUELA') THEN 'AMERICA DEL SUR'
        WHEN PAIS IN ('MÉXICO' , 'USA', 'CANADÁ') THEN 'AMERICA DEL NORTE'
        ELSE 'EUROPA'
    END AS CONTINENTE
FROM
    CLIENTES_NEPTUNO
ORDER BY CONTINENTE , PAIS;

/*Utiliza la tabla PEDIDOS_NEPTUNO, genera una consulta que muestra los campos IDPEDIDO, NOMBRECOMPAÑÍA, FECHAPEDIDO y CARGO.
Luego, agrega una columna llamada EVALUACIÓN en la que se muestren los valores definidos en las condiciones.*/
SELECT 
    IDPEDIDO,
    NOMBRECOMPANIA,
    FECHAPEDIDO,
    CARGO,
    CASE
        WHEN CARGO > 700 THEN 'EXCELENTE'
        WHEN CARGO > 500 THEN 'MUY BUENO'
        WHEN CARGO > 250 THEN 'BUENO'
        WHEN CARGO > 50 THEN 'REGULAR'
        ELSE 'MALO'
    END AS 'EVALUACION'
FROM
    PEDIDOS_NEPTUNO
ORDER BY CARGO DESC;

/*Utilizando la tabla PRODUCTOS_NEPTUNO, genera una consulta que muestra los campos IDPRODUCTO, NOMBREPRODUCTO, NOMBRECATEGORÍA y PRECIOUNIDAD.
Agrega una columna con el nombre TIPO en la que se muestren los valores definidos en las condiciones.*/
SELECT 
    IDPRODUCTO,
    NOMBREPRODUCTO,
    NOMBRECATEGORIA,
    PRECIOUNIDAD,
    CASE
        WHEN PRECIOUNIDAD > 100 THEN 'DELUXE'
        WHEN PRECIOUNIDAD > 10 THEN 'REGULAR'
        ELSE 'ECONOMICO'
    END AS TIPO
FROM
    PRODUCTOS_NEPTUNO
ORDER BY PRECIOUNIDAD DESC;

/*Obtiene una lista de todos aquellos bebés nacidos con menos de 20 semanas de gestación. La lista muestra los bebés de cualquier sexo, por lo tanto, la
 consulta se debe llevar a cabo en las tablas VARONES, MUJERES e INDETERMINADOS.*/
SELECT 
    *
FROM
    VARONES
WHERE
    SEMANAS < 20 
UNION SELECT 
    *
FROM
    MUJERES
WHERE
    SEMANAS < 20 
UNION SELECT 
    *
FROM
    INDETERMINADOS
WHERE
    SEMANAS < 20;

/* Luego, obtiene una lista de todos aquellos bebés nacidos durante el mes de septiembre, con más de 40 semanas de gestación y nacidos de madres chilenas
 casadas. La lista muestra los bebés de cualquier sexo, por lo tanto, lleva adelante la consulta en las tablas VARONES, MUJERES e INDETERMINADOS. */
SELECT 
    *
FROM
    VARONES
WHERE
    FECHA LIKE '%/09/%'
        AND NACIONALIDAD = 'CHILENA'
        AND ESTADO_CIVIL_MADRE = 'CASADA'
        AND SEMANAS > 40 
UNION SELECT 
    *
FROM
    MUJERES
WHERE
    FECHA LIKE '%/09/%'
        AND NACIONALIDAD = 'CHILENA'
        AND ESTADO_CIVIL_MADRE = 'CASADA'
        AND SEMANAS > 40 
UNION SELECT 
    *
FROM
    INDETERMINADOS
WHERE
    FECHA LIKE '%/09/%'
        AND NACIONALIDAD = 'CHILENA'
        AND ESTADO_CIVIL_MADRE = 'CASADA'
        AND SEMANAS > 40;

/*Obtiene una lista de todos aquellos productos (a la venta y suspendidos) cuyo precio supere los 80 dólares. La búsqueda se lleva a cabo en las tablas
PRODUCTOS_NEPTUNO y PRODUCTOS_SUSPENDIDOS. Después, ordena el resultado alfabéticamente según los nombres de los productos.*/
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    PRECIOUNIDAD > 80 
UNION SELECT 
    *
FROM
    PRODUCTOS_SUSPENDIDOS
WHERE
    PRECIOUNIDAD > 80
ORDER BY NOMBREPRODUCTO;

/*Modifica la consulta anterior para agregar una columna llamada CONDICIÓN en la que se muestra el texto “A LA VENTA” en el caso de que el registro
provenga de la tabla PRODUCTOS_NEPTUNO; o el texto SUSPENDIDO si el registro proviene de la tabla PRODUCTOS_SUSPENDIDOS.*/
SELECT 
    *, 'A LA VENTA' AS CONDICION
FROM
    PRODUCTOS_NEPTUNO
WHERE
    PRECIOUNIDAD > 80 
UNION SELECT 
    *, 'SUSPENDIDO' AS CONDICION
FROM
    PRODUCTOS_SUSPENDIDOS
WHERE
    PRECIOUNIDAD > 80
ORDER BY NOMBREPRODUCTO;

/*Genera una lista de todos los productos que pertenezcan a la categoría BEBIDAS sin importar si los mismos se encuentran a la venta o suspendidos 
(la búsqueda se hace en las tablas PRODUCTOS_NEPTUNO y la tabla PRODUCTOS_SUSPENDIDOS). Luego, ordena la lista alfabéticamente según los nombres de los 
productos. */
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    NOMBRECATEGORIA = 'BEBIDAS' 
UNION SELECT 
    *
FROM
    PRODUCTOS_SUSPENDIDOS
WHERE
    NOMBRECATEGORIA = 'BEBIDAS'
ORDER BY NOMBREPRODUCTO;

-- Duplica el producto cuyo ID es el número 43 de la tabla PRODUCTOS_NEPTUNO en la tabla PRODUCTOS_SUSPENDIDOS a través de una consulta de datos anexados.
INSERT INTO PRODUCTOS_SUSPENDIDOS
(IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA, PRECIOUNIDAD,
SUSPENDIDO, IDPROVEEDOR)
SELECT IDPRODUCTO, NOMBREPRODUCTO, NOMBRECONTACTO, NOMBRECATEGORIA,
PRECIOUNIDAD, SUSPENDIDO, IDPROVEEDOR
FROM PRODUCTOS_NEPTUNO
WHERE IDPRODUCTO = 43;

-- Repite la consulta generada en el paso 5 anterior para observar que la cantidad de productos obtenida siga siendo la misma.
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    NOMBRECATEGORIA = 'BEBIDAS' 
UNION SELECT 
    *
FROM
    PRODUCTOS_SUSPENDIDOS
WHERE
    NOMBRECATEGORIA = 'BEBIDAS'
ORDER BY NOMBREPRODUCTO;

-- Modifica la consulta del paso 5 (cinco) para mostrar el producto duplicado.
SELECT 
    *
FROM
    PRODUCTOS_NEPTUNO
WHERE
    NOMBRECATEGORIA = 'BEBIDAS' 
UNION ALL SELECT 
    *
FROM
    PRODUCTOS_SUSPENDIDOS
WHERE
    NOMBRECATEGORIA = 'BEBIDAS'
ORDER BY NOMBREPRODUCTO;

-- Elimina el producto cuyo ID es el número 43 de la tabla PRODUCTOS_SUSPENDIDOS.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM PRODUCTOS_SUSPENDIDOS 
WHERE
    IDPRODUCTO = 43;

/*Genera una tabla con el nombre EQUIPOS en la que sólo se cree un campo cuyo nombre sea EQUIPO. Este campo debe ser de tipo VARCHAR, almacenar hasta 20 
caracteres y debe ser PRIMARY KEY de la tabla.*/
CREATE TABLE EQUIPOS (
    EQUIPO VARCHAR(20) PRIMARY KEY
);

/*Carga los nombres de las siguientes selecciones en la tabla EQUIPOS: ARGENTINA, BRASIL, PARAGUAY, CHILE, URUGUAY, COLOMBIA, ECUADOR, PERÚ, BOLIVIA, 
VENEZUELA.*/
INSERT INTO EQUIPOS VALUES ('ARGENTINA'), ('BRASIL'), ('CHILE'), ('PARAGUAY'), ('URUGUAY'),
('COLOMBIA'), ('ECUADOR'), ('PERÚ'), ('BOLIVIA'), ('VENEZUELA');

/* Genera un producto cartesiano en base a la misma tabla para lograr un fixture en el cual cada selección juegue con las otras selecciones (un partido como
 local y otro como visitante). Ordena alfabéticamente el resultado, según el nombre del equipo local. */
SELECT 
    *
FROM
    EQUIPOS L
        CROSS JOIN
    EQUIPOS V
WHERE
    L.EQUIPO <> V.EQUIPO
ORDER BY L.EQUIPO;

/*Genera un listado en la que muestra el campo NOMBRECONTACTO de la tabla PROVEEDORES y los campos IDPRODUCTO, NOMBREPRODUCTO y PRECIOUNIDAD de la tabla
 PRODUCTOS NEPTUNO. Genera el JOIN a través de la cláusula FROM. Luego, ordena el resultado alfabéticamente por los nombres de los contactos y, cuando el
nombre del contacto (nombre del proveedor) se repita, ordena los productos provistos por el proveedor, también alfabéticamente.*/
SELECT 
    PN.NOMBRECONTACTO, IDPRODUCTO, NOMBREPRODUCTO, PRECIOUNIDAD
FROM
    PROVEEDORES P
        JOIN
    PRODUCTOS_NEPTUNO PN ON P.IDPROVEEDOR = PN.IDPROVEEDOR
ORDER BY PN.NOMBRECONTACTO , NOMBREPRODUCTO;

-- Modifica la consulta anterior para generar el JOIN a través de la cláusula WHERE
SELECT 
    PN.NOMBRECONTACTO, IDPRODUCTO, NOMBREPRODUCTO, PRECIOUNIDAD
FROM
    PROVEEDORES P,
    PRODUCTOS_NEPTUNO PN
WHERE
    P.IDPROVEEDOR = PN.IDPROVEEDOR
ORDER BY PN.NOMBRECONTACTO , NOMBREPRODUCTO;

/*Crea un listado en la que se muestra el campo EMPRESA de la tabla CLIENTES y los campos NUMERO_PEDIDO, FECHA_PEDIDO y FORMA_PAGO de la tabla PEDIDOS.
 Genera el JOIN a través de la cláusula FROM. Luego, ordena el listado alfabéticamente por los nombres de las empresas.*/
SELECT 
    EMPRESA, NUMERO_PEDIDO, FECHA_PEDIDO, FORMA_PAGO
FROM
    CLIENTES C
        JOIN
    PEDIDOS P ON C.COD_CLIENTE = P.CODIGO_CLIENTE
ORDER BY EMPRESA;

-- Modifica la consulta anterior para mostrar únicamente aquellos clientes que no hayan efectuado ningún pedido.
SELECT 
    EMPRESA, NUMERO_PEDIDO, FECHA_PEDIDO, FORMA_PAGO
FROM
    CLIENTES C
        LEFT JOIN
    PEDIDOS P ON C.COD_CLIENTE = P.CODIGO_CLIENTE
WHERE
    P.NUMERO_PEDIDO IS NULL
ORDER BY EMPRESA;

-- Luego, modifica la consulta anterior para mostrar únicamente el campo EMPRESA.
SELECT 
    EMPRESA
FROM
    CLIENTES C
        LEFT JOIN
    PEDIDOS P ON C.COD_CLIENTE = P.CODIGO_CLIENTE
WHERE
    P.NUMERO_PEDIDO IS NULL
ORDER BY EMPRESA;

/* si existe algún proveedor que en este momento no le esté vendiendo ningún producto a nuestra empresa, a través de una consulta en la que se utiliza 
las tablas PROVEEDORES y PRODUCTOS NEPTUNO. Muestra todos los campos de ambas tablas en el resultado de la consulta. */
SELECT 
    *
FROM
    PROVEEDORES P
        LEFT JOIN
    PRODUCTOS_NEPTUNO PN ON P.IDPROVEEDOR = PN.IDPROVEEDOR
WHERE
    PN.IDPRODUCTO IS NULL;

/* Si existe algún producto que no se sepa quién es el proveedor que lo provee a nuestra empresa, a través de una consulta en la que se utilice las tablas
 PROVEEDORES y PRODUCTOS NEPTUNO. Se muestrna todos los campos de ambas tablas en el resultado de la consulta.*/
SELECT 
    *
FROM
    PROVEEDORES P
        RIGHT JOIN
    PRODUCTOS_NEPTUNO PN ON P.IDPROVEEDOR = PN.IDPROVEEDOR
WHERE
    P.IDPROVEEDOR IS NULL;

	