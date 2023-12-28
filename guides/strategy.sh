#!/bin/bash

echo "This is an example of a strategy on how to proceed with a box"
echo ""
echo "1) Run nmap on the ip address to see which ports are open and which services run on them. Along with some other info"
echo ""
echo "2) Run gobuster and wfuzz to get domains and paths. See < ./octopus.sh -t gobuster > and < ./octopus.sh -t wfuzz > respectively for usage"
echo ""
echo "3) If you have a website you can use Burp to investigate further "
echo ""
echo "4) See if you have any information about the software running. See if there may be some exploits for old software."
