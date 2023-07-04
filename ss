port: 7890
socks-port: 7891
allow-lan: true
mode: Rule
log-level: info
external-controller: :9090
dns:
  enabled: true
  nameserver:
    - 119.29.29.29
    - 223.5.5.5
  fallback:
    - 8.8.8.8
    - 8.8.4.4
    - tls://1.0.0.1:853
    - tls://dns.google:853
proxies:
  - {name: 🇹🇷 土耳其, server: 183.56.222.147, port: 26292, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: hCB65ks3ki, tfo: false}
  - {name: 🇺🇸 美国, server: 183.56.222.147, port: 26339, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: w2dKo5fucdbCimhPWqBHUesKg6dKIyPt6uOKIrwUyhM0, tfo: false}
  - {name: 🇸🇬 新加坡, server: 183.56.222.147, port: 26282, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: B8xY2sxyrBSatpKCuxH5R0kRoMY8E9RUE5E09SfZd1Kl, tfo: false}
  - {name: 🇮🇳 印度, server: 183.56.222.147, port: 26289, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: 6RAfvb6QogN1kFXfXX3fo00HCLCyvCuHPJBWIOxtA9eM, tfo: false}
  - {name: 🇩🇪 德国, server: 183.56.222.147, port: 26285, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: Nx45X4py7FUPFiZGiqgTfzNWebrNpcW6u99OVemoYPJ7, tfo: false}
proxy-groups:
  - name: 代理
    type: select
    proxies:
      - 🇹🇷 土耳其
      - 🇺🇸 美国
      - 🇸🇬 新加坡
      - 🇮🇳 印度
      - 🇩🇪 德国
  - name: 规则外路由选择
    type: select
    proxies:
      - 代理
      - DIRECT
rules:
  - DOMAIN-SUFFIX,local,DIRECT
  - IP-CIDR,192.168.0.0/16,DIRECT,no-resolve
  - IP-CIDR,10.0.0.0/8,DIRECT,no-resolve
  - IP-CIDR,172.16.0.0/12,DIRECT,no-resolve
  - IP-CIDR,127.0.0.0/8,DIRECT,no-resolve
  - IP-CIDR,100.64.0.0/10,DIRECT,no-resolve
  - IP-CIDR6,::1/128,DIRECT,no-resolve
  - IP-CIDR6,fc00::/7,DIRECT,no-resolve
  - IP-CIDR6,fe80::/10,DIRECT,no-resolve
  - IP-CIDR6,fd00::/8,DIRECT,no-resolve
  - PROCESS-NAME,aria2c,DIRECT
  - PROCESS-NAME,fdm,DIRECT
  - PROCESS-NAME,Folx,DIRECT
  - PROCESS-NAME,NetTransport,DIRECT
  - PROCESS-NAME,Thunder,DIRECT
  - PROCESS-NAME,Transmission,DIRECT
  - PROCESS-NAME,uTorrent,DIRECT
  - PROCESS-NAME,WebTorrent,DIRECT
  - PROCESS-NAME,WebTorrent Helper,DIRECT
  - PROCESS-NAME,DownloadService,DIRECT
  - PROCESS-NAME,Weiyun,DIRECT
  - DOMAIN-KEYWORD,aria2,DIRECT
  - DOMAIN-KEYWORD,xunlei,DIRECT
  - DOMAIN-KEYWORD,yunpan,DIRECT
  - DOMAIN-KEYWORD,Thunder,DIRECT
  - DOMAIN-KEYWORD,XLLiveUD,DIRECT
  - GEOIP,CN,DIRECT
  - MATCH,规则外路由选择
