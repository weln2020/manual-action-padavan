# $WORK_DIR/trunk 执行在这个目录下，修改一些默认参数位置在 ./user/shared/defaults.h
set -u

# 1. 修改默认参数 ./user/shared/defaults.h

USER_NAME="admin"                       # 用户名 admin
USER_PASSWORD=$USER_NAME                # 用户密码 admin
LAN_IP="192.168.3"                      # lan 地址 192.168.3.1 一定别写后面的 .1
WIFI_PASSWORD="1234567890"              # wifi密码，切记密码最少8位 admin
VERSION_TIME=$(date "+%Y%m%d")          # 更新时间版本号: 20200320
DEFAULT_PATH="./user/shared/defaults.h" # 默认文件配置目录

echo '修改用户名'
sed -i 's/#define\s*SYS_USER_ROOT\s*"admin"/#define  SYS_USER_ROOT     "'$USER_NAME'"/g' $DEFAULT_PATH

echo '修改密码'
sed -i 's/#define\s*DEF_ROOT_PASSWORD\s*"admin"/#define  DEF_ROOT_PASSWORD     "'$USER_PASSWORD'"/g' $DEFAULT_PATH

echo "修改Lan ip"
sed -i "s/192.168.2/$LAN_IP/g" $DEFAULT_PATH

echo "修改Wif密码"
sed -i "s/1234567890/$WIFI_PASSWORD/g" $DEFAULT_PATH

echo "更新版本号时间"
sed -i "s/FIRMWARE_BUILDS_REV=[0-9]*/FIRMWARE_BUILDS_REV=$VERSION_TIME/g" ./versions.inc

# 2. 路由器页面下加入编译时间和个人信息标签

cd /opt/rt-n56u/trunk
valtime=$(TZ='Asia/Shanghai' date '+%Y-%m-%d %H:%M')
val2="\\1 footer_code +='编译日期 $valtime by <a href=\"https://github.com/tick-guo/router-rom\" target=\"blank\">tick-guo</a> \& <a href=\"https://www.right.com.cn/forum/thread-5853731-1-1.html\" target=\"blank\">恩山论坛</a><br>';"
sed -i "s#\(.*Non-Commercial Use Only[^;]*;\).*#$val2#" user/www/n56u_ribbon_fixed/state.js
grep "Non-Commercial Use Only" user/www/n56u_ribbon_fixed/state.js

# 3. 删除预设项
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
