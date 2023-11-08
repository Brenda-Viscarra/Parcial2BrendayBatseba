create database BDParcial2BrendayBatseba
use BDParcial2BrendayBatseba
use master

create table DEPARTAMENTO(
    Departamentoid int primary key identity(1,1),
    Nombre varchar(50)
);

create table MUNICIPIO(
    Municipioid int primary key identity(1,1),
    Nombre varchar(50),
    Departamentoid int not null foreign key (Departamentoid) references DEPARTAMENTO(Departamentoid)
);

create table CLIENTE(
	Clienteid int primary key identity(1,1),
	Nombre varchar(50) not null,
	Apellido varchar(40) not null,
	Departamentoid int not null foreign key (Departamentoid) references DEPARTAMENTO(Departamentoid),
	Municipioid int not null foreign key (Municipioid) references MUNICIPIO(Municipioid)
);

insert into DEPARTAMENTO (Nombre) values ('Chalatenango');
insert into DEPARTAMENTO (Nombre) values ('Sonsonate');
insert into DEPARTAMENTO (Nombre) values ('San Salvador');
insert into DEPARTAMENTO (Nombre) values ('San Miguel');

-- Municipios de Chalatenango
insert into MUNICIPIO (Nombre, Departamentoid) values ('Chalatenango', 1);
insert into MUNICIPIO (Nombre, Departamentoid) values ('Agua Caliente', 1);
insert into MUNICIPIO (Nombre, Departamentoid) values ('Comalapa', 1);

-- Municipios de Sonsonate
insert into MUNICIPIO (Nombre, Departamentoid) values ('Sonsonate', 2);
insert into MUNICIPIO (Nombre, Departamentoid) values ('Juayua', 2);
insert into MUNICIPIO (Nombre, Departamentoid) values ('Acajutla', 2);

-- Municipios de San Salvador
insert into MUNICIPIO (Nombre, Departamentoid) values ('San Marcos', 3);
insert into MUNICIPIO (Nombre, Departamentoid) values ('Apopa', 3);
insert into MUNICIPIO (Nombre, Departamentoid) values ('San Salvador', 3);

-- Municipios de San Miguel
insert into MUNICIPIO (Nombre, Departamentoid) values ('Moncagua', 4);
insert into MUNICIPIO (Nombre, Departamentoid) values ('Chinameca', 4);
insert into MUNICIPIO (Nombre, Departamentoid) values ('Lolotique', 4);

select * from DEPARTAMENTO
select * from MUNICIPIO
select * from CLIENTE

insert into CLIENTE (Nombre, Apellido, Departamentoid, Municipioid) values ('Dominga', 'Perez', 1, 1);
insert into CLIENTE (Nombre, Apellido, Departamentoid, Municipioid) values ('Samuel', 'Hernandez', 2, 5);

select c.Nombre as NombreCliente, c.Apellido, d.Nombre as NombreDepartamento, m.Nombre as NombreMunicipio
from Cliente c
INNER JOIN Departamento d on c.Departamentoid = d.Departamentoid
INNER JOIN Municipio m on c.Municipioid = m.Municipioid;