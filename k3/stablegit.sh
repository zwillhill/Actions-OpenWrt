#!/bin/bash
#
# OpenWrt K3 Stable Git.sh
#

# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
#============================================================
# Add default-settings
svn co https://github.com/zwillhill/actions-openwrt/trunk/packages/default-settings package/zwillhill/default-settings
#============================================================
# Add k3screenctrl
git clone https://github.com/lwz322/k3screenctrl_build.git package/lwz322/k3screenctrl
# Add luci-app-k3screenctrl
git clone https://github.com/lwz322/luci-app-k3screenctrl.git package/lwz322/luci-app-k3screenctrl
#============================================================
# Add luci-theme-darkmatter with moded one
svn co https://github.com/rufengsuixing/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter package/rufengsuixing/luci-theme-darkmatter
sed -i 's#../../luci.mk#$(TOPDIR)/feeds/luci/luci.mk#' package/rufengsuixing/luci-theme-darkmatter/Makefile
#============================================================
# Add luci-app-vssr
git clone https://github.com/jerrykuku/lua-maxminddb.git package/jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr.git package/jerrykuku/luci-app-vssr

# Add some depends
git clone https://github.com/xiaorouji/openwrt-passwall package/xiaorouji/openwrt-passwall
svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
sed -i '/tools-y += patchelf/a\tools-y += upx ucl' tools/Makefile
sed -i '/builddir dependencies/a\$(curdir)\/upx\/compile := $(curdir)\/ucl\/compile' tools/Makefile
#============================================================
