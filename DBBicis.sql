Create Database Bicis

--tablas
Create Table Lenguajes 
(
        Llave_Lenguaje VarChar(2) Primary Key,
        Lenguaje VarChar(20),
        Pais VarChar(20)
)


Create Table Organizaciones_Venta 
(
        Id_Organizacion VarChar(4) Primary Key,
        Llave_Lenguaje VarChar(2) Foreign Key References Lenguajes(Llave_Lenguaje),
        Descripcion VarChar(Max)
)

Create Table Categoria_Producto 
(
        Id_Cat_Prod VarChar(3) Primary Key,
        Llave_Lenguaje VarChar(2) Foreign Key References Lenguajes(Llave_Lenguaje),
        Descripcion VarChar(Max)
)


Create Table Materiales 
(
        Descripcion VarChar(Max),
        Id_Material VarChar(8) Primary Key,
        Id_Cat_Prod  VarChar(3) Foreign Key References Categoria_Producto(Id_Cat_Prod),
        Divison VarChar(2)
)

Create Table Clientes 
(
        Id_Cliente Int Primary Key,
        Llave_Lenguaje VarChar(2) Foreign Key References Lenguajes(Llave_Lenguaje),
        Id_Organizacion VarChar(4) Foreign Key References Organizaciones_Venta(Id_Organizacion),
        Locacion VarChar(Max),
        Pais VarChar(2),
        Descripcion VarChar(Max)
)

Create Table Meses 
(
        Mes Int Primary Key,
        Nombre VarChar(10)
)

Create Table Transacciones_Venta 
(
        No_Orden Int,
        No_Item Int,
        Año Int,
        Mes Int Foreign Key References Meses(Mes),
        Fecha DateTime,
        Id_Cliente Int Foreign Key References Clientes(Id_Cliente),
        Producto VarChar(8) Foreign Key References Materiales(Id_Material),
        Cantidad Int,
        Unidad_Medicion VarChar(2),
        Ganancia_USD Money,
        Descuento_USD Money,
        Costo_USD Money,
        Constraint PK_Venta Primary Key (No_Orden, No_Item)
)

--datos
Insert Into Meses Values ('1', 'Enero')
Insert Into Meses Values ('2', 'Febrero')
Insert Into Meses Values ('3', 'Marzo')
Insert Into Meses Values ('4', 'Abril')
Insert Into Meses Values ('5', 'Mayo')
Insert Into Meses Values ('6', 'Junio')
Insert Into Meses Values ('7', 'Julio')
Insert Into Meses Values ('8', 'Agosto')
Insert Into Meses Values ('9', 'Septiembre')
Insert Into Meses Values ('10', 'Octubre')
Insert Into Meses Values ('11', 'Noviembre')
Insert Into Meses Values ('12', 'Diciembre')