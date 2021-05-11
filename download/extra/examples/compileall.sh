#!/bin/sh

for f in *.z
do
    echo "> Compiling $f to ${f%.*}"
	zcc $f ${f%.*} -c -elf32
done

echo "> Ok!\n"
