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
	echo "	passiverecon , Passive Reconnaisance"
	echo "	ports , Which tools can be good to use when specific ports are open?"
	echo "	strategy , A guide to the strategy on how to do a pentest/hack of a box"
	echo ""
	echo ""
	echo "Tools, not hacking related (-f flag)"
	echo "	jq"


}

tips_filetransfer() {
	./guides/filetransfer.sh
}

tips_general() {
	./guides/general.sh
}

func_gobuster() {
	./tools/gobuster.sh
}

func_linpeass() {
	./tools/linpeas.sh
}

func_nc() {
	./tools/netcat.sh
}

func_nmap() {
	./tools/nmap.sh
}

tips_revshell() {
	./guides/revshell.sh
}

tips_privesc() {
	./guides/privesc.sh
}

tips_strategy() {
	./guides/strategy.sh
}

func_searchsploit() {
	./tools/searchsploit.sh
}

func_showmount() {
	./tools/showmount.sh
}

tips_passiverecon() {
	./guides/passiverecon.sh
}

func_sudo() {
	./tools/sudo.sh
}

func_wfuzz() {
	./tools/wfuzz.sh
}

tips_ports() {
	./guides/ports.sh

}

func_jq() {
	./tools/jq.sh
}

tips_bettershell() {
	./guides/bettershell.sh
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
			elif [[ "$OPTARG" == "passiverecon" ]]; then
				tips_passiverecon
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
