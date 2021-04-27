#!/bin/sh
# script notes to run on webhost to install python and required packages
# call via ./install_python.sh after chmodding +x

echo "Installing Python to dev subfolder..."

mkdir dev
cd dev

wget --no-check-certificate http://www.python.org/ftp/python/3.3.3/Python-3.3.3.tgz

tar -xzvf Python-3.3.3.tgz
cd Python-3.3.3
./configure –prefix=$HOME/dev
make && make install

curl http://peak.telecommunity.com/dist/virtual-python.py | $HOME/dev/bin/python3.3

curl http://peak.telecommunity.com/dist/ez_setup.py | $HOME/bin/python3.3

# Check the installation
cd ~/bin
ls

# may need = cp /home/acute/dev/bin/python3.3 /home/acute/bin

#Add the following line to  ~/.bash_profile file: 
$PATH=$HOME/bin:$PATH

#Compile the changes: 
source ~/.bash_profile

# install PIP (get correct version)
/home/acute/bin/easy_install-2.6 pip

# install Flask
pip install Flask
