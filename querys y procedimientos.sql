--querys

select * from clientes

select Id_Cliente, Locacion, Pais, Descripcion
from Clientes		
where Pais='DE'

select mat.Descripcion, cat.Id_Cat_Prod
from Categoria_Producto as cat, Materiales as mat
where cat.Id_Cat_Prod=mat.Id_Cat_Prod and mat.Id_Cat_Prod='ACC'

--Productos mas vendidos en Marzo
select top 3 M.Descripcion, count(V.Producto)*V.Cantidad AS Total
from Materiales as M, Transacciones_Venta as V
where M.Id_Material=V.Producto and V.Mes='3'
group by M.Descripcion, V.Cantidad
order by Total desc

--Cliente que mas dejo ganancia
select top 1 C.Descripcion, sum(V.Ganancia_USD) as Ganancia
from Clientes as C, Transacciones_Venta  as V
where C.Id_Cliente=V.Id_Cliente
group by C.Descripcion, V.Id_Cliente
order by Ganancia desc

--Los 6 meses con mas ventas
select top 6 M.Nombre, count(V.Mes) as Total
from Transacciones_Venta as V, Meses as M
where V.Mes=M.Mes
group by M.Nombre
order by Total asc

--procedimientos
create procedure Cliente_Pais
@Pais varchar(2)
as
	select Id_Cliente, Descripcion
	from Clientes
	where Pais=@Pais
go

exec Cliente_Pais 'US'

create procedure MATERIAL
@ID_CAT_PRO VARCHAR(3)
as
	select B.Descripcion, B.Id_Cat_Prod
	from Categoria_Producto as A, Materiales as B
	Where A.Id_Cat_Prod=@ID_CAT_PRO AND B.Id_Cat_Prod=@ID_CAT_PRO
go

exec MATERIAL 'TRE'