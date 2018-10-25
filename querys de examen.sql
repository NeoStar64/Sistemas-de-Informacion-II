
--Lista del cliente 
select*
from Transacciones_Venta 
where Id_Cliente =7000

--calcular total 
select sum (Costo_USD) as total
from Transacciones_Venta 
where Id_Cliente =7000

--ordenar clientes asecente
select C.Id_Cliente
from Transacciones_Venta as V, Clientes as C 
where c.Id_Cliente=v.Id_Cliente
order by c.Id_Cliente asc

--productos comprados por el cliente
select TV.Producto, CP.Descripcion
from Transacciones_Venta as TV, Categoria_Producto as CP
where TV.Id_Cliente=7000

--productos comprados por el cliente con costo total
SELECT TV.Producto AS ID, M.Descripcion AS NOMBRE, TEMP.COSTOTOTAL AS TOTALGRAL
FROM (SELECT  SUM (TV.Costo_USD) AS COSTOTOTAL 
FROM	Transacciones_Venta AS TV
WHERE TV.Id_Cliente=7000) AS TEMP,Transacciones_Venta AS TV, Materiales AS M
WHERE TV.Id_Cliente=7000 AND TV.Producto= M.Id_Material 
GROUP BY Producto, Descripcion, TEMP.COSTOTOTAL

--clientes de us que han cmprado menos
SELECT DISTINCT C.Id_Cliente,C.Locacion
FROM Transacciones_Venta as V, Clientes AS C
WHERE V.Id_Cliente = C.Id_Cliente AND C.Pais = 'US'



--productos con mas transacciones
SELECT TOP 1 M.Id_Material, M.Descripcion, COUNT(V.Producto) AS Total_Vendido
FROM Materiales AS M, Transacciones_Venta AS V
WHERE M.Id_Material = V.Producto
GROUP BY M.Id_Material, M.Descripcion
ORDER BY Total_Vendido DESC

--cantidad de productos que tuvo el cliente entre 2007 y 2010
SELECT M.Id_Material as Identificador, M.Descripcion as NOMBRE ,count(T.Producto) as CANTIDAD
FROM Transacciones_Venta AS T,Materiales AS M
WHERE T.Año BETWEEN 2007 AND 2010 AND M.Id_Material= T.Producto AND T.Id_Cliente=7000
GROUP BY M.Id_Material, M.Descripcion,T.Producto

--mostrar el nombre del cliente, pais, organizacion, producto (nombre), categoria y el numero de item de las transacciones de un cliente Q9
SELECT  CL.Descripcion AS CLIENTE, Cl.Pais AS PAIS, ORG.Descripcion	 AS ORGANIZACION,M.Descripcion AS PRODUCTO, CP.Descripcion AS CATEGORIA, TV.No_Item 
FROM Transacciones_Venta AS TV, Materiales AS M, Clientes AS Cl, Categoria_Producto AS CP, Organizaciones_Venta AS ORG
WHERE TV.Id_Cliente=7000 AND TV.Id_Cliente=Cl.Id_Cliente AND TV.Producto = M.Id_Material AND CL.Id_Organizacion= ORG.Id_Organizacion AND M.Id_Cat_Prod=CP.Id_Cat_Prod


-- cantidad de productos comprados por el cliente en orden
SELECT No_Orden, SUM(Cantidad) AS CANTIDAD_DE_PRODUCTOS
FROM Transacciones_Venta
WHERE  Id_Cliente = 7000
GROUP BY No_Orden
ORDER BY No_Orden ASC
