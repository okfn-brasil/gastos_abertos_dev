#!/usr/bin/env bash
echo 'Installing Postgres...'

echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

apt-get -y update && apt-get -y upgrade
apt-get install -y postgresql-9.4 postgresql-client-9.4 pgadmin3 postgresql-server-dev-9.4 libpq-dev postgresql-9.4-postgis-2.1

su - postgres -c "psql -U postgres -c \"CREATE USER gastosabertos WITH PASSWORD 'gastosabertos';\""
su - postgres -c 'psql -U postgres -c "CREATE DATABASE gastosabertos OWNER gastosabertos;"'
su - postgres -c 'psql -U postgres -d gastosabertos -c "CREATE EXTENSION postgis;"'
