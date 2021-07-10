#!/bin/bash
########<<<<Welcome to my Script>>>############
firstline=$(head -1 ./source/changelog.md)
echo $firstline

read -a splitfirstline <<< $firstline


version=${splitfirstline[1]}
echo -e "You are using Version $version \nDo you want to continue with this Version?";
echo 'Enter 1 to continue, 0 to exit' ;
read versioncontinue

if [ $versioncontinue == 1 ]
  then
     listed=$(ls ./source) 
     echo "$listed"
else
     echo "comeback when you're ready!"
fi



##this script tells you the version of a program by taking in the input from a file.