# $WORK_DIR/trunk 执行在这个目录下，修改一些默认参数位置在 ./user/shared/defaults.h
set -u

echo "版本号添加时间"
VERSION_TIME=$(TZ='Asia/Shanghai' date '+%Y%m%d')
sed -i "s/FIRMWARE_BUILDS_REV=[0-9]*/FIRMWARE_BUILDS_REV=$VERSION_TIME/g" ./versions.inc

echo "WEB页面添加个人信息"
valtime=$(TZ='Asia/Shanghai' date '+%Y-%m-%d %H:%M')
val2="\\1 footer_code +='编译日期 $valtime by <a href=\"https://github.com/weln2020/router-rom\" target=\"blank\">WELN</a> \& <a href=\"https://www.right.com.cn/forum/thread-6896728-1-1.html\" target=\"blank\">恩山论坛</a><br>';"
echo $val2
sed -i "s#\(.*Non-Commercial Use Only[^;]*;\).*#$val2#" user/www/n56u_ribbon_fixed/state.js
grep "Non-Commercial Use Only" user/www/n56u_ribbon_fixed/state.js

################################################################################################
# 因不同型号配置功能不一样，所以先把配置项删除，如果你自己要添加其他的，也要写上删除这一条，切记！！！
################################################################################################

sed -i 's/CONFIG_FIRMWARE_INCLUDE_OPENSSL_EXE=n/CONFIG_FIRMWARE_INCLUDE_OPENSSL_EXE=y/g' .config

# Default
sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR/d" .config           # 删除配置项 dropbear SSH
sed -i "/CONFIG_FIRMWARE_INCLUDE_DROPBEAR_FAST_CODE/d" .config # 删除配置项 dropbear symmetrica
sed -i "/CONFIG_FIRMWARE_INCLUDE_OPENSSH/d" .config            # 删除配置项 OpenSSH
sed -i "/CONFIG_FIRMWARE_INCLUDE_DDNS_SSL/d" .config           # HTTPS support for DDNS client
sed -i "/CONFIG_FIRMWARE_INCLUDE_HTTPS/d" .config              # HTTPS support

# C大
sed -i "/CONFIG_FIRMWARE_INCLUDE_MENTOHUST/d" .config          # 删除配置项 MENTOHUST
sed -i "/CONFIG_FIRMWARE_INCLUDE_SCUTCLIENT/d" .config         # 删除配置项 SCUTCLIENT
sed -i "/CONFIG_FIRMWARE_INCLUDE_SHADOWSOCKS/d" .config        # 删除配置项 SS plus+
sed -i "/CONFIG_FIRMWARE_INCLUDE_SSSERVER/d" .config           # 删除配置项 SS server
sed -i "/CONFIG_FIRMWARE_INCLUDE_DNSFORWARDER/d" .config       # 删除配置项 DNS-FORWARDER
sed -i "/CONFIG_FIRMWARE_INCLUDE_ADBYBY/d" .config             # 删除配置项 adbyby plus+
sed -i "/CONFIG_FIRMWARE_INCLUDE_TUNSAFE/d" .config            # 删除配置项 TUNSAFE
sed -i "/CONFIG_FIRMWARE_INCLUDE_ALIDDNS/d" .config            # 删除配置项 阿里 DDNS
sed -i "/CONFIG_FIRMWARE_INCLUDE_SMARTDNS/d" .config           # 删除配置项 smartDns
sed -i "/CONFIG_FIRMWARE_INCLUDE_SRELAY/d" .config             # 删除配置项 srelay 代理
sed -i "/CONFIG_FIRMWARE_INCLUDE_WYY/d" .config                # 删除配置项 网易云解锁
sed -i "/CONFIG_FIRMWARE_INCLUDE_WYYBIN/d" .config             # 删除配置项 网易云解锁GO版本执行文件（4M多）注意固件超大小
