# GFWIistforAndroidSSR
Copy from shadowsocksrr/shadowsocksr-android.Added some missing websites.

从 https://github.com/shadowsocks/shadowsocks-android 复制而来，添加了一些网站

绕过了gcm推送服务，避免有可能出现的gcm时断时续问题

更新地址：https://raw.githubusercontent.com/CJieLuo/GFWIistforAndroidSSR/master/gfwlist.acl


## 增加CheckAccess.sh
用于检测acl中的网站是否有效
* 只能检测类似^(.*\\.)?akamaized\\.net$的格式
* 执行前请将acl与CheckAccess.sh置于同一目录
* 使用ping和curl来检测网站
* 执行后在目录下生成NoNeedToProxy.txt(ping无丢包) fail.txt(curl输出除200外的http错误代码)
