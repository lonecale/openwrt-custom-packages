#!/bin/bash -e

# backup feeds
shopt -s extglob
mkdir -p /tmp/extd/
mv */ /tmp/extd/

# download feeds
git clone https://github.com/sirpdboy/sirpdboy-package sirpdboy-package -b main --depth 1
mv sirpdboy-package/luci-app-adguardhome ./
# 如果需要清理 luci-app-adguardhome 中的 .git、LICENSE、README.md，可以取消注释下面这一行
rm -rf luci-app-adguardhome/{.git,po/zh_Hans}
rm -rf sirpdboy-package

git clone https://github.com/gdy666/luci-app-lucky luci-app-lucky --depth 1
rm -rf luci-app-lucky/{.git,LICENSE,previews}

git clone https://github.com/sirpdboy/luci-app-autotimeset luci-app-autotimeset --depth 1
rm -rf luci-app-autotimeset/{.git,LICENSE,po/zh_Hans}

git clone https://github.com/sirpdboy/luci-app-advancedplus luci-app-advancedplus --depth 1
rm -rf luci-app-advancedplus/{.git,LICENSE,po/zh_Hans}

git clone https://github.com/sirpdboy/luci-app-ddns-go luci-app-ddns-go --depth 1
rm -rf luci-app-ddns-go/{.git,LICENSE,luci-app-ddns-go/po/zh_Hans}

git clone https://github.com/sirpdboy/luci-app-partexp luci-app-partexp --depth 1
rm -rf luci-app-partexp/{.git,LICENSE,po/zh_Hans}

git clone https://github.com/sirpdboy/netspeedtest luci-app-netspeedtest --depth 1
rm -rf luci-app-netspeedtest/{.git,LICENSE,luci-app-netspeedtest/po/zh_Hans}

git clone https://github.com/sirpdboy/luci-theme-kucat -b js --depth 1
rm -rf luci-theme-kucat/{.git,LICENSE}

git clone https://github.com/sirpdboy/luci-app-eqosplus luci-app-eqosplus --depth 1
rm -rf luci-app-eqosplus/{.git,LICENSE,po/zh_Hans}

git clone https://github.com/sirpdboy/luci-app-wizard luci-app-wizard --depth 1
rm -rf luci-app-wizard/{.git,LICENSE,po/zh_Hans}

git clone https://github.com/sirpdboy/luci-app-parentcontrol luci-app-parentcontrol --depth 1
rm -rf luci-app-parentcontrol/{.git,LICENSE,po/zh_Hans}

git clone https://github.com/sirpdboy/luci-app-chatgpt-web luci-app-chatgpt-web --depth 1
rm -rf luci-app-chatgpt-web/{.git,LICENSE,po/zh_Hans}

git clone https://github.com/kenzok8/openwrt-packages kenzo-package -b master --depth 1
mv kenzo-package/smartdns ./
mv kenzo-package/luci-app-smartdns ./
rm -rf luci-app-smartdns/{.git,po/zh_Hans}
rm -rf kenzo-package


# 输出目录列表并保存到 packages.txt
ls -d */ | xargs -n 1 basename | paste -sd ' ' - > packages.txt
