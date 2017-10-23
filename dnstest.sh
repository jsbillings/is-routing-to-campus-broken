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
