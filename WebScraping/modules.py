import os
from zipfile import ZipFile
import requests



def downloadPath():

    if os.path.exists("files"):

        return "files/"

    if os.path.exists("../files"):

        return "../files/"

    return "./"


def download_files(getAllFiles: list[str], path) -> list[str]:

    files = []

    for getFile in getAllFiles:

        file_name = path + getFile.split("/")[-1]

        print(f"Realizando o Download dos arquivos...: {getFile}")
        save(requests.get(getFile, stream=True), file_name)
        files.append(file_name)

    return files
    


def save(request: requests.Response, file_path: str):
   
    with open(file_path, 'wb') as fd:
        for chunk in request.iter_content(chunk_size = 256):
            fd.write(chunk)



def zip_files(files: list[str], dest):
    
    with ZipFile(dest, "w") as zip_:
        print(f"Argupando em: {os.path.abspath(dest)}")
        for file in files:
            zip_.write(file, file.split("/")[-1])







def cleanup(files):

    for file in files:
        os.remove(file)