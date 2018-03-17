# softether-install
SoftEther VPN (Development branch) install script for CentOS 7

## What it does
Install SoftEther VPN on a fresh CentOS 7 VPS. Opens the necessary ports and set it as a startup service. Use **GCC-7** to build

## Usage
1. Push the two Shell Scripts to your server into the same folder
2. ```chmod +x softether-install.sh```
3. ```sudo ./softher-install.sh```
4. Reboot
5. Use SE-VPN Server Manager to config your VPN

## Updating

```bash
su -
cd ~/SoftEtherVPN
git pull
scl enable devtoolset-7 bash
./configure
export DEBUG="NO"
make
make install
reboot
```

## Motivation
The Official installation guide is somewhat outdated and unneccessarily complicated. In particualr, an updated CentOS 7 now have firewalld enabled by default, and would reset the old iptable-based rules. Startup script is actually provided using the systemd facility, voiding the need to generate your own init script. (The provided .service file need some patch however, with a single line of sed)

## Caution
This script makes use of the **Development branch repo** and build in **Release Mode**
