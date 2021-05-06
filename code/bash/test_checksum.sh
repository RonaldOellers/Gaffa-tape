#!/bin/bash

#ask for input files
read -e -p "First File: " file1
read -e -p "Second File: " file2

file1=$file1
file2=$file2

echo "the Files $file1 and $file2 will be compared"

#make md5checksum for both files
checksum1=`md5sum --tag $file1 |tail -c 32`
checksum2=`md5sum --tag $file2 |tail -c 32`

echo "checksum1 $checksum1  |  checksum2 $checksum2"

if [[ "$checksum1" == "$checksum2" ]]; then
	echo "Checksums are identical!"
else
	echo "Checksums are non identical!"
fi
