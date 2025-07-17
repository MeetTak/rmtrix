#!/bin/zsh

args=("$@")
sudo find / -iname "*${args[1]}*" 2>/dev/null