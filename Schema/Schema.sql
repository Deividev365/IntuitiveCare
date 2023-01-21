/*Criar banco de dados*/

CREATE DATABASE IntuitiveCare;

/*Usar o banco de dados*/

USE IntuitiveCare;


/*Schema de criação da tabela de Relatorio_cadop*/

CREATE TABLE relatorio_cadop(

	registro_ANS VARCHAR(255) NOT NULL,
	cnpj VARCHAR(14),
	razao_social VARCHAR(255),
	nome_fantasia VARCHAR(255),
	modalidade VARCHAR(50),
	logradouro VARCHAR(255),
	numero VARCHAR(50),
	complemento VARCHAR(255),
	bairro VARCHAR(255),
	cidade VARCHAR(255),
	uf VARCHAR(2),
	cep VARCHAR(8),
	ddd	VARCHAR(2),
	telefone VARCHAR(9),
	fax VARCHAR(9),
	endereço_eletronico VARCHAR(255),
	representante VARCHAR(255),
	cargo_representante VARCHAR(255),
	data_registro_ANS VARCHAR(255),

	PRIMARY KEY(registro_ANS)

);



/*Schema para criar tabela de dados para copiar os dados em csv*/

CREATE TABLE dados(

	dia  VARCHAR(50),
	reg_ans VARCHAR(50),
	cd_conta_contabil VARCHAR(50),
	descricao VARCHAR(5000),
	vl_saldo_final VARCHAR(500)


);

/*Queries de load: criar as queries para carregar o conteúdo dos arquivos obtidos nas tarefas de preparação*/

LOAD DATA LOCAL INFILE 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/Relatorio_cadop.csv' 

INTO TABLE relatorio_cadop
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
ignore  1 rows;


load data local infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/1T2021.csv'

into table dados
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore  1 rows;


load data local infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/2T2021.csv'

into table dados
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore  1 rows;

load data local infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/3T2021.csv'

into table dados
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore  1 rows;

load data local infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/4T2021.csv'

into table dados
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore  1 rows;

load data local infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/1T2022.csv'

into table dados
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore  1 rows;

load data local infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/2T2022.csv'

into table dados
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore  1 rows;

load data local infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/3T2022.csv'

into table dados
fields terminated by ';'
enclosed by '"'
lines terminated by '\n'
ignore  1 rows;




update dados set vl_saldo_final = replace(vl_saldo_final,',','.');

alter table dados

alter column vl_saldo_final type numeric using(vl_saldo_final::numeric);

/*Pesquisa as 10 maiores operadoras do útlimo trimestre que tiveram despesas com 
EVENTOS / SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR*/

select 
	reg_ans,
	cnpj,
	razão_social,
	nome_fantasia,
	sum(vl_saldo_final) as saldo_final
from dados d 
left join relatorio_cadop r 
on d.reg_ans = r.registro_ans
where  descricao = 'EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR' and dia >= '01/07/2021' 
group by registro_ans, cnpj, razão_social, nome_fantasia
order by saldo_final desc
limit 10;



