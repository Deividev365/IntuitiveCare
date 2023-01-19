
## Importing libs to support the project

import os
import re

import requests
from bs4 import BeautifulSoup

from WebScraping import saveFiles



url = "https://www.gov.br/ans/pt-br/assuntos/consumidor/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude";



    
    
def scraping():

    path = saveFiles.getDownloadPath()
    page = requests.get(url);
    soup = BeautifulSoup(page.content, 'html.parser');
    getAllFiles = [link["href"] for link in soup.find_all(name="a", href=True, text=re.compile("Anexo"))];



    files_path = download_files(getAllFiles, path)


    saveFiles.zip_files(files_path, path + "test1.zip")

    saveFiles.cleanup(files_path)



    
if __name__ == '__main__':
    scraping()