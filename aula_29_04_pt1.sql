create database curso_etec;
go

use curso_etec
go

create table cliente (
		id_cliente		int				not null	identity(1,1)	primary key,
		nom_cliente		varchar(50)		not null,
		end_cliente		varchar(60)		not null);
go

create table compra(
		id_compra	int		not null	identity(10,10)		primary key,
		vl_compra	numeric(7,2),
		dt_compra	date,
		id_cliente	int not null,
		constraint cliente_id_cliente foreign key(id_cliente) references cliente(id_cliente)
);	
go

insert into cliente
		values	('Maria', 'Rua floriano, 20'),
				('Jose', 'Rua Alcantara, 113'),
				('Carlos', 'Av. Tiradentes, 10'),
				('Josefina', 'Trav Clara Camarao, 25');
go

select * from cliente;


insert into compra	
		values	(5020.20, '2017-10-01',1),
				(3510.55, '2017-10-01',2),
				(1000.20, '2017-10-01',1),
				(1200.10, '2017-10-01',4),
				(8000.00, '2017-10-01',1);
go

select * from compra;

/*join ou inner join*/
select * 
	from cliente a inner join compra b on a.id_cliente = b.id_cliente;

select *
	from compra b join cliente a on b.id_cliente = a.id_cliente;

select * 
	from cliente a join compra b on a.id_cliente = b.id_cliente;

/*Right join - lista as linhas referentes a tabela a direita da expressão*/

select *
	from cliente a right join compra b on a.id_cliente = b.id_cliente;

/*left join - lista as linhas referentes a tabela a esquerda da expressão*/

select *
	from cliente a left join compra b on a.id_cliente = b.id_cliente;

select *
	from cliente a full join compra b on a.id_cliente = b.id_cliente;


/*OUTROS EXEMPLOS*/

select a.id_cliente, a.nom_cliente
	from cliente a join compra b on a.id_cliente = b.id_cliente
	order by nom_cliente;

select a.id_cliente as 'Codigo Cliente', a.nom_cliente as 'Nome Cliente'
	from cliente a join compra b on a.id_cliente = b.id_cliente;

select a.nom_cliente, b.dt_compra, b.vl_compra
	from cliente a join compra b on a.id_cliente = b.id_cliente
	order by nom_cliente;

select a.id_cliente, a.nom_cliente, b.vl_compra
	from cliente a join compra b on a.id_cliente = b.id_cliente
	order by nom_cliente;

select a.nom_cliente, b.dt_compra, b.vl_compra
	from cliente a join compra b on a.id_cliente = b.id_cliente
	where b.dt_compra = '2017-10-01'
	order by nom_cliente;

select a.nom_cliente, b.dt_compra, b.vl_compra
	from cliente a join compra b on a.id_cliente = b.id_cliente and b.vl_compra > 1200
	order by nom_cliente;

select distinct a.id_cliente, a.nom_cliente
	from cliente a join compra b on a.id_cliente = b.id_cliente
	order by nom_cliente;
