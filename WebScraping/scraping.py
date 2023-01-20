## Importing libs to support the project
import os
import re

import requests
from bs4 import BeautifulSoup

## importing modules to support the scraping process

import modules

url = "https://www.gov.br/ans/pt-br/assuntos/consumidor/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude";


### Inciando o processo de scraping

def scraping():

    path = modules.downloadPath()
    page = requests.get(url)
    
    soup = BeautifulSoup(page.content, 'html.parser')

    ## For para pegar os elementos html de todos os documentos que serão baixados

    getAllFiles = [
        
        link["href"] for link in soup.find_all(
        name = "a",
        href = True,
        text = re.compile("Anexo"))

        ]


    files_path = modules.download_files(getAllFiles, path)

    ## Compactar todos os arquivos baixados

    modules.zip_files(files_path, path + "deivid.zip")
    
    ## modules.cleanup(files_path)




## Chamando a função scraping, principal do projeto

if __name__ == '__main__':
    scraping()