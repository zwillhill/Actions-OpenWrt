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
# Only compile K3
sed -i 's|^TARGET_|#TARGET_|g; s|#TARGET_DEVICES += phicomm|TARGET_DEVICES += phicomm|' target/linux/bcm53xx/image/Makefile
#============================================================
# use luci 19.07
#sed -i 's/luci.git/luci.git;openwrt-19.07/' feeds.conf.default
#============================================================
# use dnsmasq-full & add luci
#sed -i 's|dnsmasq \\|dnsmasq-full \\|' include/target.mk
#sed -i '/odhcp6c/i\\tluci \\' include/target.mk
sed -i 's|dnsmasq iptables|default-settings dnsmasq-full luci luci-compat iptables|' include/target.mk
#============================================================
#修改校时服务器
sed -i 's/0.openwrt.pool.ntp.org/ntp.aliyun.com/' package/base-files/files/bin/config_generate
sed -i 's/1.openwrt.pool.ntp.org/time1.cloud.tencent.com/' package/base-files/files/bin/config_generate
sed -i 's/2.openwrt.pool.ntp.org/time.ustc.edu.cn/' package/base-files/files/bin/config_generate
sed -i 's/3.openwrt.pool.ntp.org/cn.pool.ntp.org/' package/base-files/files/bin/config_generate
#修改banner
sed -i '1,5d' package/base-files/files/etc/banner
sed -i '1i\  _______                     ________        __'  package/base-files/files/etc/banner
sed -i '2i\ |   |   |.---.-.-----.-----.|  |  |  |.----.|  |_ '  package/base-files/files/etc/banner
sed -i '3i\ |       ||  _  |     |-- __||  |  |  ||   _||   _|'  package/base-files/files/etc/banner
sed -i '4i\ |___|___||___._|__|__|_____||________||__|  |____|'  package/base-files/files/etc/banner
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
#svn co https://github.com/coolsnowwolf/lede/trunk/tools/upx tools/upx
#svn co https://github.com/coolsnowwolf/lede/trunk/tools/ucl tools/ucl
#sed -i '/tools-y += patchelf/a\tools-y += upx ucl' tools/Makefile
#sed -i '/builddir dependencies/a\$(curdir)\/upx\/compile := $(curdir)\/ucl\/compile' tools/Makefile
#============================================================
