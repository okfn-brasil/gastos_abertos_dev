#!/usr/bin/env bash
echo 'Creating virtualenvs...'

export WORKON_HOME=/home/vagrant/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

CWD="$(pwd)"

cd ~/gastos_abertos
mkvirtualenv api && setvirtualenvproject $VIRTUAL_ENV $(pwd)

cd ~/gastos_abertos_website
mkvirtualenv website && setvirtualenvproject $VIRTUAL_ENV $(pwd)

cd ~/gastos_abertos_dados
mkvirtualenv dados && setvirtualenvproject $VIRTUAL_ENV $(pwd)


echo 'Configuring API...'

cd ~/gastos_abertos
workon api
python setup.py install

cp ~/gastos_abertos/settings/local_settings.py-example ~/gastos_abertos/settings/local_settings.py
sed -i -e 's/\/absolute\/path\/to\/bd/postgresql:\/\/gastosabertos:gastosabertos@localhost\/gastosabertos/g' ~/gastos_abertos/settings/local_settings.py

# TODO: move these deps to setup.py
pip install psycopg2
pip install xlrd

fab run_local reset initdb importdata generate_jsons


echo 'Configuring Website...'

cd ~/gastos_abertos_website
workon website
pip install -r requirements.txt

cp ~/gastos_abertos_website/settings/local_settings.py-example ~/gastos_abertos_website/settings/local_settings.py

fab run_local build_static


cd $CWD
