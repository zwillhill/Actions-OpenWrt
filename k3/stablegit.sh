#!/bin/bash
#
# OpenWrt K3 Stable Git.sh
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
############################

# Add upx
svn co https://github.com/Lienol/openwrt/trunk/main/tools/upx tools/upx

# Replace k3screenctrl
#rm -rf package/lean/k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/lwz322/k3screenctrl
# Add luci-app-k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/lwz322/luci-app-k3screenctrl

# Replace luci-app-dnsfilter
#rm -rf package/lean/luci-app-dnsfilter
git clone https://github.com/garypang13/luci-app-dnsfilter.git package/garypang13/luci-app-dnsfilter

# Add luci-theme-darkmatter with moded one
svn co https://github.com/zwillhill/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/apollo-ng/luci-theme-darkmatter

# Add luci-app-bypass
git clone https://github.com/garypang13/openwrt-bypass.git package/garypang13/openwrt-bypass

# Add bypass depends
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/xiaorouji/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/xiaorouji/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/xiaorouji/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs package/xiaorouji/simple-obfs
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks package/xiaorouji
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2 package/coolsnowwolf/redsocks2
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/fw876/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/fw876/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/trunk/tcping package/fw876/tcping
svn co https://github.com/fw876/helloworld/trunk/v2ray-core package/fw876/v2ray-core
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/fw876/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/xray-core package/fw876/xray-core
svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/fw876/xray-plugin
