import tabula
from zipfile import ZipFile, ZIP_DEFLATED

## acessar anexo do pdf baixado


zip = ZipFile("../files/deivid.zip", "r")

zip.extract("Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536_RN537_RN538_RN539_RN541_RN542_RN544_546.pdf")
zip.close()

pdf_path = "Anexo_I_Rol_2021RN_465.2021_RN473_RN478_RN480_RN513_RN536_RN537_RN538_RN539_RN541_RN542_RN544_546.pdf"

tabula.convert_into(pdf_path, "deivid.csv", output_format="csv", pages="all")


csv = open("deivid.csv")

lerLinhas = csv.readlines()

for lerLinha in lerLinhas:
    lerLinha.replace("OD", "Seg. Odontológica")
    lerLinha.replace("AMB", "Seg. Ambulatorial")


csv.writelines(lerLinhas)
csv.close()