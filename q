#==============UserScript==============#
# @Autor        chxm1023
# @TgChannel    https://t.me/chxm1023
#**************************************#
#   以 “;” 或 “#” 或 “//” 开头的行为注释行
#**************************************#
# 更新日期：2023-07-26

# 本配置地址：https://raw.githubusercontent.com/chxm1023/Script_X/main/Quantumult_X.conf

# 建议在「其他设置」里「GeoLite2」的「来源」填写使用下面链接，并开启「自动更新」
; https://raw.githubusercontent.com/Loyalsoldier/geoip/release/Country.mmdb
; https://raw.githubusercontent.com/Hackl0us/GeoIP2-CN/release/Country.mmdb

# 解锁网易云灰色音乐，获取证书链接(下列二选一下载安装即可)
; https://raw.githubusercontent.com/nondanee/UnblockNeteaseMusic/master/ca.crt
;https://cdn.jsdelivr.net/gh/nondanee/UnblockNeteaseMusic@master/ca.crt

# 利用描述文件屏蔽IOS更新提醒
; https://app.initnil.com/tvOS.mobileconfig

# "reject" 策略会返回 HTTP 状态码 404,不附带任何额外内容
# "reject-200" 策略会返回 HTTP 状态码 200,不附带任何额外内容
# "reject-img" 策略返回 HTTP 状态码 200,同时附带 1px gif
# "reject-dict" 策略返回 HTTP 状态码 200,同时附带一个空的 JSON 对象
# "reject-array" 策略返回 HTTP 状态码 200,同时附带一个空的 JSON 数组

#**************************************#
[general]
# 节点延迟测试，server_check_url指定的网址进行相应测试，以确认节点的可用性
server_check_url=http://cp.cloudflare.com/generate_204
;server_check_url= http://www.qualcomm.cn/generate_204
;server_check_url=http://captive.apple.com/generate_204
;server_check_url =http://www.google.com/generate_204

# 服务器测试超时时间 (毫秒)
server_check_timeout=2000

# 用于设置图标显示
profile_img_url=https://raw.githubusercontent.com/chxm1023/Script_X/main/icon/ddm.png

# 用于Check节点IP地址(以下geo_location_checker任选一个即可)
# 显示名称-详细地址-国旗
;geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://raw.githubusercontent.com/I-am-R-E/Functional-Store-Hub/Master/GeoLocationChecker/QuantumultX/IP-API.js
# 中文显示地区
geo_location_checker=http://ip-api.com/json/?lang=zh-CN, https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/IP_API.js
# 显示名称及无国旗
;geo_location_checker=http://extreme-ip-lookup.com/json/, https://raw.githubusercontent.com/crossutility/Quantumult-X/master/sample-location-with-script.js
# 显示英文名称及国旗
;geo_location_checker=http://ifconfig.co/json, https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/IPConfig.js

# 资源解析器，自定义各类远程资源的转换、如节点、规则-filter、重写-rewrite等
resource_parser_url=https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/resource-parser.js

# 下列表中内容将不经过QuantumultX的处理
excluded_routes=239.255.255.250/32, 24.105.30.129/32, 185.60.112.157/32, 185.60.112.158/32, 182.162.132.1/32
udp_whitelist=1-442, 444-65535

# 第一个filter为4g模式开启规则分流，第二个filter为其他wifi下开启规则分流，第三个wifi1修改成你路由器翻墙的wifi名开启直连模式，第四个wifi2为你公司或者其他有路由器翻墙的WiFi名走直连）
# 默认关闭根据wifi切换模式，如需开启，删除下方的";"即可
;running_mode_trigger=filter, filter, wifi1:all_direct, wifi2: all_direct

# dns_exclusion_list中的域名将不使用fake-ip方式, 多个域名用“, ”连接。其它域名则全部采用 fake-ip及远程解析的模式
dns_exclusion_list=*.cmpassport.com, *.jegotrip.com.cn, *.icitymobile.mobi, id6.me, *.pingan.com.cn, *.cmbchina.com



#**************************************#
[dns]
; 禁用系统 DNS（no-system） 以及 ipv6
no-system
no-ipv6
;支持参数 excluded_ssids , included_ssids(1.0.29+) 指定在特定 Wi-Fi下失效/生效

// circumvent-ipv4-answer, circumvent-ipv6-answer 参数
//1、当并发向多个上游 DNS 进行查询时，如响应最快的上游 DNS 抢答的结果命中了该条目，则 Quantumult X Tunnel DNS 模块会等待其他 DNS 服务器的响应结果（如抢答的结果中至少有一个不属于该条目，则不会等待其他 DNS 的响应，此时有效结果采用不属于该条目的所有记录）
//2、如所有上游 DNS 返回的所有结果均命中该条目，则判定为 DNS 查询失败
//3、如配置的上游 DNS 包含有去广告功能的 DNS 服务器，请勿使用该参数
;circumvent-ipv4-answer = 127.0.0.1, 0.0.0.0
;circumvent-ipv6-answer = ::

//如需使用 DoH3，DNS over HTTP/3，请开启下面👇参数
;prefer-doh3

;指定 dns 服务器，并发响应选取最优结果
server=114.114.114.114
server=202.141.176.93 
server=202.141.178.13
server=117.50.10.10
server=223.5.5.5
server=119.29.29.29:53
server=119.28.28.28
# 指定域名解析DNS
server=/*icloud.com/119.29.29.29
server=/*icloud.com.cn/119.29.29.29
server=/*tencent.com/119.29.29.29
server=/*weixin.com/119.29.29.29
;如指定 doh 服务，则👆️上面的一般 dns 解析均失效 额外参数，在特定网络下禁用该 doh
;doh-server=xxx.com, excluded_ssids=SSID1, SSID2
; 1.0.29 版本后支持多个 doh 并发，👇
;doh-server = https://dns.alidns.com/dns-query,https://doh.pub/dns-query,https://dns.google/dns-query,https://223.5.5.5/dns-query, https://223.6.6.6/dns-query
; 1.0.29以前版本使用
doh-server = https://doh.pub/dns-query, https://dns.alidns.com/dns-query

; 1.0.29 版本后支持 alias 映射类型
;alias=/example.com/another-example.com

;如指定了 DoQ 服务，则 DoH 以及其它 dns解析均失效
;doq-server = quic://dns.adguard.com
;doq-server = quic://dns1.example.com, quic://dns2.example.com
;doq-server = quic://dns.adguard.com, excluded_ssids=SSID1
;doq-server = quic://dns.adguard.com, included_ssids=SSID2

;指定域名解析dns, 下面为示范，按需启用, 同样支持 excluded_ssids/included_ssids 参数
;server=/*.taobao.com/223.5.5.5, excluded_ssids=My-Wifi, Your-Wifi
;server=/*.tmall.com/223.5.5.5, included_ssids=His-Wifi
;server=/example1.com/8.8.4.4
;server=/*.example2.com/223.5.5.5
;server=/example4.com/[2001:4860:4860::8888]:53
;address=/example5.com/192.168.16.18
;address=/example6.com/[2001:8d3:8d3:8d3:8d3:8d3:8d3:8d3]
//映射域名到其它域名的类型
;alias = /example7.com/another-example.com



#**************************************#
# 策略组[policy]↓↓↓↓↓↓↓↓↓
# 翻译解释Direct直连, Proxy代理, Reject拒绝
# 用于分发分流规则传递过来的网络请求
# static 策略组中，你需要手动选择想要的节点/策略组。
# available 策略组将按顺序选择你列表中第一个可用的节点。
# round-robin 策略组，将按列表的顺序轮流使用其中的节点。
# url-latency-benchmark 延迟策略组，选取延迟最优节点。
# dest-hash 策略组，随机负载均衡，但相同域名走固定节点。
# ssid 策略组，将根据你所设定的网络来自动切换节点/策略组
# img-url 参数用于指定策略组图标，可远程，也可本地/iCloud(Quantumult X/Images路径下) （108*108 大小）
# Direct/Proxy/Reject 则只能用本地图标，名字分别为 Direct.png, Proxy.png,Reject.png 放置于 Images 文件夹下即可生效 (108*108 大小)
[policy]
static=全部节点, proxy, server-tag-regex=^((?!(网易|网易云|网易云音乐|音乐|云音乐|官网|流量|加群|订阅|获取|刷新|鸡场|机场|订购|购买|套餐|重置|分享|网址|邀请|公众号|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, img-url=https://raw.githubusercontent.com/chxm1023/Script_X/main/icon/QX/Quantumult_X_1.png
static=策略选择, 延迟最低, 全部节点, 直连模式, 负载均衡, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Back.png
static=大陆服务, direct, reject, 全球加速, 国际代理, 直连模式, 延迟最低, img-url=https://raw.githubusercontent.com/Orz-3/mini/master/Color/Catnet.png
static=地理位置, direct, reject, 全球加速, 拦截模式, 直连模式, 延迟最低, img-url=https://raw.githubusercontent.com/Orz-3/mini/master/Color/NSFW.png
static=Roblox, direct, proxy, reject, 延迟最低, 负载均衡, 直连模式, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 大陆服务, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/chxm1023/Script_X/main/icon/xbox.png
static=Bing, direct, proxy, reject, 狮城节点, 日本节点, 美国节点, img-url=https://raw.githubusercontent.com/Orz-3/mini/master/Color/Cm.png
static=ChatGPT, 美国节点, 全部节点, 策略选择, 狮城节点, 韩国节点, 日本节点, 台湾节点, 香港节点, img-url=https://raw.githubusercontent.com/chxm1023/Script_X/main/icon/ChatGPT/ChatGPT4.png
static=TikTok, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/chxm1023/Script_X/main/icon/TikTok_1.png
static=Discord, direct, proxy, reject, 香港节点, 台湾节点, 狮城节点, 日本节点, 美国节点, 策略选择, 全部节点, img-url=https://raw.githubusercontent.com/Orz-3/mini/master/Color/Muchang.png
static=Emby, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, 直连模式, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Emby.png
static=Github, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/GitHub.png
static=Google, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Google_Search.png
static=Spotify, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Spotify.png
static=Twitter, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Twitter.png
static=Netflix, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Netflix_Letter.png
static=Disney, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Disney+.png
static=YouTube, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/YouTube.png
static=Telegram, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Telegram.png
static=Instagram, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Instagram.png
static=Facebook, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Facebook.png
static=网易云音乐, 直连模式, server-tag-regex=(?i)(网易|网易云|网易云音乐|音乐|云音乐|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|music|🎵|🎶|🎧), img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Netease_Music.png
static=微软服务, 直连模式, 策略选择, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Microsoft.png
static=苹果服务, 直连模式, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Apple.png
static=系统更新, 拦截模式, 直连模式, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Apple_Update.png
static=港台番剧, 直连模式, 香港节点, 台湾节点, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/bilibili.png
static=国际代理, 策略选择, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, 全部节点, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Airport.png
static=全球加速, 策略选择, 全部节点, 直连模式, 香港节点, 台湾节点, 日本节点, 韩国节点, 狮城节点, 美国节点, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Global.png
url-latency-benchmark=延迟最低, server-tag-regex=^((?!(网易|网易云|网易云音乐|音乐|云音乐|官网|流量|加群|订阅|获取|刷新|鸡场|机场|订购|购买|套餐|重置|分享|网址|邀请|公众号|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, check-interval=600, tolerance=0, alive-checking=false, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Download.png
dest-hash=负载均衡, server-tag-regex=^((?!(网易|网易云|网易云音乐|音乐|云音乐|官网|流量|加群|订阅|获取|刷新|鸡场|机场|订购|购买|套餐|重置|分享|网址|邀请|公众号|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/SSID.png
static=直连模式, direct, 策略选择, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Proxy.png
static=拦截模式, reject, direct, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Reject.png
url-latency-benchmark=香港节点, server-tag-regex=(?=.*((?i)🇭🇰|香|港|香港|香江|香岛|湾仔|港仔|九龙|铜锣湾|旺角|HK|Hong|HongKong))^((?!(台|日|韩|新|美|英|平|邀|群|刷新|网|网易|网易云|网易云音乐|音乐|云音乐|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, check-interval=600, tolerance=0, alive-checking=false, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Hong_Kong.png
url-latency-benchmark=台湾节点, server-tag-regex=(?=.*((?i)🇨🇳|台|台湾|台北|新北|桃园|台中|台南|高雄|基隆|新竹|嘉义|苗栗|彰化|南投|云林|屏东|台东|花莲|宜兰|澎湖|金门|连江|TW|Taiwan))^((?!(港|日|韩|新|美|英|平|邀|群|刷新|网|网易|网易云|网易云音乐|音乐|云音乐|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, check-interval=600, tolerance=0, alive-checking=false, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/China.png
url-latency-benchmark=日本节点, server-tag-regex=(?=.*((?i)🇯🇵|日|日本|川日|东京|大阪|泉日|埼玉|沪日|深日|JP|Japan|名古屋|福冈|仙台|京都|Japan))^((?!(港|台|韩|新|美|英|平|邀|群|刷新|网|网易|网易云|网易云音乐|音乐|云音乐|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, check-interval=600, tolerance=0, alive-checking=false, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Japan.png
url-latency-benchmark=韩国节点, server-tag-regex=(?=.*((?i)🇰🇷|韩|韩国|南韩|南朝鲜|高丽|大韩民国|首尔|世宗|济州市|水原|釜山|大邱|仁川|光州|大田|蔚山|KR|Korea|Korean|South Korea))^((?!(港|台|日|新|美|英|平|邀|群|刷新|网|网易|网易云|网易云音乐|音乐|云音乐|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, check-interval=600, tolerance=0, alive-checking=false, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Korea.png
url-latency-benchmark=狮城节点, server-tag-regex=(?=.*((?i)🇸🇬|新|狮|獅|坡|新加坡|星|星加坡|星洲|狮城|SG|Singapore))^((?!(港|台|日|韩|美|英|新西兰|平|邀|群|刷新|网|网易|网易云|网易云音乐|音乐|云音乐|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, check-interval=600, tolerance=0, alive-checking=false, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Singapore.png
url-latency-benchmark=美国节点, server-tag-regex=(?=.*((?i)🇺🇸|美|美国|美利坚合众国|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|华盛顿|内华达|蒙大纳|怀俄明州|菲尼克斯|阿尔伯克基|丹佛|US|United States|States|American))^((?!(港|台|日|韩|新|英|平|邀|群|刷新|网|网易|网易云|网易云音乐|音乐|云音乐|Netease|Music|𝐌𝐮𝐬𝐢𝐜|Unbolck|Update|music|🎵|🎶|🎧)).)*$, check-interval=600, tolerance=0, alive-checking=false, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/United_States.png



#**************************************#
# 本地节点↓↓↓↓↓↓↓↓↓
[server_local]


[server_remote]
https://992900992.xyz/api/v1/client/subscribe?token=5a534bdb9d307035f9eaca1f4cf52a05, tag=N, update-interval=172800, opt-parser=true, enabled=true

http://s.hajimi.icu/v3/subscr?id=e2549753fe70476e80c5e4fe9aecda9b, tag=1T, update-interval=172800, opt-parser=true, enabled=true
https://mojie.app/api/v1/client/subscribe?token=aff967642243d29e850b93dc8e648163, tag=魔戒, update-interval=172800, opt-parser=true, enabled=true

[filter_local]
host-suffix, input.shouji.sogou.com, direct
host-suffix, img.shouji.sogou.com, direct
host-suffix, sogou.com, direct
host-suffix, get.shouji.sogou.com, direct
# AD处理
host-keyword, pangolin, 拦截模式
host-keyword, pglstatp, 拦截模式
host-keyword, adview, 拦截模式
host-suffix, gdt.qq.com, 拦截模式
# 网易云音乐广告拦截
host, admusicpic.music.126.net, 拦截模式
host, iadmat.nosdn.127.net, 拦截模式
host, iadmusicmat.music.126.net, 拦截模式
host, iadmusicmatvideo.music.126.net, 拦截模式
# HDOBOX影视App去广告
host-suffix, applovin.com, 拦截模式
host-suffix, applvn.com, 拦截模式
# 通用Emby分流
host-keyword, emby, Emby
# TikTok
host-keyword, tiktok, TikTok
# Github
host-keyword, github, Github
# YouTube
host-keyword, youtube, YouTube
# Google
host-keyword, google, Google
# Spotify
host-keyword, spotify, Spotify
# Twitter
host-keyword, twitter, Twitter
# Netflix
host-keyword, netflix, Netflix
# Disney
host-keyword, disney, Disney
# ChatGPT
host-keyword, openai, ChatGPT
host-suffix, poe.com, ChatGPT
host-suffix, openai.com, ChatGPT
# Telegram
host-keyword, telegram, Telegram
# Instagram
host-keyword, instagram, Instagram
# Facebook
host-keyword, facebook, Facebook
# Microsoft
host-keyword, microsoft, 微软服务
# 系统更新
host, appstoreconnect.apple.com, 系统更新
host, iosapps-ssl.itunes.apple.com, 系统更新
host, itcmobile.itunes.apple.com, 系统更新
host, mesu.apple.com, 系统更新
host, gdmf.apple.com, 系统更新
host, updates-http.cdn-apple.com, 系统更新
host, xp.apple.com, 系统更新
# 苹果服务
host-keyword, apple, 苹果服务
host-keyword, testflight, 苹果服务
host-keyword, icloud, 苹果服务
# 搜狗
host-keyword, sogou, 直连模式
# 京东
host-suffix, jd.com, 直连模式
# 美团
host-keyword, meituan, 直连模式
# 百度
host-keyword, baidu, 直连模式
# 国际代理
host-keyword, steam, 国际代理
host-keyword, xbox, 国际代理
# GeoIP China，直连
GeoIP, CN, 直连模式
# 不在上述规则中(远程以及本地)的剩余请求，将走final 指定的节点/策略，这里即是 → 全球加速, 请根据自己的需求来选择直连或节点、策略
final, 全球加速



#**************************************#
# 远程分流规则订阅，部分规则有先后顺序要求，调整顺序可能失效，将网络请求进行分流，网络请求的走向由匹配到的策略组决定↓↓↓↓↓↓↓↓↓
[filter_remote]
https://raw.githubusercontent.com/lwd-temp/anti-ip-attribution/main/generated/quantumultx.list, tag=显示IP归属地, force-policy=全部节点, update-interval=172800, opt-parser=true, enabled=false
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Speedtest/Speedtest.list, tag=Speedtest测速, force-policy=全部节点, update-interval=172800, opt-parser=true, enabled=false
https://raw.githubusercontent.com/NobyDa/ND-AD/master/QuantumultX/AD_Block.txt, tag=AD_Block, force-policy=拦截模式, update-interval=172800, opt-parser=true, enabled=false
https://raw.githubusercontent.com/NobyDa/ND-AD/master/QuantumultX/AD_Block_Plus.txt, tag=AD_Block_Plus, force-policy=拦截模式, update-interval=86400, opt-parser=true, enabled=false
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Advertising/Advertising.list, tag=Advertising, force-policy=拦截模式, update-interval=172800, opt-parser=true, enabled=false
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Game/Roblox/Roblox.list, tag=Roblox, force-policy=Roblox, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Discord/Discord.list, tag=Discord, force-policy=Discord, update-interval=172800, opt-parser=true, enabled=true
https://nav.qixinpro.com/rules/QuantumultX/gz/mainland.list, tag=大陆服务, force-policy=大陆服务, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Bing/Bing.list, tag=Bing, force-policy=Bing, update-interval=172800, opt-parser=true, enabled=true
https://nav.qixinpro.com/rules/QuantumultX/gz/location.list, tag=地理位置, force-policy=地理位置, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/DouYin/DouYin.list, tag=抖音, force-policy=direct, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/WeChat/WeChat.list, tag=微信直连, force-policy=direct, update-interval=172800, opt-parser=false, enabled=true
https://raw.githubusercontent.com/VirgilClyne/GetSomeFries/main/ruleset/ASN.China.list, tag=国内网站, force-policy=direct, update-interval=172800, opt-parser=true, enabled=true
https://anti-ad.net/surge.txt, tag=Anti-AD, force-policy=拦截模式, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/limbopro/Adblock4limbo/main/Adblock4limbo.list, tag=毒奶规则, force-policy=拦截模式, update-interval=172800, opt-parser=true, enabled=true
https://cdn.jsdelivr.net/gh/blackmatrix7/ios_rule_script@master/rule/QuantumultX/Advertising/Advertising.list, tag=广告拦截, force-policy=拦截模式, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/NobyDa/Script/master/Surge/AdRule.list, tag=广告拦截, force-policy=拦截模式, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Hijacking/Hijacking.list, tag=运营劫持, force-policy=拦截模式, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Privacy/Privacy.list, tag=隐私保护, force-policy=拦截模式, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Emby/Emby.list, tag=Emby, force-policy=Emby, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/TikTok/TikTok.list, tag=TikTok, force-policy=TikTok, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/GitHub/GitHub.list, tag=Github, force-policy=Github, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/YouTube/YouTube.list, tag=YouTube, force-policy=YouTube, update-interval=172800, opt-parser=false, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/YouTubeMusic/YouTubeMusic.list, tag=YouTube Music, force-policy=YouTube, update-interval=172800, opt-parser=false, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Google/Google.list, tag=Google, force-policy=Google, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Spotify/Spotify.list, tag=Spotify, force-policy=Spotify, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Twitter/Twitter.list, tag=Twitter, force-policy=Twitter, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Netflix/Netflix.list, tag=Netflix, force-policy=Netflix, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Disney/Disney.list, tag=Disney, force-policy=Disney, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/OpenAI/OpenAI.list, tag=ChatGPT, force-policy=ChatGPT, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Telegram/Telegram.list, tag=Telegram, force-policy=Telegram, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Instagram/Instagram.list, tag=Instagram, force-policy=Instagram, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Facebook/Facebook.list, tag=Facebook, force-policy=Facebook, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/NetEaseMusic/NetEaseMusic.list, tag=网易云音乐, force-policy=网易云音乐, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Microsoft/Microsoft.list, tag=Microsoft, force-policy=微软服务, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Apple/Apple.list, tag=Apple服务, force-policy=苹果服务, update-interval=86400, opt-parser=true, enabled=true
https://nav.qixinpro.com/rules/QuantumultX/gz/hk-tw.list, tag=港台番剧, force-policy=港台番剧, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/BiliBili/BiliBili.list, tag=哔哩哔哩, force-policy=港台番剧, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/China/China.list, tag=China, force-policy=直连模式, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/ChinaIPs/ChinaIPs.list, tag=ChinaIPs, force-policy=直连模式, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Lan/Lan.list, tag=局域网地址, force-policy=直连模式, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaCompanyIp.list, tag=China公司, force-policy=直连模式, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ChinaDomain.list, tag=China域名, force-policy=直连模式, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/ChinaMedia/ChinaMedia.list, tag=ChinaMedia, force-policy=直连模式, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ACL4SSR/ACL4SSR/master/Clash/ProxyMedia.list, tag=国际媒体, force-policy=国际代理, update-interval=172800, opt-parser=true, enabled=true
https://whatshub.top/rule/ProxyMedia.list, tag=国际媒体, force-policy=国际代理, update-interval=86400, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/rule/QuantumultX/Global/Global.list, tag=全球加速, force-policy=全球加速, update-interval=86400, opt-parser=true, enabled=true



#**************************************#
# 本地重写规则↓↓↓↓↓↓↓↓↓
[rewrite_local]



#**************************************#
# 远程重写↓↓↓↓↓↓↓↓↓
[rewrite_remote]
https://raw.githubusercontent.com/WeiGiegie/666/main/panda.js, tag=百度云视频倍速, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/89996462/Quantumult-X/main/ghs/sssss.js, tag=福利软件通用脚本—彭于晏Crack, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/paynexss/Scripts/main/Scripts/StormSnifferCrack.js, tag=螃蟹2, update-interval=172800, opt-parser=true, enabled=false
https://raw.githubusercontent.com/paynexss/Scripts/main/Scripts/StormSnifferHeader.js, tag=螃蟹1, update-interval=172800, opt-parser=true, enabled=false
https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/WasteCat.js, tag=拦截猫, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/intolive.js, tag=实况壁纸破解, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/Alex0510/Eric/master/surge/Module/kugou.sgmodule, tag=酷狗概念自动领取, update-interval=172800, opt-parser=true, enabled=true
https://whatshub.top/rewrite/BaiduCloud.conf, tag=百度网盘倍速, update-interval=172800, opt-parser=false, enabled=true
https://raw.githubusercontent.com/chxm1023/Rewrite/main/kuake.js, tag=夸克会员, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/Neurogram-R/Quantumult-X/main/snippet/Dualsub.snippet, tag=各种流媒体中文翻译, update-interval=172800, opt-parser=true, enabled=true
https://github.com/ddgksf2013/Rewrite/raw/master/AdBlock/YoutubeAds.conf, tag=YouTbe去广告好使, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/General74110/Quantumult-X/master/Task/Kuwomusic.js, tag=酷我刷广告时长, update-interval=172800, opt-parser=true, enabled=false

#==============App解锁=================#
https://raw.githubusercontent.com/chxm1023/Script_X/main/Collections.conf, tag=App解锁合集, update-interval=172800, opt-parser=false, enabled=true

https://raw.githubusercontent.com/Crazy-Z7/Scrip/main/aptv.js, tag=aptv解锁, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/gjwj666/qx/main/bilibilibd.js, tag=ios鸡神-B站会员, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/gjwj666/qx/main/zhbd.js, tag=ios鸡神-知乎会员, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/gjwj666/qx/main/mgtvhy.conf, tag=ios鸡神-芒果Tv, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/Yuheng0101/X/main/Scripts/NeteaseCloudMusic/netease.js, tag=ios鸡神-网易云1, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/wf021325/qx/master/js/storm.js, tag=螃蟹会员, update-interval=172800, opt-parser=true, enabled=true

https://gitlab.com/ioshkj/quantumultx/-/raw/main/vipjs/aptvpro.conf, tag=APTV恢复pro, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/yqc007/QuantumultX/master/VideoFusionVipCrack.js, tag=剪映9.82, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/gjwj666/qx/main/ximalayabd.js, tag=ios鸡神-喜马拉雅, update-interval=172800, opt-parser=true, enabled=true

https://ghproxy.com/https://raw.githubusercontent.com/yqc007/QuantumultX/master/NeteaseMusicVipCrack.js, tag=网易云|黑胶会员, update-interval=172800, opt-parser=true, enabled=false

https://ghproxy.com/https://raw.githubusercontent.com/jizhi0520/QX/main/wyydcd.js, tag=网易有道词典|会员, update-interval=172800, opt-parser=true, enabled=false

https://ghproxy.com/https://raw.githubusercontent.com/yqc007/QuantumultX/master/WPSuperVIPuserCrack.js, tag=WPS|会员, update-interval=172800, opt-parser=true, enabled=false

https://ghproxy.com/https://raw.githubusercontent.com/RuCu6/QuanX/main/Rewrites/Cube/bilibili.snippet, tag=B站｜广告 4k画质, update-interval=86400, opt-parser=false, enabled=false

https://ghproxy.com/https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/UnlockVip/Spotify.conf, tag=Spotify音乐｜VIP[音质≤高], update-interval=86400, opt-parser=false, enabled=false

https://raw.githubusercontent.com/zwf234/rules/master/QuantumultX/qxrules.conf, tag=奇心破解合集, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/app2smile/rules/master/module/spotify.conf, tag=spotify, update-interval=172800, opt-parser=true, enabled=false



https://raw.githubusercontent.com/zwf234/rules/master/Loon/douyin.plugin, tag=国内抖音去水印, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/APTV.js, tag=APTV-+解锁订阅, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/xt.js, tag=醒图+解锁VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/wps.js, tag=WPS Office+解锁VIP, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/smqnw.js, tag=扫描全能王 +解锁VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/jxydt.js, tag=驾校一点通+解锁VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/pro.js, tag=Launch Center Pro+解锁订阅, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/myxj.js, tag=美颜相机+解锁VIP, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/xmind.js, tag=XMind思维导图+解锁订阅, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/bj.js, tag=B612咔叽+解锁VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/xyjsq.js, tag=迅游手游加速器+解锁VIP, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/mtxx.js, tag=美图秀秀+解锁VIP 💞, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/kwyy.js, tag=酷我VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/xunlei.js, tag=迅雷VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/PDFExpert.js, tag=PDF点晴解锁, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/lightroom.js, tag=Lightroom照片解锁, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/MIX.js, tag=MX滤镜大师解锁, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/wsgj.js, tag=网速管家VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/wscsds.js, tag=网速测试大师解锁, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/Quike.js, tag=全能小组件解锁, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/qyxj.js, tag=轻颜相机VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/gx/XMLY.js, tag=喜马拉雅VIP, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/bdwk.js, tag=百度文库破解, update-interval=172800, opt-parser=true, enabled=false

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/widgets.js, tag=万能小组件解锁, update-interval=172800, opt-parser=true, enabled=true

https://raw.githubusercontent.com/89996462/Quantumult-X/main/ycdz/Picsart.js, tag=Picsart美易VIP破解, update-interval=172800, opt-parser=true, enabled=false

https://qxnav.com/rules/QuantumultX/gz/bilibili.conf, tag=哔哩哔哩, update-interval=172800, opt-parser=true, enabled=false

https://github.com/ddgksf2013/Rewrite/raw/master/UnlockVip/Spotify.conf, tag=Spotify音乐VIP, update-interval=86400, opt-parser=false, enabled=false



#===============Cookie================#
# 获取京东cookie 「浏览器打开 https://bean.m.jd.com/bean/signIndex.action 登录后自动获取Cookie」
https://raw.githubusercontent.com/chxm1023/Rewrite/main/HQ_Cookie.conf, tag=获取Cookie合集, update-interval=-1, opt-parser=true, enabled=false


#==============App扩展=================#
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-JP.conf, tag=TikTok-日本, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-TW.conf, tag=TikTok-台湾, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-US.conf, tag=TikTok-美国, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-SG.conf, tag=TikTok-新加坡, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-RU.conf, tag=TikTok-俄罗斯, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-KR.conf, tag=TikTok-韩国, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-FR.conf, tag=TikTok-法国, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-VN.conf, tag=TikTok-越南, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/TikTok/TikTok-TH.conf, tag=TikTok-泰国, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/Orz-3/QuantumultX/master/Netflix_ratings.conf, tag=Netflix评分, update-interval=-1, opt-parser=false, enabled=false
https://raw.githubusercontent.com/chxm1023/Rewrite/main/jd_price_lite.js, tag=京东比价-弹窗版, update-interval=-1, opt-parser=true, enabled=false
https://raw.githubusercontent.com/Orz-3/QuantumultX/master/JD_TB_price.conf, tag=京东比价-插件版, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/Orz-3/QuantumultX/master/Bili_Auto_Regions.conf, tag=Bilibili-换区脚本, update-interval=172800, opt-parser=true, enabled=true
https://nav.qixinpro.com/rules/QuantumultX/gz/bilibili.conf, tag=BiliBili-Enhanced, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/zZPiglet/Task/master/UnblockURLinWeChat.conf, tag=解除微信链接限制, update-interval=172800, opt-parser=false, enabled=true
https://raw.githubusercontent.com/NobyDa/Script/master/TestFlight/TestFlightAccount.js, tag=TestFlight账户管理, update-interval=-1, opt-parser=true, enabled=true
https://raw.githubusercontent.com/chxm1023/Rewrite/main/YouTube_cc.conf#out=Hant, tag=YouTube字幕翻译, update-interval=-1, opt-parser=false, enabled=true


#==============广告重写=================#
https://raw.githubusercontent.com/chxm1023/Advertising/main/AppAd.conf, tag=App广告拦截, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/StartUp.conf, tag=去除应用广告/开屏广告, update-interval=172800, opt-parser=true, enabled=true
http://limbopro.xyz/Adblock4limbo.conf, tag=毒奶广告规则, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/chxm1023/Advertising/main/YouTube/YoutubeAds.conf, tag=YouTube去广告, update-interval=172800, opt-parser=true, enabled=false
https://raw.githubusercontent.com/ddgksf2013/Rewrite/master/AdBlock/Amap.conf, tag=高德地图-AD净化, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/app2smile/rules/master/module/tieba-qx.conf, tag=百度贴吧超级去广告, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/blackmatrix7/ios_rule_script/master/script/zheye/zheye.snippet, tag=知乎去广告及体验增强, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/chxm1023/Rewrite/main/Bilibili/Bilibili.conf, tag=B站去广告+1080P高码率, update-interval=2592000, opt-parser=false, enabled=true
https://raw.githubusercontent.com/zmqcherish/proxy-script/main/weibo.conf, tag=微博去广告, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/xiaomaoJT/QxScript/main/rewrite/script/QX_XiaoMao_rw1.conf, tag=去广告脚本, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/xiaomaoJT/QxScript/main/rewrite/script/QX_XiaoMao_rw3.conf, tag=去广告重写, update-interval=172800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/NobyDa/Script/master/QuantumultX/Rewrite_lhie1.conf, tag=去广告重写, update-interval=172800, opt-parser=true, enabled=true
https://ghproxy.com/https://raw.githubusercontent.com/DivineEngine/Profiles/master/Quantumult/Rewrite/General.conf, tag=神机重定向, update-interval=604800, opt-parser=true, enabled=false


#==============网页优化=================#
https://raw.githubusercontent.com/chxm1023/Advertising/main/WebAdBlock.conf, tag=影视网站去广告, update-interval=604800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/chxm1023/Rewrite/main/Q-Search.conf, tag=Safari超级搜索, update-interval=604800, opt-parser=true, enabled=true
https://raw.githubusercontent.com/chxm1023/Rewrite/main/spjx.conf, tag=视频解析, update-interval=172800, opt-parser=true, enabled=false


#=======添加Boxjs，Sub-Store支持========#
# 备用Sub-Store
https://raw.githubusercontents.com/Peng-YM/Sub-Store/master/config/QX.snippet, tag=Sub Store, update-interval=172800, opt-parser=false, enabled=true
# 备用Boxjs http_backend如果有问题，可以添加下面重写内容
https://raw.githubusercontent.com/chavyleung/scripts/master/box/rewrite/boxjs.rewrite.quanx.conf, tag=BoxJS, update-interval=172800, opt-parser=true, enabled=true



#**************************************#
# 脚本配置↓↓↓↓↓↓↓↓↓
[task_local]
0 */6 * * ? https://raw.githubusercontent.com/chxm1023/Task/main/dns-clear-cache.js, tag=清理Dns缓存, img-url=https://raw.githubusercontent.com/chxm1023/Task/main/icon/clean.png, enabled=true
10 0 * * ? https://raw.githubusercontent.com/chxm1023/Task/main/hljk.js, tag=汇率监控, img-url=https://raw.githubusercontent.com/chxm1023/Task/main/icon/hljk.png, enabled=true


#============Boxjs备份还原==============#
5 10 * * * https://raw.githubusercontent.com/dompling/Script/master/gist/restore.js, tag=Gist恢复, img-url=https://raw.githubusercontent.com/chxm1023/Task/main/icon/box.png, enabled=false
0 10 * * * https://raw.githubusercontent.com/dompling/Script/master/gist/backup.js, tag=Gist备份, img-url=https://raw.githubusercontent.com/chxm1023/Task/main/icon/box.png, enabled=false


#============流媒体解锁查询==============#
event-interaction https://raw.githubusercontent.com/getsomecat/Qx/main/Net_Speed.js, tag=⚡️ Net Speed, img-url=bolt.square.fill.system, enabled=true
event-interaction https://raw.githubusercontent.com/I-am-R-E/QuantumultX/main/TaskLocal/NeteaseMusicUnlockCheck.js, tag=查询网易云音乐解锁, img-url=https://raw.githubusercontent.com/Orz-3/mini/master/Color/Clubhouse.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/streaming-ui-check.js, tag=流媒体-解锁查询, img-url=checkmark.seal.system, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/geo_location.js, tag=GeoIP 查询, img-url=location.fill.viewfinder.system, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/ytb-ui-check.js, tag=YouTube 查询, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/YouTube_Letter.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/nf-ui-check.js, tag=Netflix 查询, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Netflix_Letter.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/disney-ui-check.js, tag=Disneyᐩ 查询, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Disney.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/switch-check-ytb.js, tag=YouTube 切换, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/YouTube_Letter.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/switch-check-nf.js, tag=Netflix 切换, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Netflix_Letter.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/switch-check-disneyplus.js, tag=Disneyᐩ 切换, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Disney.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/switch-check-google.js, tag=Google 切换, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Google_Search.png, enabled=true
event-interaction https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/traffic-check.js, tag=策略流量查询, img-url=https://raw.githubusercontent.com/Koolson/Qure/master/IconSet/Color/Download.png, enabled=true


#==============脚本仓库=================#
# 流媒体Task订阅
; https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/UI-Action.json
# 奇心
; https://ghproxy.com/https://raw.githubusercontent.com/shufflewzc/faker/main/qx.json
# Peng-YM
; https://raw.githubusercontent.com/Peng-YM/QuanX/master/Tasks/task.json
; https://gist.githubusercontent.com/Peng-YM/cc2cd6205b305d36544a44ec77129832/raw/gallery.json
# ydj0602
; https://gitee.com/ydj0602/hym/raw/master/Ease1.json
# ChuheGit
; https://dove.589669.xyz/task2qxgallery?sub=https://raw.githubusercontent.com/ChuheGit/1/main/Surge/Module/Task.sgmodule&img=1
# HotKids
; https://raw.githubusercontent.com/HotKids/Rules/master/Quantumult/X/TaskGallery.json
# HuiDoY
; https://raw.githubusercontent.com/HuiDoY/QX_Task/main/H.json
# Tartarus2014
; https://raw.githubusercontent.com/Tartarus2014/QuantumultX-Script/main/Task.json
# KOP-XIAO
; https://raw.githubusercontent.com/KOP-XIAO/QuantumultX/master/Scripts/UI-Action.json



#**************************************#
[http_backend]
# Boxjs设置，改为使用http backend方式，访问地址改为http://127.0.0.1:9999，更新配置后请长按风车-更新，然后重启代理
https://raw.githubusercontent.com/chavyleung/scripts/master/box/chavy.boxjs.js, tag=BoxJs, path=^/, img-url=https://raw.githubusercontent.com/Orz-3/task/master/box.png, enabled=true



#**************************************#
[mitm]
# 跳过证书验证
skip_validating_cert = true
force_sni_domain_name = false
# 添加主机名
hostname =

########################################
# passphrase和p12代为证书&主机名部分，可去UI界面自行生成并安装证书，会在此生成对应信息，也可在更新配置前可把旧的配置中passphrase和p12代码拷贝下来, 导入新的配置文件把内容粘贴在对应位置就不用重装证书。

passphrase = 222C2F1A
p12 = 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
