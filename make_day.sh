#!/bin/sh

if [ $1 = "help" ]; then
    echo "make_day.sh [DAY] [SCRIPT_EXTENSION]"
    exit
fi;

mkdir day-$1/

cd day-$1/
touch day-$1.$2
touch day-$1-part2.$2
touch input.txt
