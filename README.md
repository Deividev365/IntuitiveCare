 <h1 align="center">Processo Seletivo IntuitiveCare 🎯</h1>

 <p align="center">
  <a href="#-projeto">Projeto</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
 <a href="#-tecnologias">Tecnologias</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-arquitetura">Arquitetura</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-desafios">Desafios</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
   <a href="#-features">Features</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
  <a href="#-boas-praticas">Boas Práticas</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
 <a href="#-contato">Contato</a>

</p>
<br>

<p align="center">
 <img src="https://img.shields.io/static/v1?label=PRs&message=welcome&color=49AA26&labelColor=000000" alt="PRs welcome!" />

  <img alt="License" src="https://img.shields.io/static/v1?label=license&message=MIT&color=49AA26&labelColor=000000">
</p>


<br>


<div align="center">
<img align="center" src="https://user-images.githubusercontent.com/61792159/213949486-72b87e07-239a-4a73-b623-8bab19ab0b57.jpg" alt="intuitiveCare-logo">
</div>


## 🚀 Projeto
O objetivo do projeto é resolver os **4 desafios** propostos pela empresa intuitiveCare, apresentando os conceitos técnicos solicitados, aplicando boas práticas de desenvolvimento de software.

## 🚀 Tecnologias


<li>Python</li>
<li>BeautifulSoup</li>
<li>Flask</li>
<li>SQLAlchemy</li>
<li>MariaDB</li>
<li>Vue.js</li>
<li>Bootstrap</li>


## 🚀 Arquitetura

Apresentando a arquitetura técnica, incluindo tecnologias que foram utilizadas no projeto, o relacionamento e integrações realizadas, protócolos de comunicação, entregando visibilidade das ferramentas que foram adotadas e padrões que podem ser utilizados em outros projetos.
<br>
<br>
<div align="center">
<img width="900" height="400" src="https://user-images.githubusercontent.com/61792159/214063937-92cc0d34-07ac-4c55-b0b1-cf6efb119ad0.png" alt="Arquitetura-Tecnica-webScraping" />
 </div>
 <h3 align="center">WebScraping</h3>

<br>
<br>
<div align="center">
<img width="900" height="400" src="https://user-images.githubusercontent.com/61792159/214070249-f043acca-a99f-49b0-b495-c173f7003c88.png" alt="Arquitetura-Tecnica-API" />
 </div>
<h3 align="center">API</h3>


## 🚀 Desafios

<li> Desafio 1 - WebScraping</li>
     <br>
   <p>Aplicando os conceitos de WebScraping, utilizando a biblioteca BeautifulSoup, o projeto se encontra na pasta **WebScraping**, contendo todos os códigos que foram utilizados para resolver o problema.</p>
   
 ```
cd WebScraping/
```

 ```
py scraping.py
```


<li> Desafio 2 - Transformar Dados</li>
     <br>
   <p>Ao utilizar a biblioteca ZipFile, foi realizado o processo de transformação dos dados, convertendo arquivos .pdf para .csv, além de substituir palavras dentro de um arquivo .csv, por fim, compactando todos os arquivos no formato .zip</p>

```
  cd transformData/

```

```
  py transformData.py
  
```
 
   
<li> Desafio 3 - Banco de Dados</li>
     <br>
   <p>Realizado o load de dados .csv dentro de uma estrutura de um banco relacional, utilizando o MariaDB para realizar os testes locais. Criado o Schema do banco  com as devidas tabelas para suportar a migração dos dados .csv. Além disso, realizado as consultas para responder as perguntas solicitidas e gerando os valores esperados a partir dos dados obtidos.</p>

```
  cd Schema/
  
```
   
   
<li> Desafio 4 - API</li>
     <br>
   <p>Criado uma interface web simples utilizando Vue, para apresentar os dados obtidos da base de dados, utilizando o Flask, para criar a modelagem e inserções no banco de dados local</p>
   
```
  cd API/backend
  
```
   <div align="center">
   <img width="550" src="https://user-images.githubusercontent.com/61792159/214106987-b01b60f5-3cfd-4c0c-878c-30ac7945f84f.png" alt="Arquitetura-Tecnica-webScraping" />
  </div>
  <br>
<p>Iniciar o projeto Vue</p>

```
  cd API/frontend
  
```

```
  npm install
  
```

```
  npm run serve
  
```



## 🚀 Features

- [x] Realizar Download de arquivos
- [x] Importar dados Banco de Dados
- [x] Ler arquivos .csv
- [x] Requisições GET


## 🚀 Boas Praticas

<h2>Gestão e Metodologia</h2>
<li>Foi utilizado o sistema de issues do github para gerenciar o projeto, garantindo o melhor entendimento e melhor acompanhamento. </li>
<br>

<div align="center">
<img  width="700" height="250" src="https://user-images.githubusercontent.com/61792159/214111722-f8978601-ebce-46cc-a910-39de5c6c70f3.png" alt="Arquitetura-Tecnica-webScraping" />
</div>
<br>
<li>Foi realizado a padronização de commits do projeto, garantindo o desenvolvimento contínuo, melhor entendimento das mudanças realizadas ao longo da codificação</li>
<br>

```
template: testName/feature/featureName/featureStatus

Exemplo: test04/feature/front end settings/finishing front end

```
<h2>Desenvolvimento</h2>
<li>Isolar responsabilidades em pequenas funções em um arquivo "modules", ao criar arquivos independentes, garantimos a manuntenção futura do projeto ou incrementos</li>

```
def zip_files(files: list[str], dest):
    
    with ZipFile(dest, "w") as zip_:
        print(f"Argupando em: {os.path.abspath(dest)}")
        for file in files:
            zip_.write(file, file.split("/")[-1])
            
  ```
  ```
        modules.zip_files(files_path, path + "deivid.zip")
  ```


<li>Organizando o projeto em pastas independente</li>
<br>
<div align="center">
<img  width="250" height="300" src="https://user-images.githubusercontent.com/61792159/214113527-c57bb6ba-f26a-4e16-a274-b61e0be2b923.png" alt="Arquitetura-Tecnica-webScraping" />
</div>

## 🚀 Contato

<img  width="100" height="100" src="https://user-images.githubusercontent.com/61792159/214099732-d4ee7bba-8837-4ac5-88e5-fb6d2b1c1e6e.jpg" alt="Arquitetura-Tecnica-webScraping" />


<li><a href="https://www.linkedin.com/in/deivid-almeida-378ab9191/" target="_blank">Linkedin</a></li>
<li><a href="https://medium.com/@deividalmeida365" target="_blank">Medium (Meu Blog)</a></li>
<li><a href="https://www.youtube.com/@jovemcode5199/featured" target="_blank">Youtube</a></li>
