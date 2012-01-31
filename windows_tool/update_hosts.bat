@echo off

set hostspath=%windir%\System32\drivers\etc\hosts

echo. >>%hostspath%
echo 67.203.23.20 www.runningahead.com >> %hostspath%
echo 67.203.23.20 runningahead.com >> %hostpath%

exit
