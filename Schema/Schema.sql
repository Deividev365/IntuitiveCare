/*Criar banco de dados*/

CREATE DATABASE IntuitiveCare;

/*Usar o banco de dados*/

USE IntuitiveCare;


/*Schema de criação da tabela de Relatorio_cadop*/

CREATE TABLE Relatorio_cadop(

id SERIAL PRIMARY KEY,
registro_ANS INTEGER,
cnpj VARCHAR(14),
razão_social VARCHAR(255),
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
data_registro_ANS DATE

);

/*
    Relatorio_cadop
    registro_ANS,
    cnpj,
    razão_social,
    nome_fantasia,
    modalidade,
    logradouro,
    numero,
    complemento, 
    bairro,
    cidade,
    uf,
    cep,
    ddd,
    telefone,
    fax,
    endereço_eletronico,
    representante,
    cargo_representante,
    data_registro_ANS
*/


/*Schema para criar tabela de dados para copiar os dados em csv*/
CREATE TABLE dados(

	dia DATE,
	reg_ans VARCHAR(50),
	cd_conta_contabil VARCHAR(50),
	descricao VARCHAR(5000),
	vl_saldo_final VARCHAR(500)


);

/*Queries de load: criar as queries para carregar o conteúdo dos arquivos obtidos nas tarefas de preparação*/

COPY dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
FROM 'C:\Users\Deivid\Desktop\IntutiveCare\Schema\1T2021.csv'
delimiter ';'
csv header
encoding 'latin1';

COPY dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
FROM 'C:\Users\Deivid\Desktop\IntutiveCare\Schema\2T2021.csv'
delimiter ';'
csv header
encoding 'latin1';

COPY dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
FROM 'C:\Users\Deivid\Desktop\IntutiveCare\Schema\3T2021.csv'
delimiter ';'
csv header
encoding 'latin1';

COPY dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
FROM 'C:\Users\Deivid\Desktop\IntutiveCare\Schema\4T2021.csv'
delimiter ';'
csv header
encoding 'latin1';


COPY dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
FROM 'C:\Users\Deivid\Desktop\IntutiveCare\Schema\1T2022.csv'
delimiter ';'
csv header
encoding 'latin1';

COPY dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
FROM 'C:\Users\Deivid\Desktop\IntutiveCare\Schema\2T2022.csv'
delimiter ';'
csv header
encoding 'latin1';


COPY dados(dia, reg_ans, cd_conta_contabil, descricao, vl_saldo_final)
FROM 'C:\Users\Deivid\Desktop\IntutiveCare\Schema\3T2022.csv'
delimiter ';'
csv header
encoding 'latin1';


/*Pesquisa as 10 maiores operadoras do útlimo trimestre que tiveram despesas com 
EVENTOS / SINISTROS CONHECIDOS OU AVISADOS  DE ASSISTÊNCIA A SAÚDE MEDICO HOSPITALAR*/

SELECT registro_ANS, cnpj, razão_social, nome_fantasia


