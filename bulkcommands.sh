#! /bin/sh

#run like this
#must run in the directory that logappend and logread are in
#./bulkcommands logread bulkfile
#./bulkcommands logappend bulkfile

while read line
do
    echo "running ./$1 $line"
    ./$1 $line
done < $2
