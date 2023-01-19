
## Importing libs to support the project

import os
import re

import requests
from bs4 import BeautifulSoup

url = "https://www.gov.br/ans/pt-br/assuntos/consumidor/o-que-o-seu-plano-de-saude-deve-cobrir-1/o-que-e-o-rol-de-procedimentos-e-evento-em-saude"





##path = find_download_path()

page = requests.get(url);
soup = BeautifulSoup(page.content, 'html.parser');

getFiles = [link["href"] for link in soup.find_all(name="a", href=True, text=re.compile("Anexo"))];

print("Arquivos para realizar o donwload", getFiles);
