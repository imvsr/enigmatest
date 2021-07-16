#!/bin/bash
########<<<<Welcome to my Script>>>############
firstline=$(head -1 ./source/changelog.md)
#echo $firstline

read -a splitfirstline <<< $firstline
#using -a will convert the string to arrays.

version=${splitfirstline[1]}
echo -e "You are using Version $version \nDo you want to continue with this Version? ⏰⏰";
echo 'Enter 1 to continue, 0 to exit' ;
read versioncontinue

if [ $versioncontinue == 1 ]
  then
     for listed in `ls ./source`
     # alternatively ->
     # for listed in $(ls ./source)
     do 
    
    
     if [ $listed == "secretinfo.md" ]
      then 
      sed 's/42/XX/g' ./source/$listed > ./build/secretinfo.md
      echo "Copying" $listed
       else echo 'Copying' $listed &
      (cp -p ./source/$listed ./build/) 
      fi
     done;
     echo "Do you want to gzip the files in the destination? (Y/N)"
     read yon
     if [ ${yon^^} == Y ]
#use '${Y^^}' for convert all CAPS.
#use  '${Y,,}' for convert all lowercase.  
     then echo "$(tar --exclude=".*" -zcvf build.tar.gz build )" 
## used --exclude to avoid hidden files beginning with '.' to be escaped.

#using "double quotes" avoids 'field-splitting'

#"$(cd build ; ls -lr)"  --- alternative
      
      elif [ $yon == N ]
      then echo "Okay"
# use : (colon) for - do nothing after else/elif 
      else
      echo "Invalid input!"
      fi   
else
     echo "comeback when you're ready"
fi

echo -e "Build version $version contains the files,\n $(ls ./build/) "