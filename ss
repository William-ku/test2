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
  - {name: 订阅转换:https://suburl.v1.mk, server: api.v1.mk, port: 8888, client-fingerprint: chrome, type: ss, cipher: chacha20-ietf-poly1305, password: 014bb090-bc65-46fd-ad20-c70718b676e8, tfo: false}
  - {name: 🇹🇷 Turkey, server: 111.38.37.16, port: 25370, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: hCB65ks3ki, tfo: false}
  - {name: 🇺🇸 United States | 2x, server: 111.38.37.16, port: 45612, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: cybzSZmcviAqAl0ttf21AVJtev2qCmb3cw38dpJg32OR, tfo: false}
  - {name: 🇺🇸 United States | 流媒体 1x, server: 139.226.136.165, port: 36716, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: ifSwQYJx6k7SLPWGxpRFj4StDnXkgDR1H0DocAxPglKX, tfo: false}
  - {name: 🇦🇺 Sydney, server: 111.38.37.16, port: 25372, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: wScMqPON9by01FxT0G9t5jumWdVDmjqN6Ugs7ORW1kXd, tfo: false}
  - {name: 🇸🇬 Singapore, server: 111.38.37.16, port: 25373, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: ZMzoSwquktwdWIcOwIYCc5ZlRyGj00s7Rqgm06sLsfUu, tfo: false}
  - {name: 🇧🇷 Sao Paulo, server: 111.38.37.16, port: 25374, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: vrtezpVeoe7Sbhudi8amgaOAzmLb35YVWyk47o5Xrr6c, tfo: false}
  - {name: 🇭🇰 HK, server: 139.226.136.165, port: 26748, client-fingerprint: chrome, type: ss, cipher: aes-256-gcm, password: adGjG0jKgnICgHuiNXCMRWaqU2xP9SHWkE9a2J5wkLnA, tfo: false}
proxy-groups:
  - name: 代理
    type: select
    proxies:
      - 订阅转换:https://suburl.v1.mk
      - 🇹🇷 Turkey
      - 🇺🇸 United States | 2x
      - 🇺🇸 United States | 流媒体 1x
      - 🇦🇺 Sydney
      - 🇸🇬 Singapore
      - 🇧🇷 Sao Paulo
      - 🇭🇰 HK
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
