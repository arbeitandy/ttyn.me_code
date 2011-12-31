#!/bin/bash
# last modified: 2011-12-20
# maintainer: andy@ttyn.me
source ~/.bash_profile
: ${command:=$1} 
: ${port_number:="19876"} # this is the local port on client. can change
: ${proxy_host:="first_proxy_host"}
: ${local_proxy_server_ip:="127.0.0.1"}
SSH_CMD="autossh -M 0"
SSH_CMD_MON="autossh -M 11080"

case $command in
        start)  echo "#----`date '+%Y-%m-%d'` --- starting the proxy"
                ${SSH_CMD} -qTfnN -D ${local_proxy_server_ip}:${port_number} ${proxy_host}
        ;;
        stop)  echo "#----`date '+%Y-%m-%d'` --- use SIGTERM to stop the proxy"
               kill -s SIGTERM `pidof autossh`
        ;;
        status)  echo "#----`date '+%Y-%m-%d'` --- status of the proxy"
                 pidof autossh
        ;;
        test)  echo "#----`date '+%Y-%m-%d'` --- test proxy connection"
                 ${SSH_CMD} -vvvTN -D ${local_proxy_server_ip}:${port_number} ${proxy_host}
                 #TODO add real test to the proxy
        ;;
        *) echo "please use ./start_proxy.sh [start|stop] to manipulate tunnel" && exit 1
esac
