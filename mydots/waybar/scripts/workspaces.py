#!/usr/bin/env python3

import os
import json

JSON_PATH = os.path.expanduser("~/.config/waybar/scripts/workspaces.json")

with open(JSON_PATH, "r") as archivo:
    datos=json.load(archivo)

if datos["workspace"] == "1":
    print("estoy en el workspace 1")

# ======================================================
# si alguien lee esto, que sepa que cordura ya no tengo
# cordura = 0
# se creo el json? = no
# me quiero morir? = si
# ======================================================
