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
markdown=0

TAG_COMPELETED="Completed  "
TAG_TODO="To do      "
TAG_IN_PROGRESS="In progress"

SCRIPT_SED="/^## Todo$/,/^#/ {
	s/\\[x\\]/[$TAG_COMPELETED]/
	s/\\[ ?\\]/[$TAG_TODO]/
	s/\\[~\\]/[$TAG_IN_PROGRESS]/
	s/^ *[-\\*] *(\\[[^]]*\\]) *\`([^\`]*)\` *(.*)$/\\2 \$cours \\1 \\3/p
}
d"

while getopts "h?ad:ftm" opt; do
    case "$opt" in
    h|\?)
        echo "USAGE : ./todo-gen.sh [-a] [-d directory] [-f] [-t] [-m]"
	echo "   -a      automatic mode (don't display date of today)"
	echo "   -d dir  directory to scan"
	echo "   -f      show only future"
	echo "   -t      show only not completed"
	echo "   -m      format output in makrdown"
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
    m)  markdown=1
        ;;
    esac
done


for cours in $(ls cours)
do
	## Add parsing of README.md section Délai
	DATA+=$(sed -r -e "$SCRIPT_SED" $directory/$cours/README.md 2> /dev/null \
		| sed -e "s/\$cours/$cours/g")
	DATA+="
"
done

if [ $auto -eq 0 -o $future -eq 1 ]
then
	DATA+="
"
	DATA+="$(date +%F) == TODAY ==================="
fi

DATA="$(echo "$DATA" | sed -n -e '/./p' | sort)"

if [ $future -eq 1 ]
then
	DATA="$(echo "$DATA" | sed -n -e '/^[0-9-]\+ == TODAY/,$p')"
fi

if [ $todo -eq 1 ]
then
	DATA="$(echo "$DATA" | sed -e '/^[0-9-]\+ [^ ]* \[Completed *\]/d')"
fi

if [ $auto -eq 1 ]
then
	DATA="$(echo "$DATA" | sed -e '/^[0-9-]\+ == TODAY/d')"
fi

if [ $markdown -eq 1 ]
then
	SCRIPT_SED="s/^\([0-9-]\+\) \([^\[]\+\) \(\[[^]]\+\] \)\(.\+\)$/- \3\`\1\` **\2** \4/
	s/\[$TAG_COMPELETED\]/[x]/
	s/\[$TAG_TODO\]/[ ]/
	s/\[$TAG_IN_PROGRESS\]/[~]/
	
	"
	DATA="$(echo "$DATA" | sed -e "$SCRIPT_SED")"
fi

echo "$DATA"

