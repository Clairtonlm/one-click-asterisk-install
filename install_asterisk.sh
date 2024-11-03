#!/bin/bash

echo "Step 1: Updating package list 🛠️"
sudo apt-get update

echo "Step 2: Installing dependencies 📦"
sudo apt-get install -y bison wget openssl libssl-dev libasound2-dev libc6-dev libxml2-dev libsqlite3-dev \
libnewt-dev libncurses5-dev zlib1g-dev gcc g++ make perl uuid-dev git subversion unixodbc-dev unixodbc autoconf \
libedit-dev

echo "Step 3: Downloading Asterisk source code 📥"
cd /usr/src
sudo wget https://downloads.asterisk.org/pub/telephony/asterisk/old-releases/asterisk-21.0.0.tar.gz
sudo tar -xzvf asterisk-21.0.0.tar.gz
cd asterisk-21.0.0

echo "Step 4: Configuring Asterisk 🔧"
sudo ./configure --with-jansson-bundled

echo "Step 6: Compiling Asterisk 🛠️"
sudo make

echo "Step 7: Installing Asterisk 📦"
sudo make install

echo "Step 8: Installing sample configuration files ⚙️"
sudo make samples  # This ensures the default configuration files are available

echo "Step 9: Starting Asterisk 🌟"
sudo asterisk

echo "Step 10: Connecting to Asterisk Console with high verbosity 🎛️"
# Connect to the Asterisk console with maximum verbosity
sudo asterisk -rvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
