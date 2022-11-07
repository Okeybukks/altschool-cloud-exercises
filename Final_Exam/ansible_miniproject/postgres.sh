#!/bin/bash

sudo apt update && sudo apt upgrade -y

sudo apt install wget -y 

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

sudo wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo apt update -y


sudo apt -y install postgresql-13

sudo su postgres <<EOF

psql -c "alter user postgres with password 'Pa55w@rd';"

psql -c "CREATE DATABASE testdb;"

psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant';"

psql -c "GRANT ALL PRIVILEGES ON DATABASE testdb TO vagrant;"

EOF
