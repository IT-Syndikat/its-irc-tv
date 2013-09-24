#!/bin/bash

stty -F /dev/ttyACM0 115200
exec 3<> /dev/ttyACM0
cd /home/guest/
ii -n its-tv -s irc.freenode.net &
cd /home/guest/irc/irc.freenode.net/
sleep 2
echo "/j #itsyndikat" > in
sleep 2
cd /home/guest/irc/irc.freenode.net/\#itsyndikat/
tail -n 1 -f out | sed -e 's/^[0-9\-]* //' >&3 &
