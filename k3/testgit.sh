#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
############################

# Replace k3screenctrl
#rm -rf package/lean/k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/lwz322/k3screenctrl
# Add luci-app-k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/lwz322/luci-app-k3screenctrl

# Replace luci-app-dnsfilter
#rm -rf package/lean/luci-app-dnsfilter
#git clone https://github.com/garypang13/luci-app-dnsfilter.git package/garypang13/luci-app-dnsfilter

# Add luci-theme-darkmatter with moded one
svn co https://github.com/zwillhill/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/apollo-ng/luci-theme-darkmatter

# Add luci-app-bypass
git clone https://github.com/garypang13/openwrt-bypass.git package/garypang13/openwrt-bypass

# Add bypass depends
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/chinadns-ng package/xiaorouji/chinadns-ng
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-go package/xiaorouji/trojan-go
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/trojan-plus package/xiaorouji/trojan-plus
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/simple-obfs
svn co https://github.com/xiaorouji/openwrt-passwall/trunk/microsocks
svn co https://github.com/coolsnowwolf/lede/trunk/package/lean/redsocks2
svn co https://github.com/fw876/helloworld/trunk/naiveproxy package/fw876/naiveproxy
svn co https://github.com/fw876/helloworld/trunk/shadowsocksr-libev package/fw876/shadowsocksr-libev
svn co https://github.com/fw876/helloworld/trunk/tcping package/fw876/tcping
svn co https://github.com/fw876/helloworld/trunk/v2ray-core package/fw876/v2ray-core
svn co https://github.com/fw876/helloworld/trunk/v2ray-plugin package/fw876/v2ray-plugin
svn co https://github.com/fw876/helloworld/trunk/xray-core package/fw876/xray-core
svn co https://github.com/fw876/helloworld/trunk/xray-plugin package/fw876/xray-plugin

# Add luci-apps
git clone https://github.com/rufengsuixing/luci-app-adguardhome.git package/rufengsuixing/luci-app-adguardhome
git clone https://github.com/xiaorouji/openwrt-passwall package/xiaorouji/openwrt-passwall
#git clone https://github.com/vernesong/OpenClash package/vernesong/OpenClash
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/vernesong/luci-app-openclash
git clone https://github.com/small-5/luci-app-adblock-plus package/small-5
git clone https://github.com/fw876/helloworld package/fw876/helloworld
git clone https://github.com/jerrykuku/luci-app-vssr package/jerrykuku/luci-app-vssr
rm -rf  package/lean/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon package/jerrykuku/luci-theme-argon
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/jerrykuku/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config package/jerrykuku/luci-app-argon-config
git clone https://github.com/tty228/luci-app-serverchan package/tty228/luci-app-serverchan
git clone https://github.com/sirpdboy/luci-app-advanced package/sirpdboy/luci-app-advanced
