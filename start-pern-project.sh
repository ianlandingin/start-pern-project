#!/bin/bash


next_line (){
  echo ""
}

echo "In what environment are you running this script?
(1 - Windows; 2 - Linux/WSL(Suggested);): "
read -r OS
next_line
if [ $OS = 1 ]; then
  clear
  echo Running in Windows...
  next_line
elif [ $OS = 2 ]; then
  clear
  echo Running in Linux...
  next_line
else
  clear
  echo "Please only run in Windows or Linux(WSL) environment.
Mac or Other operating system is not yet available."
  next_line
  exit 1
fi



IS_INSTALLED=0

while [ $IS_INSTALLED -eq 0 ]
do
echo "We will be starting our PERN project.
But before we do, make sure you have installed the following:
- Postgresql 15 or later.
- and, Latest version of Node.js
Do you have them installed?(Y/n): "
read -r INSTALLED

echo "$INSTALLED"


if [ "${INSTALLED,,}" == "y" ]
then
  clear
  echo "Great! Let's start..."
  next_line
  ((IS_INSTALLED++))
elif [ "${INSTALLED,,}" == "n" ]
then
  clear
  echo "Please intall Node and Postgres thru their official websites"
  next_line
  exit 0
else
  clear
  echo "Please answer with y or n (CTRL+C to exit)"
  next_line
fi
done


echo "New database name?: "
read -r DB_NAME

echo "New psql user for database?: "
read -r DB_USER

echo "Password: "
read -rs PASSWORD
echo "Repeat password: "
read -rs RE_PASSWORD

echo "Do you need multiple tables for this project?(Y/n): "

