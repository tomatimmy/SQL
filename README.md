PROYECTO FINAL - CURSO SQL



DOCUMENTACIÓN TÉCNICA DEL PROYECTO:
BASE DE DATOS RELACIONAL PARA EMPRESA DIGITAL DE VENTA DE PRODUCTOS TEXTILES

ALUMNO: VANARELLI MATIAS
COMISION: 43420
PROFESOR: GABRIEL ALMIÑANA
TUTOR: JOSE IGNACIO LOPEZ SAEZ



AÑO 2023

 












0. Introducción

Este proyecto busca abordar los desafíos inherentes a la administración de un catálogo diversificado de productos, la gestión de pedidos en tiempo real, la interacción con clientes y la optimización de procesos logísticos. A través de la utilización de SQL, se pretende construir una infraestructura sólida y eficiente que permita almacenar, recuperar y actualizar datos de manera precisa y rápida, aportando así a la creación de una plataforma de ecommerce fluida y de alto rendimiento. Este informe detalla los pasos cruciales en la planificación y desarrollo de la base de datos, con la intención de proporcionar una visión integral de cómo la tecnología puede potenciar las operaciones comerciales en el mundo digital actual.

1. Modelo de negocio

Somos un ecommerce dedicado a la venta de ropa de moda para hombres, mujeres y niños. Nuestra tienda en línea ofrece una amplia gama de prendas de vestir, desde ropa casual hasta elegante, así como accesorios que complementan los estilos más actuales. Nos diferenciamos por brindar un servicio de envíos rápidos y confiables a lo largo y ancho de toda Argentina, permitiendo a nuestros clientes disfrutar de las últimas tendencias desde la comodidad de sus hogares.

Contamos con un sitio web intuitivo y fácil de navegar que brinda a los clientes una experiencia de compra en línea fluida. Los usuarios pueden explorar categorías, filtrar productos, ver imágenes de alta calidad y obtener detalles de los productos para tomar decisiones informadas.

Nuestra principal ventaja competitiva radica en la rapidez y confiabilidad de nuestros envíos. Trabajamos con servicios de mensajería confiables para garantizar que los pedidos lleguen a los clientes en todo el país en el menor tiempo posible. Ofrecemos diferentes opciones de envío, incluyendo envío exprés y estándar.

Implementamos estrategias de marketing que incluyen ofertas especiales, descuentos por tiempo limitado y promociones por volumen de compra. Esto no solo atrae a nuevos clientes, sino que también fomenta la lealtad de los compradores recurrentes.

2. Problemática

Con el crecimiento exponencial del comercio electrónico en la era digital, surge la necesidad imperante de contar con sistemas eficientes y robustos que permitan administrar y gestionar de manera óptima las operaciones de un ecommerce. En este contexto, se hace presentación de desarrollo de una base de datos SQL diseñada específicamente para satisfacer las demandas únicas de un negocio en línea. Esta base de datos no solo proporcionará un almacenamiento estructurado de datos, sino que también se convertirá en el motor fundamental que impulsará todas las operaciones clave de la plataforma, desde la gestión de inventario y procesamiento de pedidos hasta el análisis de ventas.


1. Objetivo

El objetivo del proyecto es desarrollar un sistema de gestión que permita registrar y gestionar clientes, proveedores, órdenes de compra, compras y ventas de un sitio e-commerce. El sistema se implementará utilizando una base de datos SQL y proporcionará una interfaz de usuario intuitiva y fácil de usar.

Esta base de datos es fundamental para el funcionamiento del negocio, ya que permite realizar un seguimiento de las ventas, gestionar el inventario y analizar el rendimiento.



2. Estructura de la base de datos
La base de datos se compone de varias tablas interrelacionadas que representan diferentes aspectos de la gestión de compra y venta de productos textiles. A continuación, se muestra el diagrama de la estructura de la base de datos:



Link al DER: https://shorturl.at/iPQR4


3. Modelado de datos
La base de datos utiliza un modelo relacional para organizar y representar la información. Las tablas se relacionan entre sí mediante claves primarias y claves foráneas, lo que permite establecer relaciones y realizar consultas eficientes.


4. Esquema de la base de datos
A continuación, se muestra el esquema de las tablas que comprenden la base de datos:




Link al archivo de modelado de datos: https://shorturl.at/pzCOQ

5. Proceso de carga de datos
Actualmente los datos de los clientes, proveedores, productos, categorías y ventas se cargan en la base de datos a través de scripts en el DMS. A futuro serán cargados mediante formularios en la capa de aplicación. Los datos ingresados se validan y se realizan comprobaciones de integridad antes de ser almacenados en la base de datos.

6. Vistas
La base de datos cuenta con 6 vistas que cumplen diferentes propósitos, a continuación se detallan:

v_productos_rojos: genera una vista con todos los productos de color rojo independientemente del tipo de producto y categoría.
v_productos_por_categoria: genera una vista relacionando las tablas de productos y la de categorías para poder ver una descripción completa de la categoría a la que pertenece cada producto.
clientes_por_orden_de_compra: genera una vista relacionando las tablas orden_de_compra con la de clientes para poder obtener los datos del cliente asociado a la orden de compra.
orden_de_compra_junio_2023: genera una vista con todas las órdenes de compra emitidas en el mes de junio del año 2023.
orden_de_compra_total: genera una vista relacionando las tablas orden_de_compra con la de clientes, la de productos, la de intera y la de talles para poder obtener tanto los datos del cliente asociado a la orden de compra, como así también, la descripción del producto que incluye la misma, la cantidad y el talle.
productos_por_proveedor: genera una vista relacionando las tablas de productos, categorías, colores, proveen y proveedores para poder ver una tanto la categoría a la que pertenecen los productos, como así también, el color y el proveedor asociado a los mismos.
ventas_detalle: genera una vista relacionando las tablas de ventas, clientes, integra, orden_de_compra y producto para ver una detalle completo de las ventas realizadas.

Script creación de vistas: https://shorturl.at/dmvK4

7. Funciones
La base de datos cuenta con 2 funciones que cumplen diferentes propósitos, a continuación se detallan:

obtener_datos: Esta función devuelve el nombre y apellido de un cliente concatenados en un solo campo al pasarle como parámetro el id de cliente.
stock_x_producto: Esta función devuelve el stock total de un producto al pasarle como parámetro el id de producto.

Script creación de funciones: https://shorturl.at/huDIV

8. Stored Procedures
La base de datos cuenta con 2 stored procedures que cumplen diferentes propósitos, a continuación se detallan:
ordenar_tabla_clientes: Este SP acepta 2 parámetros de entrada para realizar el ordenamiento de la tabla de Clientes. Los parámetros que se pueden indicar son: a) el campo de ordenamiento; b) el tipo de orden (asc, desc).
crear_nuevo_cliente: Este SP permite la creación de un nuevo cliente tomando como parámetro todos los valores que la tabla de Clientes contempla. Asimismo, antes de realizar la creación del cliente, valida si el mismo ya existe en función del id o del DNI del mismo. En caso que el cliente no exista en la tabla, será creado y devolverá un mensaje de creación exitosa y, en caso que exista, no será creado y devolverá un mensaje indicando que el cliente ya existe en la tabla.

Script creación de SP: https://shorturl.at/juvK2

9. Triggers
La base de dato cuenta con 2 triggers en las tablas orden_de_compra y clientes, los mismos se explican a continuación:

t_orden_de_compra: este trigger registra en una tabla auxiliar (orden_de_compra_log) las nuevas órdenes de compra creadas mediante la indicación de AFTER INSERT en la tabla orden_de_compra. Asimismo, registra en forma complementaria la acción, el usuario, la fecha y la hora en que se llevó a cabo la misma.
t_baja_clientes: este trigger registra en una tabla auxiliar (baja_clientes_log) los clientes eliminados mediante la indicación BEFORE DELETE en la tabla clientes. Asimismo, registra en forma complementaria la acción, el usuario, la fecha y la hora en que se llevó a cabo la misma.

Script creación de Triggers: https://shorturl.at/ruyTY



10. SCRIPTS

Creación de base de datos (incluye vistas, funciones, sp y triggers: https://shorturl.at/aiCZ0

Población de datos:
https://shorturl.at/lrwG9


