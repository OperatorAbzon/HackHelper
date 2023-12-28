#!/bin/bash

echo "Scan for domains: (1) wfuzz -c -z file,/<path-to>/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -H \"Host: FUZZ.<host>\" (--hc <return-code>/--hl <content-length>/--hh <chars>) http://<host>:<port> "
echo "	where --hc filters out the specified return code, and --hl filters out the specified content size"
echo ""
echo "1) If your scan finds a new domain you may have to add it to your /etc/hosts file, if you have set a name for the host ip address"
