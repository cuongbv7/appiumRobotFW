#!/bin/bash

# ./run-test.sh calculator 2

#error message
errormessage="*****************************************************\nInvalid Command!\n\nCOMMAND => ./run-test.sh [appium_server] [tag] [threads] e.g. ./run-test.sh calculator 2 \n*****************************************************\n"

# check argument tag
if [ "$1" = "" ] ;then
  echo -e "$errormessage"
  exit 1
else
  appium_server="$1"
fi

if [ "$2" = "" ] ;then
  echo -e "$errormessage"
  exit 1
else
  tag="-i $2 --exclude ignore"
fi

# How many thread
if [ "$3" = "" ] ;then
  echo -e "$errormessage"
  exit 1 
else
  thread="$3"
fi

# SETUP ENV
ENV="$tag src/scenario"

BASE_PORT=8817
INCREMENT=1

port=$BASE_PORT
isfree=$(netstat -taln | grep $port)

while [[ -n "$isfree" ]]; do
    port=$[port+INCREMENT]
    isfree=$(netstat -taln | grep $port)
done

PABOT_PORT=$port

#####################################################################################
#####################################################################################
echo
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo "=============================================================================="
echo "                           Running Automated Test "
echo "=============================================================================="
echo "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
echo 


#E.g. ./run-test.sh http://0.0.0.0:4444/wd/hub  search  2
pabot --pabotlibport $PABOT_PORT --testlevelsplit --pabotlib --resourcefile DevicesSet.dat --processes $thread -v appium_server:$appium_server  --outputdir reports  $ENV
# pabot --argumentfile1 first.txt --argumentfile2 second.txt [path to tests]
#pabot --pabotlibport $PABOT_PORT --testlevelsplit --pabotlib --argumentfile1 first.txt --argumentfile2 second.txt --argumentfile3 third.txt --processes $thread -v env:dev  --outputdir reports  $ENV