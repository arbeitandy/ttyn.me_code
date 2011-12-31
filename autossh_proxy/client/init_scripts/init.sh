#!/bin/bash

private_config="../private-config."${username}
# --- common path def
test -d ${private_config} || { echo " no config files available"; exit 3; }
ssh_config_file=~/.ssh/config
proxy_ssh_config_file="${private_config}/_ssh_config"
proxy_user=`awk '/User / {print $2}' $proxy_ssh_config_file`
proxy_hostname=`awk '/Host / {print $2}' $proxy_ssh_config_file`

# --- install autossh if not available 
hash autossh 2>&- || \
        { echo >&2 "installing autossh ...";  \
                hash yum 2>&- && \
                  sudo yum install -y autossh  || \
                  sudo apt-get install autossh ; \
        }
echo >&2 "your autossh path is .." 
type autossh

# --- config .ssh and key using the files extrated
chown -R `whoami` ${private_config}
mkdir -m 700 -p ~/.ssh
mv -v ${private_config}/*rsa* ~/.ssh/
chmod 400 ~/.ssh/*rsa* 

# manipulate ssh config
test -f ${ssh_config_file} && { cp $ssh_config_file{,~} ; \
            /usr/bin/grep -Fc $proxy_hostname ${ssh_config_file} || \
                { chmod 600 ${ssh_config_file}; \
                  cp ${proxy_ssh_config_file} ${ssh_config_file} ; \
                  cat ${ssh_config_file}~ >> ${ssh_config_file}; \
                  echo "#--- new config catted"; 
                } \
        } \
        || cp ${proxy_ssh_config_file} ${ssh_config_file}


echo " # ---- use start_proxy.sh to start proxy and python quick_check_proxy.py to test proxy status "
