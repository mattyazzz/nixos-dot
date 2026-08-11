#!/usr/bin/env bash

# ===========================================================================
# este script esta hecho para mostrar y cambiar entre workspaces en waybar ==
# porque waybar no tiene soporte nativo para workspaces en qtile           ==
# ===========================================================================

export PATH="/run/current-system/sw/bin:$PATH"

current=$(qtile cmd-obj -o group -f info | jq -r '.name')

for i in {1..9}; do
    if [ "$i" = "$current" ]; then
        printf " "
    else
        printf " "
    fi
done