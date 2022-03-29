#!/bin/bash



# DESCRIPTION
# Simple bash script to boot up or shut down XAMPP Apache and MySQL. Requires SUDO.
# Give either 'start' or 'stop' as input.

# SYNTAX : xampp-db.sh [start || stop]



# Check if XAMPP is installed (in expected location).

XAMPP=/opt/lampp/xampp

if (! command -v $XAMPP &> /dev/null)
then
  echo "XAMPP executable not found in expected path $XAMPP"
  exit 1
fi


# Check if a valid argument was given

ARG=$1

if [ $# -eq 0 ]
then
  echo "No arguments supplied, expected 'start' or 'stop'"
  exit 1


# Run XAMPP

elif [ "$ARG" == "start" ]
then
  sudo $XAMPP startapache 2> /dev/null
  sudo $XAMPP startmysql 2> /dev/null
  exit

elif [ "$ARG" == "stop" ]
then
  sudo $XAMPP stopmysql
  sudo $XAMPP stopapache
  exit

else
  echo "Invalid arguments, expected 'start' or 'stop'"
  exit 1

fi
