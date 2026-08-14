import json

with open('workspaces.json', "r") as archivo:
    datos=json.load(archivo)

if "workspace" in datos== "1":
    print("estoy en el workspace 1")
