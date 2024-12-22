#!/bin/bash -e

svn_export() {
	# 参数1是分支名, 参数2是子目录, 参数3是目标目录, 参数4仓库地址
 	echo -e "clone $4/$2 to $3"
	TMP_DIR="$(mktemp -d)" || exit 1
 	ORI_DIR="$PWD"
	[ -d "$3" ] || mkdir -p "$3"
	TGT_DIR="$(cd "$3"; pwd)"
	git clone --depth 1 -b "$1" "$4" "$TMP_DIR" >/dev/null 2>&1 && \
	cd "$TMP_DIR/$2" && rm -rf .git >/dev/null 2>&1 && \
	cp -af . "$TGT_DIR/" && cd "$ORI_DIR"
	rm -rf "$TMP_DIR"
}
# svn_export "master" "applications/luci-app-wechatpush" "feeds/luci/applications/luci-app-wechatpush" "https://github.com/immortalwrt/luci"

# backup feeds
shopt -s extglob
mkdir -p /tmp/extd/
mv */ /tmp/extd/


# download
git clone https://github.com/sirpdboy/sirpdboy-package sirpdboy-package -b main --depth 1
mv sirpdboy-package/luci-app-adguardhome ./
# mv sirpdboy-package/luci-app-fileassistant ./

rm -rf luci-app-adguardhome/{.git}
rm -rf sirpdboy-package

git clone https://github.com/muink/openwrt-netdata-ssl netdata-ssl -b master --depth 1
rm -rf netdata-ssl/{.git,LICENSE}

git clone https://github.com/muink/luci-app-netdata luci-app-netdata -b master --depth 1
rm -rf luci-app-netdata/{.git,LICENSE}

git clone https://github.com/sbwml/luci-app-filemanager luci-app-filemanager --depth 1
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

git clone https://github.com/sirpdboy/luci-app-netwizard luci-app-netwizard --depth 1
rm -rf luci-app-netwizard/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/luci-app-parentcontrol luci-app-parentcontrol --depth 1
rm -rf luci-app-parentcontrol/{.git,.github,LICENSE}

git clone https://github.com/sirpdboy/luci-app-chatgpt-web luci-app-chatgpt-web --depth 1
rm -rf luci-app-chatgpt-web/{.git,LICENSE}

git clone https://github.com/tty228/luci-app-wechatpush luci-app-wechatpush -b master --depth 1
rm -rf luci-app-wechatpush/{.git,.github,LICENSE,README_en.md}

git clone https://github.com/kiddin9/luci-app-syscontrol luci-app-syscontrol --depth 1
rm -rf luci-app-syscontrol/{.git,.github,LICENSE,README_en.md}

# git clone https://github.com/pymumu/luci-app-smartdns luci-app-smartdns -b master --depth 1
# rm -rf luci-app-smartdns/{.git,po/de,po/es,po/pt-BR,po/templates,po/zh_Hant}
# sed -i 's|include ../../luci.mk|include $(TOPDIR)/feeds/luci/luci.mk|' luci-app-smartdns/Makefile

git clone https://github.com/kenzok8/small-package small-package -b main --depth 1

# mv small-package/smartdns ./
mv small-package/lucky ./
mv small-package/adguardhome ./
rm -rf small-package

git clone https://github.com/kiddin9/kwrt-packages kwrt-packages -b main --depth 1
mv kwrt-packages/luci-app-advancedplus ./
rm -rf kwrt-packages

git clone https://github.com/immortalwrt/luci immortalwrt-luci -b master --depth 1
mv immortalwrt-luci/applications/luci-app-smartdns ./
rm -rf luci-app-smartdns{.git,/po/!(templates|zh_Hans)}
sed -i 's|include ../../luci.mk|include $(TOPDIR)/feeds/luci/luci.mk|' luci-app-smartdns/Makefile
rm -rf immortalwrt-luci

git clone https://github.com/immortalwrt/packages immortalwrt-packages -b master --depth 1
mv immortalwrt-packages/net/smartdns ./
rm -rf immortalwrt-packages

# 输出目录列表并保存到 packages.txt
# ls -d */ | xargs -n 1 basename | paste -sd ' ' - > packages.txt
ls -d */ | xargs -n 1 basename > packages.txt

