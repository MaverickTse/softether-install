#!/bin/bash
cd $HOME
if [[ ! -d "SoftEtherVPN" ]]; then
    git clone https://github.com/SoftEtherVPN/SoftEtherVPN.git || exit $?
fi
cd SoftEtherVPN
git submodule update --init --recursive
git pull || exit $?

yum -y install cmake3 readline-devel ncurses-devel openssl-devel
sed -i.bak 's/cmake/cmake3/g' configure
./configure
cd tmp
make || exit $?
make install || exit $?
