#!/bin/bash

set -e
set -x

sudo add-apt-repository -y ppa:deadsnakes/ppa
sudo apt-get -y update

sudo apt-get install python3.3 python3.3-dev

sudo pip install virtualenv

virtualenv ~/.venv
source ~/.venv/bin/activate
pip install tox coveralls
