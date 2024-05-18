
</center>
<img src="structure/data_imagen/Flyer.JPG" style="width: 100%; height: auto;">


#<center>Entrega de proyecto final</center>
Alumno/a: Gisela Masanes (grosa)

Comisión: 53180

Tutor: Santiago Ángel González Martín

Docente: Anderson Michel Torres


---

## Tematica del proyecto

¡Bienvenidos al emocionante mundo de las compras en línea de teléfonos celulares! En un mundo cada vez más conectado, la conveniencia de adquirir productos desde la comodidad de nuestros hogares ha revolucionado la forma en que compramos. En respuesta a esta creciente demanda, nos complace presentarles nuestra tienda en línea, dedicada a ofrecer una amplia variedad de teléfonos celulares de última generación.

## Misión

El objetivo principal de nuestro proyecto es ofrecer a nuestros clientes una experiencia de compra en línea excepcional y sin complicaciones. Nos esforzamos por proporcionar una amplia selección de teléfonos celulares de alta calidad, junto con un sitio web fácil de usar que permita a nuestros clientes navegar, comparar y comprar sus dispositivos deseados con total confianza y seguridad.

## Modelo de negocio

Nuestro modelo de negocio se centra en ofrecer una amplia selección de productos de calidad, una experiencia de compra sin complicaciones y un excelente servicio al cliente para satisfacer las necesidades de nuestros clientes y construir relaciones duraderas con ellos.

## Diagrama entidad relacion (DER)

</center>
<img src="structure/data_imagen/Imagen_der_1.JPG" style="width: 100%; height: auto;">


## Listado de tablas y descripción 


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




## Estructura e ingesta de datos

Se realizar principalmente por medio del archivo population.sql
Existen cargas de datos manuales en la tabla equipos

## Objetos de la base de datos

### Documentacion de Vistas

### Vista: Compras por género.

**Descripción:** Esta vista muestra la cantidad de compras y porcentaje de las mismas agrupadas por género.

**Columnas:**


Ejemplo de consulta:


### Vista: Top5 edades que más compran

**Descripción:** Esta vista muestra las cinco edades de clientes que más compran y la cantidad total de compras realizadas por cada edad

**Columnas:**



**Ejemplo de consulta:**



### Vista: Top5_equipos_más_vendidos

**Descripción:** Esta vista muestra los cinco equipos mas vendidos agrupados por marca/descripcion_equipo/cant_vendida

**Columnas:**



**Ejemplo de consulta:**



### Vista: Promedio de gastos de mis clientes

**Descripción:** Esta vista muestra el promedio del monto que los clientes gastan para comprar un celular en la tienda Smartyou.online

**Columnas:**


**Ejemplo de consulta:**



### Vista: Calificaciones

**Descripción:** Esta vista agrupa las calificaciones de los comentarios realizados por los clientes y muestra la cantidad de comentarios para cada calificación, ordenadas de manera descendente.

**Columnas:**



**Ejemplo de consulta:**


## Documentación de Funciones

### Función: mesa_cancelada
**Descripción:** Esta función calcula el monto total incluyendo un impuesto del 21% (IVA).

**Parámetros:**

***mesa_id:** 

**Retorno:**

**TRUE**                                    **FALSE** 

**Ejemplo de uso:**

### Función: demora de tiempo de entrega a cliente
**Descripción:** Esta función calcula la demora de entrega de un envío en días, tomando en cuenta la diferencia entre la fecha de inicio y la fecha de fin.

**Parámetros:**

***mesa_id:** 

**Retorno:**

**TRUE**                                    **FALSE** 

**Ejemplo de uso:**

### Función: Nombre del cliente
**Descripción:** Esta función me devuelve el nombre completo de un cliente (nombre, apellido y edad) dado su ID.

**Parámetros:**

***mesa_id:** 

**Retorno:**

**TRUE**                                    **FALSE** 

**Ejemplo de uso:**


## Documentación de Triggers

## Documentación stored_procedure

## Roles y permisos

`./objects/roles_users.sql`

Se genera tres roles:




## Back up de la base de datos

Se puede generar un comando en el archivo `make backup` que me permite ejecutar un backup de manera manual.

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


