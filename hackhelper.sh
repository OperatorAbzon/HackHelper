#!/bin/bash
TEST_STRING=""

usage() {
	echo ""
        echo "This is HackHelper. A hacking helper script."
	echo "It either provides help with information, or runs tools for you."
	echo ""
	echo "These are the flags for HackHelper."
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
	echo "	cewl"
	echo "	curl"
	echo "	enum4linux"
	echo "	ffuf"
	echo "	gobuster"
	echo "	hashid"
	echo "	hydra"
	echo "	kubectl"
	echo "	linpeas"
	echo "	netstat"
	echo "	nc"
	echo "	nmap"
	echo "	ps"
	echo "	rdp"
	echo "	rustscan"
	echo "	searchsploit"
	echo "	showmount"
	echo "	stat"
	echo "	sudo"
	echo "	unshadow"
	echo "	wfuzz"
	echo ""
	echo ""
	echo "Procedures (-g flag):"
	echo "	lin-bettershell , (Linux) Get a better shell when you have established a revshell"
	echo "	lin-enumeration , (Linux) Enumerate usernames and passwords on website"
	echo "	lin-file-transfer ,(Linux) Transfer files or tools"
	echo "	lin-general , (Linux) General help"
	echo "	lin-hostrecon , (Linux) Discovery info about host system"
	echo "	lin-revshell , (Linux) Generating and getting a reverse shell"
	echo "	lin-privesc , (Linux) Privilege escalation"
	echo "	lin-passiverecon , (Linux) Passive Reconnaisance"
	echo "	ports , Which tools can be good to use when specific ports are open?"
	echo "	lin-portforward"
	echo "	lin-stealth , How to be more stealthy in an engagement"
	echo "	lin-strategy , (Linux) A guide to the strategy on how to do a pentest/hack of a box"
	echo ""
	echo "	win-privesc , (Windows) Privilege Escalation"
	echo ""
	echo "Tools, not hacking related (-f flag)"
	echo "	jq"


}

tips_enumeration() {
	./lin-guides/enumeration.sh
}

tips_stealth() {
	./lin-guides/stealth.sh
}

func_linpeas() {
	./lin-tools/linpeas.sh
}

func_ps() {
	./lin-tools/ps.sh
}

func_netstat() {
	./lin-tools/netstat.sh
}

tips_hostrecon() {
	./lin-guides/hostrecon.sh
}

func_curl() {
	./lin-tools/curl.sh
}

tips_portforward() {
	./lin-guides/portforward.sh
}

func_stat() {
	./lin-tools/stat.sh
}

func_kubernetes() {
	./lin-tools/kubectl.sh
}

func_hydra() {
	./lin-tools/hydra.sh
}

func_cewl() {
	./lin-tools/cewl.sh
}

func_hashid() {
	./lin-tools/hashid.sh
}

func_rustscan() {
	./lin-tools/rustscan.sh
}

func_unshadow() {
	./lin-tools/unshadow.sh
}

func_enum4linux() {
	./lin-tools/enum4linux.sh
}

func_ffuf() {
	./lin-tools/ffuf.sh
}

tips_filetransfer() {
	./lin-guides/filetransfer.sh
}

tips_general() {
	./lin-guides/general.sh
}

func_gobuster() {
	./lin-tools/gobuster.sh
}

func_linpeass() {
	./lin-tools/linpeas.sh
}

func_nc() {
	./lin-tools/netcat.sh
}

func_nmap() {
	./lin-tools/nmap.sh
}

tips_revshell() {
	./lin-guides/revshell.sh
}

tips_privesc() {
	./lin-guides/privesc.sh
}

tips_strategy() {
	./lin-guides/strategy.sh
}

func_searchsploit() {
	./lin-tools/searchsploit.sh
}

func_showmount() {
	./lin-tools/showmount.sh
}

tips_passiverecon() {
	./lin-guides/passiverecon.sh
}

func_sudo() {
	./lin-tools/sudo.sh
}

func_wfuzz() {
	./lin-tools/wfuzz.sh
}

tips_ports() {
	./lin-guides/ports.sh
}

func_jq() {
	./lin-tools/jq.sh
}

tips_bettershell() {
	./lin-guides/bettershell.sh
}

tips_winprivesc() {
	./win-guides/win-privesc.sh
}

while getopts "lt:g:f:h" opt; do

	case "$opt" in

		l) 
			list_tools
			;;

		t)
			if [[ "$OPTARG" == "gobuster" ]]; then
				func_gobuster
			elif [[ "$OPTARG" == "linpeas" ]]; then
				func_linpeas
			elif [[ "$OPTARG" == "ps" ]]; then
				func_ps
			elif [[ "$OPTARG" == "netstat" ]]; then
				func_netstat
			elif [[ "$OPTARG" == "curl" ]]; then
				func_curl
			elif [[ "$OPTARG" == "stat" ]]; then
				func_stat
			elif [[ "$OPTARG" == "hashid" ]]; then
				func_hashid
			elif [[ "$OPTARG" == "kubernetes" ]]; then
				func_kubernetes
			elif [[ "$OPTARG" == "hydra" ]]; then
				func_hydra	
			elif [[ "$OPTARG" == "cewl" ]]; then
				func_cewl
			elif [[ "$OPTARG" == "enum4linux" ]]; then
				func_enum4linux
			elif [[ "$OPTARG" == "ffuf" ]]; then
				func_ffuf
			elif [[ "$OPTARG" == "nc" ]]; then
				func_nc
			elif [[ "$OPTARG" == "nmap" ]]; then
				func_nmap
			elif [[ "$OPTARG" == "rustscan" ]]; then
				func_rustscan
			elif [[ "$OPTARG" == "searchsploit" ]]; then
				func_searchsploit
			elif [[ "$OPTARG" == "showmount" ]]; then
				func_showmount
			elif [[ "$OPTARG" == "sudo" ]]; then
				func_sudo
			elif [[ "$OPTARG" == "unshadow" ]]; then
				func_unshadow
			elif [[ "$OPTARG" == "wfuzz" ]]; then
				func_wfuzz
			fi
			;;

		g)
			if [[ "$OPTARG" == "lin-general" ]]; then
				tips_general
			elif [[ "$OPTARG" == "lin-enumeration" ]]; then
				tips_enumeration
			elif [[ "$OPTARG" == "lin-stealth" ]]; then
				tips_stealth
			elif [[ "$OPTARG" == "lin-hostrecon" ]]; then
				tips_hostrecon
			elif [[ "$OPTARG" == "lin-portforward" ]]; then
				tips_portforward
			elif [[ "$OPTARG" == "lin-bettershell" ]]; then
				tips_bettershell
			elif [[ "$OPTARG" == "lin-revshell" ]]; then
				tips_revshell
			elif [[ "$OPTARG" == "lin-wfuzz" ]]; then
				tips_wfuzz
			elif [[ "$OPTARG" == "lin-file-transfer" ]]; then
				tips_filetransfer
			elif [[ "$OPTARG" == "ports" ]]; then
				tips_ports
			elif [[ "$OPTARG" == "lin-privesc" ]]; then
				tips_privesc
			elif [[ "$OPTARG" == "lin-strategy" ]]; then
				tips_strategy
			elif [[ "$OPTARG" == "lin-passiverecon" ]]; then
				tips_passiverecon
			elif [[ "$OPTARG" == "win-privesc" ]]; then
				tips_winprivesc
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
