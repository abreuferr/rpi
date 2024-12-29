#!/bin/bash

IPTABLES=/sbin/iptables

# clean all possible old mess
$IPTABLES -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F

echo 1 > /proc/sys/net/ipv4/ip_forward
$IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE
$IPTABLES -A FORWARD -i eth0 -o wlan0 -m state --state RELATED,ESTABLISHED -j ACCEPT
$IPTABLES -A FORWARD -i wlan0 -o eth0 -j ACCEPT

$IPTABLES -P INPUT ACCEPT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -P FORWARD ACCEPT

$IPTABLES -t nat -P POSTROUTING ACCEPT
$IPTABLES -t nat -P PREROUTING ACCEPT
$IPTABLES -t filter -P FORWARD ACCEPT