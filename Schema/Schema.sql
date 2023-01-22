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

	`DATA` DATE,
	reg_ans VARCHAR(50) NOT NULL,
	cd_conta_contabil VARCHAR(50),
	descricao VARCHAR(255),
	vl_saldo_final DOUBLE

);

/*Queries de load: criar as queries para carregar o conteúdo dos arquivos .csv obtidos nas tarefas de preparação*/

LOAD DATA LOCAL INFILE 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/Relatorio_cadop.csv'

INTO TABLE relatorio_cadop
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
ignore  1 rows;


LOAD DATA LOCAL INFILE 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/1T2021.csv'

INTO TABLE dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
IGNORE  1 ROWS
(@`DATA`, reg_ans, cd_conta_contabil, descricao, @vl_saldo_final)
SET `DATA` = STR_TO_DATE(@`DATA`, '%d/%m/%Y'),
vl_saldo_final = replace(@vl_saldo_final, ',', '.');


LOAD DATA LOCAL infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/2T2021.csv'

INTO TABLE dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
IGNORE  1 ROWS
(@`DATA`, reg_ans, cd_conta_contabil, descricao, @vl_saldo_final)
SET `DATA` = STR_TO_DATE(@`DATA`, '%d/%m/%Y'),
vl_saldo_final = replace(@vl_saldo_final, ',', '.');




LOAD DATA LOCAL infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/3T2021.csv'

INTO TABLE dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
IGNORE  1 ROWS
(@`DATA`, reg_ans, cd_conta_contabil, descricao, @vl_saldo_final)
SET `DATA` = STR_TO_DATE(@`DATA`, '%d/%m/%Y'),
vl_saldo_final = replace(@vl_saldo_final, ',', '.');


LOAD DATA LOCAL infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/4T2021.csv'

INTO TABLE dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
IGNORE  1 ROWS
(@`DATA`, reg_ans, cd_conta_contabil, descricao, @vl_saldo_final)
SET `DATA` = STR_TO_DATE(@`DATA`, '%d/%m/%Y'),
vl_saldo_final = replace(@vl_saldo_final, ',', '.');


LOAD DATA LOCAL infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/1T2022.csv'

INTO TABLE dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
IGNORE  1 ROWS
(@`DATA`, reg_ans, cd_conta_contabil, descricao, @vl_saldo_final)
SET `DATA` = STR_TO_DATE(@`DATA`, '%d/%m/%Y'),
vl_saldo_final = replace(@vl_saldo_final, ',', '.');


LOAD DATA LOCAL infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/2T2022.csv'

INTO TABLE dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
IGNORE  1 ROWS
(@`DATA`, reg_ans, cd_conta_contabil, descricao, @vl_saldo_final)
SET `DATA` = STR_TO_DATE(@`DATA`, '%d/%m/%Y'),
vl_saldo_final = replace(@vl_saldo_final, ',', '.');

LOAD DATA LOCAL infile 'C:/Users/Deivid/Desktop/IntutiveCare/Schema/3T2022.csv'

INTO TABLE dados
CHARACTER SET latin1
FIELDS TERMINATED BY ';'
ENCLOSED by '"'
lines terminated by '\r\n'
IGNORE  1 ROWS
(@`DATA`, reg_ans, cd_conta_contabil, descricao, @vl_saldo_final)
SET `DATA` = STR_TO_DATE(@`DATA`, '%d/%m/%Y'),
vl_saldo_final = replace(@vl_saldo_final, ',', '.');



/*Pesquisa as 10 maiores operadoras do útlimo trimestre que tiveram despesas com 
EVENTOS / SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR*/


SELECT dados.reg_ans,
relatorio_cadop.razao_social,
dados.descricao,
SUM(dados.vl_saldo_final) as saldo_final_trimestre
FROM dados
INNER JOIN relatorio_cadop
ON dados.reg_ans = relatorio_cadop.registro_ANS
WHERE descricao = "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR"
AND `DATA` = "2022-01-01"
GROUP BY dados.reg_ans
ORDER BY saldo_final_trimestre DESC
LIMIT 10;




/*Pesquisa as 10 operadoras que mais tiveram despesas com "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS
  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR" no último ano? */



SELECT dados.reg_ans,
relatorio_cadop.razao_social,
dados.descricao,
SUM(dados.vl_saldo_final) as saldo_final_total
FROM dados
INNER JOIN relatorio_cadop
ON dados.reg_ans = relatorio_cadop.registro_ANS
WHERE descricao = "EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR"
AND `DATA` BETWEEN "2022-01-01" AND "2022-12-31"
GROUP by dados.reg_ans
ORDER BY saldo_final_total DESC
LIMIT 10;


