#!/bin/bash

echo "When the following ports are open, which tools can yield more information, and which other tools can we use?"
echo "	port (service) : scanner1, scanner2, ... : other_tool1, other_tool2, ..."
echo ""
echo "	22 (ssh) : ssh : sftp, scp  "
echo "	80 (HTTP) : gobuster, wfuzz : Burp Suite"
echo ""
echo "	2049 (Network File System nfs) : showmount : mount"
echo "----------ADD MORE PORTS--------------"
