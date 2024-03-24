#!/bin/bash

echo "Port forwarding redirects packets from one address and port to another"
echo ""
echo "	(1) Local port forwarding"
echo "		ssh -L <local-ip>:<local-port>:<destination-ip>:<destination-port> <user>@<IP>"
echo "		Example:"
echo "		Let’s say you have a MySQL database server running on machine db001.host on an internal
 		(private) network, on port 3306, which is accessible from the machine pub001.host, and
 		you want to connect using your local machine MySQL client to the database server. To do so, 
 		you can forward the connection using the following command:"
echo ""
echo "			ssh -L 3306:db001.host:3306 user@pub001.host"
