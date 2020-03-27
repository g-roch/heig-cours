#!/bin/bash

DIRCOURS=cours

DATA=""

# A POSIX variable
OPTIND=1         # Reset in case getopts has been used previously in the shell.

# Initialize our own variables:
directory=cours
auto=0
future=0
todo=0

while getopts "h?ad:ft" opt; do
    case "$opt" in
    h|\?)
        echo "USAGE : ./delai.sh [-a] [-d directory] [-f] [-t]"
	echo "   -a      automatic mode (don't display date of today)"
	echo "   -d dir  directory to scan"
	echo "   -f      show only future"
	echo "   -t      show only not completed"
        exit 0
        ;;
    a)  auto=1
        ;;
    d)  directory=$OPTARG
        ;;
    f)  future=1
        ;;
    t)  todo=1
        ;;
    esac
done


for cours in $(ls cours)
do
	## Add parsing of README.md section Délai
	DATA+=$(sed -r -f delai.sed $directory/$cours/README.md 2> /dev/null \
		| sed -e "s/\$cours/$cours/g")
done

if [ $auto -eq 0 -o $future -eq 1 ]
then
	DATA+="
"
	DATA+="$(date +%F)== TODAY ==================="
fi

DATA="$(echo "$DATA" | sed -n -e '/./p' | sort)"

if [ $future -eq 1 ]
then
	DATA="$(echo "$DATA" | sed -n -e '/^[0-9-]\+== TODAY/,$p')"
fi

if [ $todo -eq 1 ]
then
	DATA="$(echo "$DATA" | sed -e '/^[0-9-]\+ [^ ]* \[Completed *\]/d')"
fi

if [ $auto -eq 1 ]
then
	DATA="$(echo "$DATA" | sed -e '/^[0-9-]\+== TODAY/d')"
fi

echo "$DATA"

