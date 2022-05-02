#!/bin/bash
clear
echo "How many characters you would like the password to have?"
read i
echo "Password is:"
strings /dev/urandom | grep -o '[[:alnum:]]' | head -n $i | tr -d '\n'
