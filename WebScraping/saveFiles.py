import os
from zipfile import ZipFile



def getDownloadPath():

    if os.path.exists("files") : 

        return "files/"

    if os.path.exists("../files") : 
        return "../files"
       
    return "./"