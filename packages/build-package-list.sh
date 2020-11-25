#!/usr/bin/env sh

awk \
    --assign mach=";?(any|$HOSTNAME|$HOSTCAT);?" \
    --field-separator , \
    '$1 ~ /^(apt|pip|snap)/ && $3 ~ mach {print $1,$2,$4;}' \
    packages.master.csv
