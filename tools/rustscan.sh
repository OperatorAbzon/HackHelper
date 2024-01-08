#!/bin/bash

echo "RustScnan is a fast alternative to Nmap."
echo ""
echo "The following guides assumes you have the Docker image pulled, and ready to go."
echo "Also the following alias:"
echo "	rustscan='sudo docker run -it --rm --name rustscan rustscan/rustscan:latest'"
echo ""
echo "	(0) Get help regarding rustscan:"
echo "		rustscan --help"
echo ""
echo "	(1) Scan a target:"
echo "		rustscan <rustscan-arguments> <target-ip>"
