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
ddd	 VARCHAR(2),
telefone VARCHAR(9),
fax VARCHAR(9),
endereço_eletronico VARCHAR(255),
representante VARCHAR(255),
cargo_representante VARCHAR(255),
data_registro_ANS DATE

);