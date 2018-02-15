#!/bin/bash
# This script runs stu in case it is installed, or creates a local binary from source, in case it isn't
build_stu() {
	cd stu_source
	./configure
	make
	cd ..
}

link_stu() {
	ln -s stu_source/stu
}

download_stu_source() {
	if ! which git>/dev/null; then
		echo "git not found, please install git first"
		exit 1
	fi
	git clone https://github.com/kunegis/stu stu_source
	if [ ! -e stu_source ]; then
		echo "cloning failed, aborting"
		exit 1
	fi
}

use_local_stu() {
	echo "checking current directory for stu binary"
	if [ ! -f ./stu ]; then
		echo " -> not found"
		download_stu_source
		build_stu
		link_stu
	else
		echo " -> found, using local stu binary"
	fi
	./stu
}

echo "checking path for stu"
if ! which stu>/dev/null ; then
	echo " -> not found"
	use_local_stu
else
	stu
fi
