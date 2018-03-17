#!/bin/bash
cd $HOME
if [[ ! -d "SoftEtherVPN" ]]; then
    git clone https://github.com/SoftEtherVPN/SoftEtherVPN.git || exit $?
fi
cd SoftEtherVPN
git pull || exit $?

yum -y install readline-devel ncurses-devel openssl-devel
./configure
export DEBUG="NO"
make || exit $?
make install || exit $?
