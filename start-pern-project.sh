#!/bin/bash


next_line (){
  echo ""
}

echo "In what environment are you running this script?
(1 - Windows; 2 - Linux/WSL(Suggested);): "
read -rn 1 OS
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
read -rn 1 INSTALLED

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

PROJECT=0
while [ $PROJECT -eq 0 ]
do
  read -rp "What should we name the project? (ex. no-spaces, No-Spaces): " PROJECT_NAME
  # Remove any whitespace
  PROJECT_NAME="${PROJECT_NAME// }"

  if [ ! "${PROJECT_NAME,,}" ]; then
  clear
  echo "Please put a project name"
  next_line
  else
    echo "Project name: $PROJECT_NAME"
    ((PROJECT++))
  fi
done

DATABASE=0
while [ $DATABASE -eq 0 ]
do
  read -rp "New Database name?: " DATABASE_NAME
  # Remove any whitespace
  DATABASE_NAME="${DATABASE_NAME// }"

  if [ ! "${DATABASE_NAME,,}" ]; then
  echo "Please put your database name"
  else
    echo "Database name: $DATABASE_NAME"
    ((DATABASE++))
  fi
done

USER=0
while [ $USER -eq 0 ]
do
  read -rp "New psql user for database?: " DATABASE_USER
  # Remove any whitespace
  DATABASE_USER="${DATABASE_USER// }"

  if [ ! "${DATABASE_USER,,}" ]; then
  echo "Please put your username"
  else
    echo "Username name: $DATABASE_USER"
    ((USER++))
  fi
done

PASS_MATCH=0
while [ $PASS_MATCH -eq 0 ]
do

  PASS=0
  while [ $PASS -eq 0 ]
  do
    read -rsp "Password: " PASSWORD
    # Remove any whitespace
    PASSWORD="${PASSWORD// }"

    if [ ! "${PASSWORD,,}" ]; then
    echo "Please put your password"
    else
      next_line
      ((PASS++))
    fi
  done

  RE_PASS=0
  while [ $RE_PASS -eq 0 ]
  do
    read -rsp "Repeat password: " RE_PASSWORD
    # Remove any whitespace
    RE_PASSWORD="${RE_PASSWORD// }"

    if [ ! "${RE_PASSWORD,,}" ]; then
    echo "Please put your password"
    else
      next_line
      ((RE_PASS++))
    fi
  done

  if [ "${PASSWORD,,}" == "${RE_PASSWORD,,}" ]
  then
    ((PASS_MATCH++))
  else
    next_line
    echo "Passwords doesn't match."
  fi
done



# echo "Do you need multiple tables for this project?(Y/n): "


