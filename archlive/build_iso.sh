#!/bin/bash

if [ ! -d /tmp/archiso ]; then
	mkdir -v /tmp/archiso
else
	echo "/tmp/archiso/ already exists"
	echo "Erasing and creating /tmp/archiso/"
	sudo rm -vrf /tmp/archiso
	mkdir -v /tmp/archiso
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
sudo mkarchiso -v -w /tmp/archiso/ -o ../archISO/ .
