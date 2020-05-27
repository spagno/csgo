#!/bin/sh
export PORT="${PORT:-27015}"
export TV_PORT="${TV_PORT:-27020}"

iptables-save | grep -q -e "dport ${PORT}.*ACCEPT"
RES=$?
if [ $RES -eq 1 ]
then
  iptables -I INPUT 1 -p tcp --dport ${PORT} -j ACCEPT
  iptables -I INPUT 1 -p udp -m multiport --dports ${PORT},${TV_PORT} -j ACCEPT
  echo "Rules applied"
else
  echo "Rules already existent"
fi
