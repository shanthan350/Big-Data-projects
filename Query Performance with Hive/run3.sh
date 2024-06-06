#!/bin/bash
#creating table using ddl3.hive 
hive -f ddl3.hive -hivevar name=$1
if [ $? -eq 0 ];
then
  #loading all .csv files into the table --- load3.hive
  hive -f load.hive -hivevar name=$1 -hivevar path=$(pwd)
  if [ $? -eq 0 ];
  then
    #quering using select keyword ---dql3.hive
    hive -f dql3.hive -hivevar name=$1 
	 	   
  else
    echo "The command failed1."
    exit 1	
  fi
else
  echo "The command failed2."
  exit 1
fi


