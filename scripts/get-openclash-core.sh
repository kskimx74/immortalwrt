ARCH=amd64
if [ ! -z $1 ]
then
  ARCH=$1
fi
# Add openclash

cd /workdir/openwrt
mkdir -p files/etc/openclash/core

clash_main_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/Clash | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_tun_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN-Premium | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')
clash_game_url=$(curl -sL https://api.github.com/repos/vernesong/OpenClash/releases/tags/TUN | grep /clash-linux-$ARCH | sed 's/.*url\": \"//g' | sed 's/\"//g')

wget -qO- $clash_main_url | gunzip -c > files/etc/openclash/core/clash
wget -qO- $clash_tun_url  | gunzip -c > files/etc/openclash/core/clash_tun
wget -qO- $clash_game_url | tar xOvz > files/etc/openclash/core/clash_game

chmod +x files/etc/openclash/core/clash*
