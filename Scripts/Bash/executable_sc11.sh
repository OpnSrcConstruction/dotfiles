#!/bin/bash
# check if test1.txt file exists...
if [ -f test1.txt ]; then
	echo "test1.txt exists. Continue processing."
else
	echo "test1.txt doesn't exist. Check temp directory."
	if [ -d temp ]; then
	echo "Temp directory exists. Create test1.txt in temp."
	

	touch temp/test1.txt
else
	echo "Temp directory does not exits. Is there a sym link there?"
	
	if [ -s sym-link ]; then
		echo "Symbolic link exists, so it's all good."
	else
		echo "Symbolic link doesn't exist, so it's time to bail"
		exit 2
		fi
	fi
fi
