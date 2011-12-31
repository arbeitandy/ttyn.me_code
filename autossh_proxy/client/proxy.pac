function FindProxyForURL(url, host) {
        var lhost = host.toLowerCase();
        var proxy_yes = "SOCKS5 127.0.0.1:19876";
        var proxy_no = "DIRECT";
        host = lhost; 
        if ((host == "locahost") ||
            (shExpMatch(host, "locahost.*")) ||
            (host == "127.0.0.1")) {
               return proxy_no;
        }
        if (dnsDomainIs(host, "twitter.com") || dnsDomainIs(host, ".twitter.com") || shExpMatch(url, "twitter.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".apigee.com") || shExpMatch(host, "apigee.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".runningahead.com") || shExpMatch(host, "runningahead.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".t.co") || shExpMatch(host, "t.co")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".youtube.com") || shExpMatch(host, "youtube.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".ytimg.com") || shExpMatch(host, "ytimg.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".tumblr.com") || shExpMatch(host, "tumblr.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".posterous.com") || shExpMatch(host, "posterous.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".blogspot.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".google.com") || shExpMatch(host, "google.com")) {
                return proxy_yes;
        } else if (dnsDomainIs(host, ".googleusercontent.com") || shExpMatch(host, ".googleusercontent.com")) {
                return proxy_yes;
        } else if (shExpMatch(host, ".gstatic.com")) {
                return proxy_yes;
        } else if (shExpMatch(host, ".googleapis.com")) {
                return proxy_yes;
        } else if (shExpMatch(host, ".googlelabs.com")) {
                return proxy_yes;
        } else if (shExpMatch(host, ".google.com.hk")) {
                return proxy_yes;
        } else if (shExpMatch(host, ".google.cn")) {
                return proxy_yes;
        } else if (shExpMatch(host, "whatismyip.org")) {
                return proxy_yes;
        } else if (shExpMatch(host, "feedburner.com")) {
                return proxy_yes;
        } else if (shExpMatch(host, "feedproxy.google.com")) {
                return proxy_yes;
        } else if (shExpMatch(host, "bit.ly")) {
                return proxy_yes;
        } else if (shExpMatch(host, "dropbox")) {
                return proxy_yes;
        } else if (shExpMatch(host, "ef.com")) {
                return proxy_yes;
        }
        return proxy_no;
}
