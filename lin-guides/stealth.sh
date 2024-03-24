#!/bin/bash

echo "This guides provides some tips and methods on how to do things stealthily"
echo ""
echo "	(1) nmap -sC"
echo "		When running nmap with the -sC flag, the remote server logs the user agent (such as Mozilla 5.0)"
echo "		This is bad opsec. We can instead set the user agent to what we want, such as CUSTOM_AGENT"
echo "		by adding the flag"
echo "			--script-args http.useragent=\"CUSTOM_AGENT\""

