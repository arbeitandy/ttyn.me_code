#!/usr/bin/env python
# vim: set fileencoding=utf-8 :
# -*- coding: utf-8 -*-

import socks
import socket
from SocksiPy import SocksiPyHandler
#socks.setdefaultproxy(socks.PROXY_TYPE_SOCKS5, "127.0.0.1", 19876)
socket.socket = socks.socksocket
import urllib2
PROXY_IP='127.0.0.1'
PROXY_PORT=19876
test_proxy_url =        {'ip_url':'http://whatismyip.org','blocked_url':'http://posterous.com', 'office_enabled_url':'http://youtube.com'}
proxy_opts     =        {'noproxy':'', 'sockproxy':''}
def test_proxy(url, mode):
    for method, proxy_opt in proxy_opts.items():
        print("------- with "+ method + " visit " + url + " ------" )
        if method is 'sockproxy':
                proxy_handler = SocksiPyHandler(socks.PROXY_TYPE_SOCKS5,PROXY_IP,PROXY_PORT)
        else:
                proxy_handler = urllib2.ProxyHandler({})

        opener = urllib2.build_opener(proxy_handler)
        opener.addheaders = [('User-agent', 'Mozilla/5.0')]
        try: 
                print opener.open(url).read(100)
                print("---- with " + method + " CONNECTION OKAY ----")
        except:
                print("---- with " + method + " failed ----")

if __name__ == '__main__':
        print "##### checking the proxies #####"
        print test_proxy_url
        for mode,url in test_proxy_url.items():
                test_proxy(url,mode)
