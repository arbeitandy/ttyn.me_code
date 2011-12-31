#!/bin/bash
user_name="yxorp_user_$1"
expire_date="2012-12-12"
sudo useradd -m -s /bin/false ${user_name} -e $expire_date
sudo mkdir -p /home/${user_name}/.ssh/
sudo chmod 700 /home/${user_name}/.ssh /home/${user_name}
# @adminserver ssh-keygen -b 2048 -t rsa -q -N "" -f ./"$user_name"_rsa
# scp ./"$user_name"_rsa.pub yxorp:~/tmp/
# ssh -t yxorp "sudo mv ~/tmp/"$user_name"_rsa.pub /home/${user_name}/.ssh/auth_keys \
# && sudo chown ${user_name}. /home/${user_name}/.ssh/auth_keys \
# && sudo chmod 400 /home/${user_name}/.ssh/auth_keys" 
