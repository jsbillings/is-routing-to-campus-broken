#!/bin/bash

set -x

echo "This works with google"
dig +trace www.google.com
sleep 5

echo "This works with UM Dearborn"
dig +trace www.umdearborn.edu
sleep 5

echo "This doesn't work with umich.edu hosts"
dig +trace weblogin.umich.edu
sleep 5

echo "now we know this works with Google's DNS"
dig +trace weblogin.umich.edu @8.8.8.8
sleep 5

echo "And Web traffic can pass"
curl -v -k --head https://141.211.243.174/
sleep 5

echo "Can it not talk to the umich.edu DNS servers?"
dig +trace umich.edu ns
sleep 5

echo "Try again against google DNS"
dig +trace umich.edu ns @8.8.8.8
sleep 5

echo "Trying to traceroute each NS for umich.edu"
traceroute 192.12.80.222 # dns2.itd.umich.edu.
traceroute 192.12.80.214 # dns1.itd.umich.edu.
traceroute 128.105.2.10  # dns.cs.wisc.edu.

echo "And we know we can reach campus by IP"
echo 141.211.243.174 == weblogin.mc.itd.umich.edu == weblogin.umich.edu
traceroute 141.211.243.174
sleep 5

