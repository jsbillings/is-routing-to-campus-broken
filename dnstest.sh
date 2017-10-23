#!/bin/bash

set -x

echo "This works with google"
dig +trace www.google.com

echo "This works with UM Dearborn"
dig +trace www.umdearborn.edu

echo "This doesn't work with umich.edu hosts"
dig +trace weblogin.umich.edu

echo "now we know this works with Google's DNS"
dig +trace weblogin.umich.edu @8.8.8.8
nslookup -debug weblogin.umich.edu 8.8.8.8

echo "And we know we can reach campus by IP"
echo 141.211.243.174 == weblogin.mc.itd.umich.edu == weblogin.umich.edu
traceroute 141.211.243.174

echo "And Web traffic can pass"
curl -v -k --head https://141.211.243.174/

echo "Can it not talk to the umich.edu DNS servers?"
dig umich.edu ns @8.8.8.8
traceroute 192.12.80.222 # dns2.itd.umich.edu.
traceroute 192.12.80.214 # dns1.itd.umich.edu.
traceroute 128.105.2.10  # dns.cs.wisc.edu.
