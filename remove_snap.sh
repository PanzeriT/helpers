#!/bin/bash

# stop snapd services
sudo systemctl stop snapd && sudo systemctl disable snapd

# purge snapd
sudo apt purge snapd

# remove no longer needed folders
rm -rf ~/snap
sudo rm -rf /snap /var/snap /var/lib/snapd /var/cache/snapd /usr/lib/snapd

# block future snap installations
sudo tee -a /etc/apt/preferences.d/no-snap.pref <<EOF
# To install snapd, specify its version with 'apt install snapd=VERSION'
# where VERSION is the version of the snapd package you want to install.
Package: snapd
Pin: release a=*
Pin-Priority: -10
EOF
sudo chown root:root /etc/apt/preferences.d/no-snap.pref
