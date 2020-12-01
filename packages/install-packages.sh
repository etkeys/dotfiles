#!/usr/bin/env bash

mapfile -t packages -u "${1:-/dev/stdin}"

total=${#packages[*]}

for ((i=0; i < ${#packages[*]}; i++));
do
    IFS=, read prov pack addcmd <<< "${packages[i]}"
    echo -n "($((i+1))/$total) $pack "
    case "$prov" in
        "apt" ) echo "apt-get install -y $addcmd $pack" ;;
        "pip" ) echo "yes | pip install -q $pack" ;;
        "snap" ) echo "snap install $pack $addcmd" ;;
        * ) 1>&2 echo "Unknown package provider '$prov'." ;;
    esac
done
