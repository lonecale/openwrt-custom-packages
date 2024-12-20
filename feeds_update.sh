#!/bin/bash -e

# backup feeds
shopt -s extglob
mkdir -p /tmp/extd/
mv */ /tmp/extd/

# download feeds
git clone https://github.com/sirpdboy/sirpdboy-package sirpdboy-package -b main --depth 1
mv sirpdboy-package/luci-app-adguardhome ./
# mv sirpdboy-package/luci-app-fileassistant ./

# 如果需要清理 luci-app-adguardhome 中的 .git、LICENSE、README.md，可以取消注释下面这一行
rm -rf luci-app-adguardhome/{.git}
rm -rf sirpdboy-package

git clone https://github.com/sbwml/luci-app-filemanager luci-app-filemanager --depth 1
rm -rf luci-app-filemanager/{.git}
rm -rf luci-app-filemanager/.git

# git clone https://github.com/gdy666/luci-app-lucky luci-app-lucky --depth 1
git clone https://github.com/sirpdboy/luci-app-lucky luci-app-lucky --depth 1
mv luci-app-lucky/luci-app-lucky/* luci-app-lucky/
rm -rf luci-app-lucky/{.git,.github,LICENSE,lucky,previews}

git clone https://github.com/sirpdboy/luci-app-autotimeset luci-app-autotimeset --depth 1
rm -rf luci-app-autotimeset/{.git,.github,LICENSE}

# git clone https://github.com/sirpdboy/luci-app-advancedplus luci-app-advancedplus --depth 1
# rm -rf luci-app-advancedplus/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/luci-app-ddns-go luci-app-ddns-go --depth 1
rm -rf luci-app-ddns-go/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/luci-app-partexp luci-app-partexp --depth 1
rm -rf luci-app-partexp/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/netspeedtest luci-app-netspeedtest --depth 1
rm -rf luci-app-netspeedtest/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/luci-theme-kucat -b js --depth 1
rm -rf luci-theme-kucat/{.git,LICENSE}

git clone https://github.com/sirpdboy/luci-app-eqosplus luci-app-eqosplus --depth 1
rm -rf luci-app-eqosplus/{.git,LICENSE}

git clone https://github.com/sirpdboy/luci-app-wizard luci-app-wizard --depth 1
rm -rf luci-app-wizard/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/luci-app-parentcontrol luci-app-parentcontrol --depth 1
rm -rf luci-app-parentcontrol/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/luci-app-chatgpt-web luci-app-chatgpt-web --depth 1
rm -rf luci-app-chatgpt-web/{.git,LICENSE}

git clone https://github.com/tty228/luci-app-wechatpush luci-app-wechatpush -b master --depth 1
rm -rf luci-app-wechatpush/{.git,.github,LICENSE,README_en.md}

git clone https://github.com/kiddin9/luci-app-syscontrol luci-app-syscontrol --depth 1
rm -rf luci-app-syscontrol/{.git,.github,LICENSE,README_en.md}

git clone https://github.com/kenzok8/small-package small-package -b main --depth 1

mv small-package/smartdns ./
mv small-package/luci-app-smartdns ./
mv small-package/lucky ./
mv small-package/adguardhome ./
rm -rf luci-app-smartdns/{.git}
rm -rf small-package

git clone https://github.com/kiddin9/kwrt-packages kwrt-packages -b main --depth 1
mv kwrt-packages/luci-app-advancedplus ./
rm -rf kwrt-packages

# 输出目录列表并保存到 packages.txt
# ls -d */ | xargs -n 1 basename | paste -sd ' ' - > packages.txt
ls -d */ | xargs -n 1 basename > packages.txt

