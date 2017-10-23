#!/bin/bash

set -x

dig www.google.com
nslookup -debug www.google.com
sleep 5

dig www.umdearborn.edu
nslookup -debug www.umdearborn.edu
sleep 5

dig www.umich.edu
nslookup -debug www.umich.edu
sleep 5

dig weblogin.umich.edu
nslookup -debug weblogin.umich.edu
sleep 5

echo "now we know this works"
dig weblogin.umich.edu @8.8.8.8

echo 141.211.243.174 == weblogin.mc.itd.umich.edu == weblogin.umich.edu
traceroute 141.211.243.174
