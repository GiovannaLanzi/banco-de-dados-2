CREATE DATABASE aula03;
use aula03;

CREATE TABLE cliente(
	i_cliente_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  /* i é para inteiro, o 1°cliente é o nome da coluna, e o 2° é o nome da tabela*/
    s_nomecli_cliente VARCHAR(50) NOT NULL,
    s_cpf_cliente VARCHAR(11) NOT NULL,
    d_nasc_cliente DATETIME
);

/*DROP TABLE cliente;*/

/*ALTER TABLE cliente MODIFY COLUMN s_nomecli_cliente VARCHAR(30) NOT NULL;*/

alter table cliente add i_tipo_cliente INT default 1;
/*alter table cliente drop i_tipo_cliente;*/


