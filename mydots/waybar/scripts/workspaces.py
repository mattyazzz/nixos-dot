#!/usr/bin/env python3

import os
import json

JSON_PATH = os.path.expanduser("~/.config/waybar/scripts/workspaces.json")

with open(JSON_PATH, "r") as archivo:
    datos=json.load(archivo)

workspace_actual = datos["workspace"]

workspaces = []

for workspace in "123456789":
    if workspace == workspace_actual:
        workspaces.append("●")
    else:
        workspaces.append("○")

print(" ".join(workspaces))

# ======================================================
# ya funciona, yey
# ======================================================
