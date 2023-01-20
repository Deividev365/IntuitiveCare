import tabula
from zipfile import ZipFile, ZIP_DEFLATED
## acessar anexo do pdf baixado



zip = ZipFile('files/deivid.zip', 'r')
zip.extract("Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536_RN537_RN538_RN539_RN541_RN542_RN544_546.pdf")
zip.close()


pdf_path = "Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536_RN537_RN538_RN539_RN541_RN542_RN544_546.pdf"


tabula.convert_into(pdf_path, "deivid.csv", output_format="csv", pages="all", stream=True)


csv = open("deivid.csv", mode="r+")
linhas = csv.readlines()

for linha in linhas:
    linha.replace("OD", "Seg. Odontológica")
    linha.replace("AMB", "Seg. Ambulatorial")
csv.writelines(linhas)
csv.close()


zip = ZipFile("deividv2.zip", "w", compression=ZIP_DEFLATED)
zip.write("deivid.csv")
zip.close()