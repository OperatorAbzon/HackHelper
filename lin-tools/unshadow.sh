#!/bin/bash

echo "Tool to unshadow the /etc/shadow file"
echo "Syntax: unshadow passwd.txt shadow.txt > passwords.txt , assuming you have done cat /etc/shadow > shadow.txt and cat /etc/passwd > passwd.txt"
echo ""
echo "	(1) unshadow passwd.txt shadow.txt > passwords.txt"
echo ""
echo "		Tip: the passwords.txt file can then be passed to John The Ripper"
echo "		1.1) john <wordlist and other optional arguments> passwords.txt"
