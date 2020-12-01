#!/usr/bin/env bash

THIS_HOST="${1:-$HOSTNAME}"
HOST_CAT="${HOSTCAT:-host-category-unset}"
HOST_PATTERN=";?(any|$THIS_HOST|$HOST_CAT);?"

awk \
    --assign HOSTS="$HOST_PATTERN" \
    --field-separator , \
    '$1 ~ /^(apt|pip|snap)/ && $3 ~ HOSTS {print $1","$2","$4;}' \
    packages.master.csv
