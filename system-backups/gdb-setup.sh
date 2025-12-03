#!/bin/bash

# I use this environment in my cybersecurity class and
# I didn't want to type every command or search the internet every time, just in case

# install dependencies (Debian/Ubuntu)
sudo apt update
sudo apt install -y git python3-dev gdb

# clone and install pwndbg
git clone https://github.com/pwndbg/pwndbg.git ~/pwndbg
cd ~/pwndbg
./setup.sh
