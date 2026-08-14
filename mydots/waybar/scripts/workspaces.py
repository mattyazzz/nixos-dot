#!/usr/bin/env python3

import os
import json

with open('workspaces.json', "r") as archivo:
    datos=json.load(archivo)

if "workspace" in datos== "1":
    print("estoy en el workspace 1")

# ======================================================
# si alguien lee esto, que sepa que cordura ya no tengo
# cordura = 0
# se creo el json? = no
# me quiero morir? = si
# ======================================================
