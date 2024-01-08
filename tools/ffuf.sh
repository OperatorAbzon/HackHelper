#!/bin/bash

echo "Fuzz a website for sub-directories. Same as wfuzz or gobuster."
echo "Syntax: ffuf -w /path/to/wordlist -u http://<url>:<port>/FUZZ (-fs size-filter)"
echo ""
echo "	(1) ffuf -w /usr/share/seclists/Discovery/Web-Content/directory-list-2.3-medium.txt -u http://<url>:<port>/FUZZ"
