
</center>
<img src="structure/data_imagen/Flyer.JPG" style="width: 100%; height: auto;">


# <center>Entrega de proyecto final</center>
Alumno/a: Gisela Masanes

Comisión: 53180

Tutor: Santiago Ángel González Martín

Docente: Anderson Michel Torres



---

### **Consignas:**
- La base de datos debe contener al menos:
    * ~ 15 tablas, entre las cuales debe haber al menos 1 tabla de hechos,  2 tablas transaccionales.
    * ~ 5 vistas.
    * ~ 2 stored procedure.
    * ~ 2  trigger.
    * ~ 2 funciones
    
- El documento debe contener:
    - Introducción
    - Objetivo
    - Situación problemática
    - Modelo de negocio
    - Diagrama de entidad relació
    - Listado de tablas con descripción de estructura (columna,descripción, tipo de datos, tipo de clave)
    - Scripts de creación de cada objeto de la base de datos
    - Scripts de inserción de datos
    - Informes generados en base a la información de la base
    - Herramientas y tecnologías usadas



---

## Tematica del proyecto

¡Bienvenidos al emocionante mundo de las compras en línea de teléfonos celulares! En un mundo cada vez más conectado, la conveniencia de adquirir productos desde la comodidad de nuestros hogares ha revolucionado la forma en que compramos. En respuesta a esta creciente demanda, nos complace presentarles nuestra tienda en línea, dedicada a ofrecer una amplia variedad de teléfonos celulares de última generación.

## Mision

El objetivo principal de nuestro proyecto es ofrecer a nuestros clientes una experiencia de compra en línea excepcional y sin complicaciones. Nos esforzamos por proporcionar una amplia selección de teléfonos celulares de alta calidad, junto con un sitio web fácil de usar que permita a nuestros clientes navegar, comparar y comprar sus dispositivos deseados con total confianza y seguridad.

## Modelo de negocio

Nuestro modelo de negocio se centra en ofrecer una amplia selección de productos de calidad, una experiencia de compra sin complicaciones y un excelente servicio al cliente para satisfacer las necesidades de nuestros clientes y construir relaciones duraderas con ellos.

## Diagrama entidad relacion (DER)

</center>
<img src="structure/data_imagen/Imagen_der_1.JPG" style="width: 100%; height: auto;">


## Listado de tablas y descripcion



## Estructura e ingesta de datos

## Objetos de la base de datos

## Roles y permisos

## Back up de la base de datos

## Herramientas y tecnologias usadas

## Como levantar el proyecto en CodeSpaces GitHub
* env: Archivo con contraseñas y data secretas
* Makefile: Abstracción de creacción del proyecto
* docker-compose.yml: Permite generar las bases de datos en forma de contenedores

#### Pasos para arrancar el proyecto

* En la terminal de linux escribir :
    - `make` _si te da un error de que no conexion al socket, volver al correr el comando `make`_
    - `make clean-db` limpiar la base de datos
    - `make test-db` para mirar los datos de cada tabla
    - `make backup-db` para realizar un backup de mi base de datos
    - `make access-db` para acceder a la base de datos
