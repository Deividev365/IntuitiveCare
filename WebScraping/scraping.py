## Importing libs to support the project

import re
import requests
from bs4 import BeautifulSoup

## importing modules to support the scraping process

import modules

url = "https://www.gov.br/ans/pt-br/assuntos/consumidor/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude";


### Starting process of scraping

def scraping():

    path = modules.downloadPath()
    page = requests.get(url)
    
    soup = BeautifulSoup(page.content, 'html.parser')

    ### Loop to get all the html documents elements that will be downloaded

    getAllFiles = [
        
        link["href"] for link in soup.find_all(
        name = "a",
        href = True,
        text = re.compile("Anexo"))

        ]

    ### setting up 
    files_path = modules.download_files(getAllFiles, path)

    ### Compress all downloaded files

    modules.zip_files(files_path, path + "deivid.zip")
    
    ## modules.cleanup(files_path)




## Calling the scraping function, the main part of the project

if __name__ == '__main__':
    scraping()