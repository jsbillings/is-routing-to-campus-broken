#!/bin/bash

set -x

echo "This works with google"
dig www.google.com
nslookup -debug www.google.com
sleep 5

echo "This works with UM Dearborn"
dig www.umdearborn.edu
nslookup -debug www.umdearborn.edu
sleep 5

echo "This doesn't work with umich.edu hosts"
dig weblogin.umich.edu
nslookup -debug weblogin.umich.edu
sleep 5

echo "now we know this works with Google's DNS"
dig weblogin.umich.edu @8.8.8.8
nslookup -debug weblogin.umich.edu 8.8.8.8

echo "And we know we can reach campus by IP"
echo 141.211.243.174 == weblogin.mc.itd.umich.edu == weblogin.umich.edu
traceroute 141.211.243.174

echo "And Web traffic can pass"
curl -v -k --head https://141.211.243.174/
