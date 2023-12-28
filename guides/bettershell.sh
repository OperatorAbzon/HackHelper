#!/bin/bash

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
