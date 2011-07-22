#!/bin/bash
# Last update, Fri Jul 22 08:45:20 CST 2011

echo "Block all ports"
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
echo "Block all ports, done"

echo "Flush all filters"
iptables -F
echo "Flush all filters, done."

#echo "Logging"
#iptables -A INPUT -j LOG --log-level 7 --log-prefix "Log by dpkg"
#iptables -A OUTPUT -j LOG --log-prefix "Log by dpkg"
#echo "Logging, done"

echo "ftp"
iptables -A INPUT -p tcp --sport 21 -j ACCEPT -m comment --comment "ftp"
echo "ftp, done"

echo "ssh"
iptables -A INPUT -p tcp --dport 22 -s 192.168.0.0/16 -j ACCEPT -m comment --comment "ssh server, lan only."
iptables -A INPUT -p tcp --sport 22 -j ACCEPT -m comment --comment "ssh client"
echo "ssh, done"

echo "smtp"
iptables -A INPUT -p tcp --sport 25 -j ACCEPT -m comment --comment "smtp"
# iptables -A INPUT -p tcp --sport 465 -j ACCEPT # gmail ssl smtp server
iptables -A INPUT -p tcp --sport 587 -j ACCEPT -m comment --comment "gmail tls smtp"
echo "smtp, done"

echo "web"
iptables -A INPUT -p tcp --dport 80 -j ACCEPT -m comment --comment "visit this web server"
iptables -A INPUT -p tcp --sport 80 -j ACCEPT -m comment --comment "http"
echo "web, done"

echo "dns"
iptables -A INPUT -p udp --sport 53 -j ACCEPT -m comment --comment "dns"
echo "dns, done"

echo "ntp"
iptables -A INPUT -p udp --sport 123 -j ACCEPT -m comment --comment "ntp"
echo "ntp, done"

echo "cvs"
iptables -A INPUT -p tcp --dport 2401 -j ACCEPT -m comment --comment "cvs server"
iptables -A INPUT -p tcp --sport 2401 -j ACCEPT -m comment --comment "cvs client"
echo "cvs, done"

echo "subversion"
iptables -A INPUT -p tcp --dport 3690 -j ACCEPT -m comment --comment "svn"
echo "subversion, done"

echo "git"
iptables -A INPUT -p tcp --sport 9418 -j ACCEPT -m comment --comment "git"
echo "git, done"

echo "icmp"
iptables -A INPUT -p icmp --icmp-type "echo-request" -s 192.168.0.0/16 -j ACCEPT -m comment --comment "icmp echo request, lan only."
iptables -A INPUT -p icmp --icmp-type "echo-reply" -j ACCEPT -m comment --comment "icmp echo reply."
echo "icmp, done"

echo "smb"
iptables -A INPUT -p tcp --sport 445 -s 192.168.0.0/16 -j ACCEPT -m comment --comment "samba fs input, lan only."
echo "smb, echo"

echo "irc"
iptables -A INPUT -p tcp --sport 6660:7000 -j ACCEPT -m comment --comment "irc"
echo "irc, done"

echo "nfs"
iptables -A INPUT -p tcp --sport 111 -j ACCEPT -m comment --comment "nfs"
iptables -A INPUT -p udp --sport 111 -j ACCEPT -m comment --comment "nfs"
iptables -A INPUT -p tcp --sport 2049 -j ACCEPT -m comment --comment "nfs"
iptables -A INPUT -p udp --sport 2049 -j ACCEPT -m comment --comment "nfs"
echo "nfs, done"
