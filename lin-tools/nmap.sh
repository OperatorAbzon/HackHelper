#!/bin/bash

echo "Comprehensive scan (with status every 5 seconds):                 (1) nmap -sVC -p- -oA <output-name> --stats-every 5s <host>"
echo "Fast scan (top 1000 popular ports):   				(2) nmap -sVC -oA <output-name> <host>"
echo "UDP scan (top 1000 popular ports. All ports takes too long): 	(3) nmap -sVC -sU -oA <output-name> <host>"
echo "List which addresses will be scanned: 				(4) nmap -sL <addresses/network>"
echo ""
echo "Tips:"
echo "	You can give the output xml file to searchsploit to search for vulnerabilities:" 
echo "                                      (4) searchsploit --nmap <output-name>.xml"
echo ""
