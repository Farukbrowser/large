#!/bin/bash
# My Telegram : https://t.me/zerossl
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
#MYIP=$(wget -qO- ipinfo.io/ip);
MYIP=$(wget -qO- https://ipv4.icanhazip.com);
MYIP6=$(wget -qO- https://ipv6.icanhazip.com);
clear
domain=$(cat /etc/xray/domain)

vlhdua="$(cat ~/log-install.txt | grep -w "VLESS H2C TLS" | cut -d: -f2|sed 's/ //g')"
vlhduanon="$(cat ~/log-install.txt | grep -w "VLESS H2C NON TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xtrojan.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xvmess.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xvless.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done

until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
read -rp "Password : " -e user
user_EXISTS=$(grep -w $user /etc/xray/xss.json | wc -l)

if [[ ${user_EXISTS} == '1' ]]; then
echo ""
echo -e "Username ${RED}${user}${NC} Already On VPS Please Choose Another"
exit 1
fi
done
#uuid=$(cat /proc/sys/kernel/random/uuid)
#uuid=$(openssl rand -base64 16)
uuid=$(openssl rand -hex 7)
read -p "Expired (Days) : " masaaktif
hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
sed -i '/#vless-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xss.json
sed -i '/#vless-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xtrojan.json
sed -i '/#vless-hdua$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvmess.json
sed -i '/#vless-hdua-nontls$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/xvless.json
vlesshdua="vless://${uuid}@${domain}:$vlhdua?type=http&security=tls&path=/WISNU-HTTP&encryption=none#%F0%9F%94%B0VLESS+H2C+TLS+${user}"
vlesshduanon="vless://${uuid}@${domain}:$vlhduanon?type=http&security=none&path=/gandring&encryption=none#${user}"
systemctl restart xvless.service
systemctl restart xray.service
systemctl restart xvmess
systemctl restart xss.service
systemctl restart xtrojan
#systemctl restart nginx
service cron restart
clear
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m 🔰 AKUN VLESS HTTP/2 🔰  \e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔺️Nama➡️ ${user}"
echo -e "🔺️IP/Host➡️ ${MYIP}"
echo -e "🔺️Address➡️ ${domain}"
echo -e "🔺️Port➡️ $vlhdua"
echo -e "🔺️Protokol➡️ H2"
echo -e "🔺️Path➡️ /WISNU-HTTP"
echo -e "🔺️UserID➡️ ${uuid}"
echo -e "🔺️Dibuat➡️ $hariini"
echo -e "🔺️Kadaluarsa➡️ $exp"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "🔺️H2C TLS➡️  ${vlesshdua}"
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
#echo -e "✨ H2C NONTLS: ${vlesshduanon}"
#echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\033[1;46m🔰LUXURY EDITION ZEROSSL🔰\e[m"   
echo -e "\033[1;31m━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -n 1 -s -r -p "Ketik Bebas Untuk Ke Menu Utama"
vlessmenu
