#!/bin/bash

echo "Curl is..."
echo ""
echo "	(1) Connect to a url"
echo "		curl <url>"
echo ""
echo "	(2) Connect using a cookie"
echo "		curl -is -H \"Cookie: JSESSIONID=<session-cookie>\" <url>"
echo "		Tip: Perhaps obtain this cookie using Burp Suite"
echo ""
echo "	(3) Set cookie in curl request"
echo "		curl -H \"Cookie: <cookie>\" http://<url>"
echo "		Example:"
echo "			curl -H \"Cookie: looged_in=true; admin=false\" http://webhack.thm/cookie-test "
