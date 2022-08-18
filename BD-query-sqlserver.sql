.....sqlserver.....

create database xaldigital
use xaldigital


select  a.nombre_aeropuerto ,count (v.id_movimiento) as moviemintos from aeropuertos a inner join vuelos v
on v.id_aeropuerto=a.id_aeropuerto and YEAR(v.dia)='2021'  group by (a.nombre_aeropuerto)
having COUNT(id_movimiento)= 
(select top 1 count (v.id_movimiento) from aeropuertos a INNER JOIN vuelos v
ON  v.id_aeropuerto=a.id_aeropuerto  group by (a.nombre_aeropuerto) order by count (v.id_movimiento) desc)

select a.nombre_aerolinea, COUNT(v.id_movimiento) as moviminetos  from aerolineas a inner join vuelos v
on a.id_aerolinea=v.id_aerolinea and YEAR(v.dia)='2021' group by (a.nombre_aerolinea) having COUNT(v.id_movimiento) =
(select top 1 COUNT(v.id_movimiento) from aerolineas a inner join vuelos v
on a.id_aerolinea=v.id_aerolinea group by (a.nombre_aerolinea)order by count (v.id_movimiento) desc )


Select count(v.id_movimiento) as vuelos, CONVERT(date,v.dia) as fecha  from vuelos v  group by dia 


select a.nombre_aerolinea, count(v.id_movimiento) as movimientos, CONVERT(date,v.dia) as fecha from aerolineas a INNER JOIN vuelos v 
on v.id_aerolinea=a.id_aerolinea group by (a.nombre_aerolinea),(v.dia) having count(v.id_movimiento)>2;
