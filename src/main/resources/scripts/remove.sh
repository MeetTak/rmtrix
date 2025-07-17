#!/bin/zsh

args=("$@")
sudo find / -iname "*${args[1]}*" -exec rm -rf {} + 2>/dev/null