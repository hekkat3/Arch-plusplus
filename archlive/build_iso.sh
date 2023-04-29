#!/bin/bash

if [ ! -d ../tmp_work/ ]; then
	mkdir -v ../tmp_work/
else
	echo "../tmp_work/ already exists"
	echo "Erasing and creating ../tmp_work/"
	rm -vrf ../tmp_work/
	mkdir -v ../tmp_work/
fi

if [ ! -d ../archISO ]; then
	mkdir -v ../archISO
else
	echo "** ../archISO/ already exists **"
	echo "Erasing and creating ../archISO/"
	rm -vrf  ../archISO/
	mkdir -v ../archISO/
fi

echo "** creating ISO **"
sudo mkarchiso -v -w ../tmp_work/ -o ../archISO/ .
