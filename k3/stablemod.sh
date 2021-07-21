#!/bin/bash
#
# OpenWrt K3 stable Mod.sh
#

# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
#============================================================
# Modify files permission
#chmod -R 755 files
#============================================================
# Only compile K3
sed -i 's|^TARGET_|#TARGET_|g; s|#TARGET_DEVICES += phicomm_k3|TARGET_DEVICES += phicomm_k3|' target/linux/bcm53xx/image/Makefile
#============================================================
# Display temperature on index (not work on 19.07)
#sed -i "/<tr><td width=\"33%\"><%:CPU usage (%)%>/a \ \t\t<tr><td width=\"33%\"><%:CPU Temperature %>（℃）</td><td><%=luci.sys.exec(\"sed 's/../&./g' /sys/class/thermal/thermal_zone0/temp|cut -c1-5\")%>℃</td></tr>"  feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_status/index.htm
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
