create database contas;
use contas;

create table usuario (
id int auto_increment primary key,
usuario varchar(50)not null,
nome varchar(255)not null,
senha varchar(255)not null
);

insert into usuario (usuario, nome, senha) values ('kelvin99','Kelvin Henrique Ferreira','123456789');
insert into usuario (usuario, nome, senha) values ('renata99','Renata Silva Silva Santos','123456789');
insert into usuario (usuario, nome, senha) values ('murilo99','Murilo Santiago Sandeiro','123456789');

create table transacoes (
id int auto_increment primary key,
id_usuario int not null,
valor numeric(10.2) not null,
data datetime not null
);

alter table transacoes add foreign key (id_usuario) references usuario (id);

insert into transacoes ( id_usuario, valor, data) values (1, 1200,'2021-01-22 17:30:10');
insert into transacoes ( id_usuario, valor, data) values (1, -1000,'2021-01-22 22:00:00');
insert into transacoes ( id_usuario, valor, data) values (2, 100,'2021-01-22 08:30:15');
insert into transacoes ( id_usuario, valor, data) values (2, -2,'2021-01-22 10:00:50');
insert into transacoes ( id_usuario, valor, data) values (2, 3500,'2021-01-25 00:00:45');
insert into transacoes ( id_usuario, valor, data) values (3, 10150,'2021-01-20 14:10:10');

/* historico de transacao*/
select nome, usuario, valor, date_format(data, '%d/%m/%Y as %h:%m:%s') as data_transacao from transacoes inner join usuario on transacoes.id_usuario = usuario.id;

/* saldo da conta */
select nome, round(sum(valor),2) as valor from transacoes inner join usuario on transacoes.id_usuario = usuario.id group by usuario;