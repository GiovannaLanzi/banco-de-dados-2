use Aula_03;
CREATE TABLE `cliente_aux` (
  `i_cliente_cliente` int NOT NULL AUTO_INCREMENT,
  `s_nomecli_cliente` varchar(50) NOT NULL,
  `s_cpf_cliente` varchar(11) NOT NULL,
  `d_nasc_cliente` datetime DEFAULT NULL,
  `i_tipo_cliente` int DEFAULT '1',
  PRIMARY KEY (`i_cliente_cliente`),
  KEY `i_tipo_cliente` (`i_tipo_cliente`),
  CONSTRAINT `cliente_ibfk_aux` FOREIGN KEY (`i_tipo_cliente`) REFERENCES `tipocliente` (`i_tipocliente_tipocliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
insert into cliente_aux (i_cliente_cliente, s_nomecli_cliente, s_cpf_cliente, d_nasc_cliente, i_tipo_cliente)
select 
	i_cliente_cliente, 
    s_nomecli_cliente,
    s_cpf_cliente, 
    d_nasc_cliente, 
    i_tipo_cliente
from cliente;

update cliente_aux set s_nomecli_cliente = 'Clóvis P. Campos' where i_cliente_cliente=1;

select * from cliente_aux;

delete from cliente_aux where i_cliente_cliente=1;
select * from cliente_aux;

select upper(s_nomecli_cliente) 
from cliente_aux;

select i_cliente_cliente as idCliente, 
s_nomecli_cliente as nomeCliente
from cliente_aux;

insert into cliente_aux values (01, 'Julia', '23569874102', '2006-02-22', 01);
insert into cliente_aux values (05, 'Antonia', '23509871108', '2006-02-22', 02);
insert into cliente_aux values (06, 'Salvador', '00069874152', '2006-02-22', 02);
insert into cliente_aux values (07, 'Giovanna', '23178874760', '2006-02-22', 01);
select * from cliente_aux;
insert into venda values (1, 1, '2020-05-06', 123.5);
insert into venda values (2, 2, '2015-02-07', 55.5);
insert into venda values (3, 3, '2017-09-12', 298.0);
insert into venda values (4, 4, '2010-08-08', 123.5);
insert into venda values (5, 5, '2024-03-24', 123.5);
insert into venda values (6, 1, '2024-03-22', 27.9);
insert into venda values (7, 3, '2012-09-26', 123.5);
select * from venda;

update venda set f_valorvenda_venda=74.2 where i_cliente_cliente=4;


select distinct i_cliente_cliente
from venda;


select max(i_cliente_cliente) from cliente_aux;


set @novo_id = (select max(i_cliente_cliente) + 1 from cliente_aux);

insert into cliente_aux (i_cliente_cliente, s_nomecli_cliente, s_cpf_cliente, d_nasc_cliente, i_tipo_cliente)
values (@novo_id, 'Vespertino', '66655588793', '2001-01-01', 2);

update cliente_aux set s_nomecli_cliente='Otávio' where i_cliente_cliente=8;

update cliente_aux set d_nasc_cliente='2009-10-26' where i_cliente_cliente=7;
select * from cliente_aux;

create view cpfcliente as select i_cliente_cliente, s_cpf_cliente from cliente_aux;

 select i_cliente_cliente, s_nomecli_cliente, day(d_nasc_cliente) as 'Dia Aniversário'
 from cliente_aux where month (d_nasc_cliente) = 11;

select 
	ca.i_cliente_cliente, 
    ca.s_nomecli_cliente,
    ca.s_cpf_cliente, 
    ca.d_nasc_cliente, 
    tc.s_desctipocliente_tipocliente
from cliente_aux ca
inner join tipocliente tc on ca.i_tipo_cliente = tc.i_tipocliente_tipocliente;

select * from venda;
select v.i_venda_venda, ca.s_nomecli_cliente, ca.s_cpf_cliente, v.d_data_venda, v.f_valorvenda_venda
from venda v
	inner join cliente_aux ca on v.i_cliente_cliente = ca.i_cliente_cliente;
