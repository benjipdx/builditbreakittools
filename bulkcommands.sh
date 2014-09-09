#! /bin/bash

#run like this
#must run in the directory that logappend and logread are in
#./bulkcommands logread bulkfile
#./bulkcommands logappend bulkfile
#$1 is logread/logappend
#$2 is bulkfile

while read line
do
    echo ""
    echo "running ./$1 $line"
    echo -n  "stdout: " #print stdout, if there is only stderr, the line will loook like:
    #stdout: stderr: security error, because there isnt a newline printed with that echo
    { output=$(./$1 $line 2>&1 1>&3-) ;} 3>&1 #let stdout through, capture stderr  
    echo "stderr: $output" #then print the stderr
    echo "return code was $?"
done < $2
