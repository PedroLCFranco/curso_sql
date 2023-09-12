use curso_sql;

/*Inserindo dados nas tabelas*/
insert into funcionarios (id, nome, salario, departamento) values (1, 'Fernando', 1400, 'TI');
insert into funcionarios (id, nome, salario, departamento) values (2,'Guilherme', 2500, 'Juridico');
insert into funcionarios (nome, salario, departamento) values ('Fabio', 1700, 'TI');
insert into funcionarios (nome, salario, departamento) values ('Jose', 1800, 'Marketing');
insert into funcionarios (nome, salario, departamento) values ('Isabela', 2200, 'Juridico');
select * from funcionarios;

/*Filtros de seleção*/
select * from funcionarios where salario > 2000; 
select * from funcionarios where nome = 'José';
select * from funcionarios where id = 3;

/*atualizando dados da tabela*/
update funcionarios set salario = salario * 1.1 where id = 1; 

/*AQUI O FUNCIONÁRIO ID 1 TEVE 10% DE AUMENTO.  SALARIO * 1.1 É A MESMA COISA QUE 10% LÊ-SE SALARIO VEZES
CASO E UQUEIRA ATUALIZAR O SALÁRIO DE TODOS PARA 10% DE UMA VEZSÓ ESTA FERRAMENTA DARÁ ERRO POR CAUSA DA SEGURANÇA DO
SAFE QUE NÃO PERMITE ALTERAR MUITOS DADOS DE UMA VEZ
PARA DESATIVAR O SACE DIGITE SET SQL_SAFE_UPDATES = 0; E PARA ATIVAR DIGITE SET SQL_SAFE_UPDATES = 1;: */
SET SQL_SAFE_UPDATES = 0;
/*AGORA SIM VAMOS ATUALIZAR O SALARIO DE TODOS OS FUNCIONÁRIOS PARA 10%*/
update funcionarios set salario = salario * 1.1; /*APARECERÁ VÁRIAS CASAS DECIMAIS, PARA COLOCAR A QUANTIDADE DE CASA,
ACRESCENTE ROUND E ENTRE PARENTESES (SALARIO * 1.1, E O NUMERO DE CASAS, NESTE CASO, MONETÁRIO, DUAS, VEJA ABAIXO:*/
update funcionarios set salario = round(salario * 1.1, 2);

/*excluindo registros da tabela*/
delete from funcionarios where id = 4;

/*Inserindo dados na tabela veículos lembrando que ela tem uma chave estrangeira se referindo a funcionários*/
insert into veiculos (funcionarios_id, veiculo, placa) values (1, 'CARRO', 'SB 0001');
insert into veiculos (funcionarios_id, veiculo, placa) values (1, 'CARRO', 'SB 0002');
/*outra forma de insereri dados e definindo se um atributo é null ou não:*/
insert into veiculos (funcionarios_id, veiculo, placa) values (null, 'moto', 'SB003');	

/*suponhamos que a Isabela agora foi quem saiu com o carro SB002, é só atualizar fazendo filtro:*/

update veiculos set funcionarios_id = 5 where id = 2;

/*Inserindo registro na tabela salarios:*/
insert into salarios (faixa, inicio, fim) values ('Analista JR', 1000, 2000);
insert into salarios (faixa, inicio, fim) values ('Analista Pleno', 2000, 4000);

insert into cpfs (id, cpf) values (1, '111.1111.1111');
insert into cpfs (id, cpf) values (2, '22222.2222.22');
insert into cpfs (id, cpf) values (3, '333.333.33.333');
insert into cpfs (id, cpf) values (5, '5.5555.55.555');

INSERT INTO clientes (id, nome, quem_indicou) VALUES (1, 'André', NULL);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (2, 'Samuel', 1);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (3, 'Carlos', 2);
INSERT INTO clientes (id, nome, quem_indicou) VALUES (4, 'Rafael', 1);

/*Apelidos*/
select * from  funcionarios  where funcionarios.salario > 2000; /*aqui estou selecionando a tabela funcionáros quando o saláro for maior que 2000.*/
select * from  funcionarios f  where f.salario > 2000; /*apelidando desta forma (funcionario de f, o código incurta*/

/*Exibindo apenas campos necessarios*/
select nome, salario from funcionarios f where f.salario > 2000;

/*Usando 'as' podemos "Apelidar" a tabela*/
select nome as 'funcionario', salario from funcionarios f where f.salario > 2000;

/*unindo tabelas*/
select * from funcionarios where nome = 'Guilherme';
select * from funcionarios where id = 5;

/*Para unir as tabelas é necessário colocar o comando union entre elas, tirando a vírgula:*/

select * from funcionarios where nome = 'Guilherme'
union 
select * from funcionarios where id = 5;
select * from funcionarios where nome = 'Guilherme'
union all /*traz registros duplicados*/
select * from funcionarios where id = 5;


select * from salarios;





