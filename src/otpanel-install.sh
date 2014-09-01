#!/bin/bash

sudo apt-get update;
sudo apt-get -y install git cmake build-essential liblua5.2-dev libgmp3-dev libmysqlclient-dev libboost-system-dev;
wget https://github.com/otservme/global1041/archive/master.zip
unzip master.zip -d /home/otserv/;
cd /home/otserv/global1041-master/;
mkdir build && cd build
cmake ..;
make;
cp tfs ../theforgottenserver;
cd ../;
chmod 777 theforgottenserver tfsAutoRestarter.sh;
chown -R www-data.www-data /home/otserv;
echo "Pronto, instalado com sucesso!"
