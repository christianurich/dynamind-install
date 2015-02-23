#!/bin/shell
sudo apt-add-repository -y ppa:ubuntugis/ubuntugis-unstable
sudo apt-get install git
sudo apt-get update
sudo apt-get -y install build-essential cmake git swig qt4-dev-tools python-dev python-pip libgdal1-dev libcgal-dev libqglviewer-dev libboost-system-dev libboost-graph-dev python-numpy python-scipy python-gdal python-matplotlib python-netcdf

sudo pip install reimport

sudo pip install netCDF4

sudo pip install -r requirements.txt

#install SFCGAL
wget https://github.com/Oslandia/SFCGAL/archive/v1.0.5.zip
unzip v1.0.5.zip
cd SFCGAL-1.0.5/
cmake . && make && sudo make install
cd ..
#rm -rf SFCGAL-1.0/
rm v1.0.5.zip

git clone git://github.com/iut-ibk/DynaMind-ToolBox.git

cd DynaMind-ToolBox/

#git checkout unstable 

git submodule update --init --recursive

mkdir build

cd build/

cmake -DWITH_PLUGIN_GDALMODULE=TRUE ..

make