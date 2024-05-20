
</center>
<img src="structure/data_imagen/Flyer.JPG" style="width: 100%; height: auto;">


## <center>Entrega de proyecto final</center>

Alumno/a: Gisela Masanes (grosa)

Comisión: 53180

Tutor: Santiago Ángel González Martín

Docente: Anderson Michel Torres

---

## Indice

 1) [Temática del Proyecto](#temática-del-proyecto)
 2) [Modelo de Negocio](#modelo-de-negocio)
 3) [Diagrama Entidad-Relación](#diagrama-entidad-relación)
 4) [Listado de Tablas y Descripción](#listado-de-tablas-y-descripción)
 5) [Ingesta de datos](#ingesta-de-datos)
 6) [Objetos de la Base de Datos](#objetos-de-la-base-de-datos)
   - [Documentación de Vistas](#documentación-de-vistas)
   - [Documentación de Funciones](#documentación-de-funciones)
   - [Documentación de Triggers](#documentación-de-triggers)
   - [Documentación de Store-Procedure](#documentación-de-store-procedure)
   - [Documentación DCL-Autocommit](#DCL-Autocommit)
 7)  [Roles, Permisos y Usuarios](#roles-permisos-y-usuarios)
 8) [Backup de la Base de Datos](#backup-de-la-base-de-datos)
 - [Herramientas y Tecnologías Usadas](#herramientas-y-tecnologías-usadas)
 - [Instrucciones para Levantar el Proyecto en CodeSpaces GitHub](#instrucciones-para-levantar-el-proyecto-en-codespaces-github)
 - [Formato de Entrega](#formato-de-entrega)

--- 

1) ## Temática del proyecto

¡Bienvenidos al emocionante mundo de las compras en línea de teléfonos celulares!. En un mundo cada vez más conectado, la conveniencia de adquirir productos desde la comodidad de nuestros hogares ha revolucionado la forma en que compramos. En respuesta a esta creciente demanda, nos complace presentarles nuestra tienda en línea, dedicada a ofrecer una amplia variedad de teléfonos celulares de última generación.

--- 
2) ## Modelo de Negocio

Visión General:
SmartHYou Online es una plataforma de comercio electrónico especializada en la venta de dispositivos tecnológicos, con un énfasis particular en teléfonos móviles de alta gama. Nuestra misión es ofrecer a los consumidores la última tecnología en dispositivos móviles con un servicio de atención al cliente de primer nivel y un sistema de logística eficiente.

[<- volver al índice](#indice)

--- 
3) ## #diagrama-entidad-relación

</center>
<img src="structure/data_imagen/Imagen_der_1.JPG" style="width: 100%; height: auto;">

[<- volver al índice](#indice)

--- 

4) ## Listado de tablas y descripción 

| #   | Nombre_tabla | Columna                                     | Descripción_breve                         | Tipo de dato       | Índice(es) | Valor_null | Auto_incremento |
|-----|--------------|--------------------------------------------|-----------------------------------------------------|--------------------|-------------|------------|-----------------|
| 1   | Transportista| id_transportista                           | Identificador del transportista                     | INT                | PRIMARY KEY | No         | Sí              |
|     |              | descripcion                                | Descripción de la empresa de transporte             | TEXT               | -           | Sí         | -               |
|     |              | razon_social                               | Razón social de la empresa de transporte            | VARCHAR(255)       | -           | Sí         | -               |
| 2   | Equipos      | id_equipo                                  | Identificador del equipo                            | INT                | PRIMARY KEY | No         | Sí              |
|     |              | marca                                      | Marca del equipo                                   | VARCHAR(100)       | -           | Sí         | -               |
|     |              | descripcion                                | Descripción del equipo                              | TEXT               | -           | Sí         | -               |
|     |              | color                                      | Color del equipo                                   | VARCHAR(50)        | Sí          |             | No              |
|     |              | ram                                        | Capacidad de RAM                                   | VARCHAR(30)        | -           | Sí         | -               |
|     |              | mp                                         | Megapíxeles de la cámara                           | VARCHAR(100)       | -           | Sí         | -               |
|     |              | pulgadas                                   | Tamaño de pantalla (pulgadas)                      | DECIMAL(4, 2)      | -           | Sí         | -               |
|     |              | gama                                       | Gama del equipo                                    | VARCHAR(50)        | -           | Sí         | -               |
|     |              | importe_sin_iva                            | Valor del equipo                                   | DECIMAL(10, 2)     | Sí          |             | No              |
| 3   | Clientes     | id_cliente                                 | Identificador del cliente                          | INT                | PRIMARY KEY | No         | Sí              |
|     |              | nombre                                     | Nombre del cliente                                 | VARCHAR(255)       | -           | Sí         | -               |
|     |              | apellido                                   | Apellido del cliente                               | VARCHAR(255)       | -           | Sí         | -               |
|     |              | edad                                       | Edad del cliente                                   | INT                | -           | Sí         | -               |
|     |              | email                                      | Correo electrónico del cliente                     | VARCHAR(255)       | UNIQUE      | Sí         | -               |
|     |              | telefono                                   | Teléfono del cliente                               | VARCHAR(20)        | -           | Sí         | -               |
|     |              | calle                                      | Calle de residencia del cliente                    | VARCHAR(255)       | -           | Sí         | -               |
|     |              | numero                                     | Número de residencia del cliente                   | INT                | -           | Sí         | -               |
|     |              | piso_dto                                   | Piso o departamento de residencia del cliente      | VARCHAR(10)        | -           | Sí         | -               |
|     |              | cp                                         | Código postal del cliente                          | INT                | -           | Sí         | -               |
|     |              | ciudad                                     | Ciudad de residencia del cliente                   | VARCHAR(100)       | -           | Sí         | -               |
|     |              | provincia                                  | Provincia de residencia del cliente                | VARCHAR(100)       | -           | Sí         | -               |
|     |              | pais                                       | País de residencia del cliente                     | VARCHAR(100)       | -           | Sí         | -               |
|     |              | genero                                     | Género del cliente "Femenino","Masculino","X"      | SET                | -           | Sí         | -               |
| 4   | Compras      | id_order                                   | Identificador de la orden                          | INT                | PRIMARY KEY | No         | Sí              |
|     |              | Fecha_compra                               | Fecha de la compra                                 | DATE               | -           | Sí         | -               |
|     |              | id_cliente                                 | Identificador del cliente/FOREIGN KEY DE CLIENTES  | INT                | FOREIGN KEY | No         | Sí              |
|     |              | id_equipo                                  | Identificador del equipo comprado/FOREIGN KEY DE EQUIPOS| INT            | FOREIGN KEY | No         | Sí              |
| 5   | Comentarios  | id_comentario                              | Identificador del comentario                       | INT                | PRIMARY KEY | No         | Sí              |
|     |              | fecha                                      | Fecha del comentario                               | DATE               | -           | Sí         | -               |
|     |              | calificacion                               | Calificación del comentario (de 0 a 10)            | TINYINT UNSIGNED   | -           | Sí         | -               |
|     |              | comentario                                 | Texto del comentario                               | TEXT               | -           | Sí         | -               |
|     |              | id_order                                   | Identificador de la orden asociada al comentario/ FOREIGN KEY DE COMPRAS| INT| FOREIGN KEY | No         | Sí              |
| 6   | Envios       | id_remito                                  | Identificador del envío                            | INT                | PRIMARY KEY | No         | Sí              |
|     |              | id_order                                   | Identificador de la orden asociada al envío/ FOREIGN KEY DE COMPRAS| INT| FOREIGN KEY | No         | Sí              |
|     |              | id_transportista                           | Identificador del transportista asociado al envío/ FOREIGN KEY DE TRANSPORTISTAS| INT| FOREIGN KEY | No         | Sí              |
|     |              | fecha_inicio                               | Fecha de inicio del envío                          | DATE               | -           | Sí         | -               |
|     |              | estado                                     | Estado del envío                                   | VARCHAR(100)       | -           | Sí         | -               |
|     |              | motivo                                     | Motivo del envío                                   | TEXT               | -           | Sí         | -               |
|     |              | fecha_fin                                  | Fecha de finalización del envío                    | DATE               | -           | Sí         | -               |
| 7   | Pagos        | id_pago                                    | Identificador del pago                             | INT                | PRIMARY KEY | No         | Sí              |
|     |              | fecha                                      | Fecha del pago                                     | DATE               | -           | Sí         | -               |
|     |              | operacion_tipo                             | Tipo de operación del pago                         | VARCHAR(50)        | -           | Sí         |

[<- volver al índice](#indice)

---

5) ## Ingesta de datos

El diseño de creación y definición de la base de datos se encuentra en el archivo database_structure.sql, situado en la carpeta structure.

La mayoría de las operaciones de carga de datos se llevan a cabo mediante el archivo population.sql.

[<- volver al índice](#indice)

---

6) ## Objetos de la base de datos

* ## documentación de vistas
### Vista 1: Compras por género
| #   | View_Nombre               | DESCRIPCIÓN                                                                       | TABLAS COMPROMETIDAS |
|-----|---------------------------|-----------------------------------------------------------------------------------|----------------------|
| 1   | vw_compras_por_genero     | Muestra el total de compras por género y el porcentaje que representan del total. | compras, clientes    |

**Resultado de la consulta:**

<img src="structure/data_imagen/vista_1.png" style="width: 100%; height: auto;">
---

### Vista 2: Top_Five de edades que más compran en Smartyou

| #   | View_Nombre               | DESCRIPCIÓN                                                           | TABLAS COMPROMETIDAS |
|-----|---------------------------|-----------------------------------------------------------------------|----------------------|
| 2   | vw_edades_clientes        | Indica el total de compras agrupadas por edad de los clientes.        | compras, clientes    |

**Resultado de la consulta:**

<img src="structure/data_imagen/vista_2.png" style="width: 100%; height: auto;">

### Vista 3: Equipos más vendidos

| #   | View_Nombre               | DESCRIPCIÓN                                                                | TABLAS COMPROMETIDAS |
|-----|---------------------------|----------------------------------------------------------------------------|----------------------|
| 3   | vw_equipos_mas_vendidos   | Lista las marcas y descripciones de los equipos más vendidos, limitados a los top 5. | compras, equipos     |

**Resultado de la consulta:**

<img src="structure/data_imagen/vista_3.png" style="width: 100%; height: auto;">

### Vista 4: Gasto promedio de las compras de los clientes

| #   | View_Nombre               | DESCRIPCIÓN                                                                                                 | TABLAS COMPROMETIDAS |
|-----|---------------------------|-------------------------------------------------------------------------------------------------------------|----------------------|
| 4   | vw_promedio_gasto_clientes | Calcula el monto promedio que los clientes gastan en la tienda online para comprar un celular.              | pagos                |

**Resultado de la consulta:**

<img src="structure/data_imagen/vista_4.png" style="width: 100%; height: auto;">

### Vista 5: Agrupar calificaciones de los clientes

| #   | View_Nombre               | DESCRIPCIÓN                                                                        | TABLAS COMPROMETIDAS |
|-----|---------------------------|------------------------------------------------------------------------------------|----------------------|
| 5   | vw_calificaciones_clientes | Agrupa y cuenta las calificaciones dadas por los clientes en sus comentarios.      | comentarios          |

**Resultado de la consulta:**

<img src="structure/data_imagen/vista_5.png" style="width: 100%; height: auto;">

* ## Documentación de Funciones
### Función 1: Monto con IVA

| # | Function_Nombre     | Descripción                                                      | Tablas Comprometidas |
|---|---------------------|------------------------------------------------------------------|----------------------|
| 1 | fn_monto_con_iva    | Devuelve el monto con un IVA del 21%                             | pagos              |

**Resultado de la consulta:**

<img src="structure/data_imagen/funcion_1.png" style="width: 100%; height: auto;">

### Función 2: Demora en días de entrega 

| # | Function_Nombre     | Descripción                                                      | Tablas Comprometidas |
|---|---------------------|------------------------------------------------------------------|----------------------|
| 2 | fn_demora_entrega   | Calcula la demora de entrega de un envío en días en función de un remito                | envios             |

**Resultado de la consulta:**

<img src="structure/data_imagen/funcion_2.png" style="width: 100%; height: auto;">

---

* ## Documentación de Triggers
### Triggers 1: Crea un respaldo para insercion nuevos equipos

| # | Triggers_Nombre     | Descripción                                                                     | Objetivo                                    | Tablas involucradas            |
|---|---------------------|---------------------------------------------------------------------------------|---------------------------------------------|--------------------------------|
| 1 | insert_before_equipos | Este trigger deja asiento en una tabla stage los insert que se realicen en la tabla equipos (before) | Resguardar información calificada para el negocio | Equipos/stage_insertion_equipos |

**Resultado del disparador con un ejemplo concreto:**

<img src="structure/data_imagen/trigger_1.png" style="width: 100%; height: auto;">

### Triggers 2: Crea un respaldo para la modificacion de equipos

| # | Triggers_Nombre     | Descripción                                                                     | Objetivo                                    | Tablas involucradas            |
|---|---------------------|---------------------------------------------------------------------------------|---------------------------------------------|--------------------------------|
| 2 | update_equipo_AU      | Este trigger deja asiento en una tabla stage las modificaciones que se realicen en la tabla equipos (after) | Resguardar información calificada para el negocio | Equipos/stage_update_equipos   |

**Resultado del disparador con un ejemplo concreto:**

<img src="structure/data_imagen/trigger_2.png" style="width: 100%; height: auto;">

--- 

## Documentación de store procedure
### Stored_Procedure 1: Lista de compras por cliente

| # | Stored_Procedure              | Descripción                                                                                       | Objetivo                                                           | Tablas                     |
|---|------------------------------|---------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|----------------------------|
| 1 | sp_obtener_compras_por_cliente | Este procedimiento devuelve una lista de compras realizadas por un cliente específico.           | Permite a los usuarios obtener rápidamente un historial de compras de un cliente en particular | Compras, Equipos          |

**Resultado del disparador con un ejemplo concreto:**

<img src="structure/data_imagen/sp_1.png" style="width: 100%; height: auto;">

### Stored_Procedure 2: Ventas_anuales_por_gama

| # | Stored_Procedure              | Descripción                                                                                       | Objetivo                                                           | Tablas                     |
|---|------------------------------|---------------------------------------------------------------------------------------------------|--------------------------------------------------------------------|----------------------------|
| 2 | sp_monto_total_ventas_por_gama | Este procedimiento devuelve el monto total de ventas desglosado por gama de equipos para un año específico. | Proporciona información sobre el rendimiento de cada gama de productos en términos de ventas | Compras, Equipos, Pagos   |

**Resultado del disparador con un ejemplo concreto:**

<img src="structure/data_imagen/sp_1.png" style="width: 100%; height: auto;">

## DCL-Autocommit
 ***FALTAAAA****

[<- volver al índice](#indice)

---
7) ## Roles-permisos y usuarios

Se generaron cuatro roles para áreas especificas de la companía y se asignaron a usuarios segun sus puestos laborales:

 `ROLE:ciberseguridad`
 `ROLE:marketing`
 `ROLE:cobranzas`
 `ROLE:delivery`

Se adjunta evidencia de la creacion de roles:
<img src="structure/data_imagen/roles.png" style="width: 100%; height: auto;">

Se adjunta evidencia, prueba de conexión para el user Nicolás Cage.
<img src="structure/data_imagen/roles_2.png" style="width: 100%; height: auto;">


### *La documentacion completa se visualizar en la siguiente ubicació: `./objects/roles_users.sql`


## Back up de la base de datos



## Herramientas y tecnologías usadas

<p align="center">
    <img src="structure/data_imagen/mysql.png" alt="MySQL Workbench" style="width: 50px; height: 50px; margin: 10px;">
    <img src="structure/data_imagen/ms_excel.png" alt="MS Excel" style="width: 50px; height: 50px; margin: 10px;">
    <img src="structure/data_imagen/drive.png" alt="Google Drive" style="width:50px; height: 50px; margin: 10px;">
</p>

<p align="center">
    <img src="structure/data_imagen/canva.png" alt="Canva" style="width: 50px; height: 50px; margin: 10px;">
    <img src="structure/data_imagen/github.png" alt="GitHub" style="width: 50px; height: 50px; margin: 10px;">
    <img src="structure/data_imagen/vsc.png" alt="Visual Studio Code" style="width: 50px; height: 50px; margin: 10px;">
</p>

<p align="center">
    <img src="structure/data_imagen/docker.png" alt="Docker" style="width: 50px; height: 50px; margin: 10px;">
    <img src="structure/data_imagen/mockaroo.png" alt="Mockaroo" style="width: 50px; height: 50px; margin: 10px;">
    <img src="structure/data_imagen/coder.png" alt="Coder" style="width: 50px; height: 50px; margin: 10px;">
</p>


