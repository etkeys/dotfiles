#!/usr/bin/env bash

mapfile -t packages -u "${1:-/dev/stdin}"

total=${#packages[*]}

for ((i=0; i < ${#packages[*]}; i++));
do
    IFS=, read prov pack addcmd <<< "${packages[i]}"
    echo -n "($((i+1))/$total) $pack "
    case "$prov" in
        "apt" ) apt-get install -y $addcmd $pack > /dev/null ;;
        "pip" ) yes | pip install -q $pack > /dev/null ;;
        "snap" ) snap install $pack $addcmd > /dev/null ;;
        * ) 1>&2 echo "Unknown package provider '$prov'." ;;
    esac
done
