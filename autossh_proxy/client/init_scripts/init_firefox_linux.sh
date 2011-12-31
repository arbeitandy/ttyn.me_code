#!/bin/bash

# --- common path def
firefox_linux_path=~/.mozilla/firefox
test -d ${firefox_linux_path} || { echo " no firefox available"; exit 13; }

firefox_config_file=${firefox_linux_path}/profiles.ini
profile_name=`grep ^Path -m 1 ${firefox_config_file} | cut -d"=" -f2`
user_js_file=${firefox_linux_path}/${profile_name}/user.js

# manipulate user.js config
test -f ${user_js_file} && cp $user_js_file{,~}
echo 'user_pref("network.proxy.autoconfig_url", "file://'$HOME'/proxy.pac");' >> ${user_js_file}
echo 'user_pref("network.proxy.type", 2);' >> ${user_js_file}
cp ../proxy.pac ~/
echo " # ---- firefox is ready PLEASE RESTART IT"
