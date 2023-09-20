#!/bin/bash
# copies a list of Argument-ative files,
# to a different file, w/ the backup extension.
for file in $*
do
  cp $file{,.backup}
  ls -l $file.backup
done
