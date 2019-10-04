# softether-install
SoftEther VPN (Development branch) install script for CentOS 7

## What it does
Install SoftEther VPN on a fresh CentOS 7 VPS. Opens the necessary ports and set it as a startup service. Use **GCC-7** to build

## Usage
1. Push the two Shell Scripts to your server into the same folder
2. ```chmod +x softether-install.sh```
3. ```sudo ./softether-install.sh```
4. Reboot
5. Check status using ```systemctl status softether-vpnserver```
6. Use SE-VPN Server Manager to config your VPN

## Updating

```bash
su -
cd ~/SoftEtherVPN
git pull
scl enable devtoolset-7 bash
./configure
cd tmp
make
make install
reboot
```

## Motivation
The Official installation guide is somewhat outdated and unneccessarily complicated. In particualr, an updated CentOS 7 now have firewalld enabled by default, and would reset the old iptable-based rules. Startup script is actually provided using the systemd facility, voiding the need to generate your own init script. 

## Caution
* If you use LetsEncrypt in the same server, shut down SE-Server before getting a new license or renewing. Port 443 is in conflict.
* Client: Use OpenVPN's client. SE-Client for Windows has nasty **DNS-leak issue** that seems never fixed. (Actually a Windows problem)
* This script makes use of the **Development branch repo** and build in **Release Mode**
* This script replaces "cmake" with "cmake3" in the configure script
* A lot of changes happened in 2018, likely break sooner or later

## Hidden Trick
By default, some functions are disabled if you install SoftEther on Japan or China servers. Notably, the __static routing table__ pushing feature. You can get around it by editing the function ```SiIsEnterpriseFunctionsRestrictedOnOpenSource()``` in ```Cedar/Server.c``` than re-compile.
