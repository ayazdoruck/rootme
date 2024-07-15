#! /data/data/com.termux/files/usr/bin/bash
clear
echo "  _____              _ _      "
echo " |  __ \            ( ) |     "
echo " | |  | | ___  _ __ |/| |_    "
echo " | |  | |/ _ \| '_ \  | __|   "
echo " | |__| | (_) | | | | | |_    "
echo " |_____/ \___/|_| |_|  \__|   "
echo
echo
echo "  ____                                "
echo " |  _ \                               "
echo " | |_) | ___     ______     _ _       "
echo " |  _ < / _ \   |  ____|   (_) |      "
echo " | |_) |  __/   | |____   ___| |      "
echo " |____/ \___|   |  __\ \ / / | |      "
echo "                | |___\ V /| | |      "
echo "                |______\_/ |_|_|      "
echo                                                        
read -p "Root simüle toolunu kullanmak için enter tuşuna basın. " Enter
echo
clear
echo
echo "   1. Boot2Root    "
echo "   2. OnlyRoot     "
echo
echo "Yukarıdaki seçeneklerdem birini seçiniz."
echo     
echo "Versiyon 1.1"

read -p "Seçiminizi girin : " choice
apt update && apt upgrade -y
apt install wget -y
apt install openssl-tool -y
apt install proot -y
apt install bash -y
apt install nano -y
apt install neofetch -y
termux-setup-storage
cd /data/data/com.termux/files/usr/etc/
cp bash.bashrc bash.bashrc.bak
mkdir /data/data/com.termux/files/usr/etc/Root
cd /data/data/com.termux/files/usr/etc/Root
wget  https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Kali/kali.sh
bash kali.sh
echo $Enter
clear    
neofetch
echo
if [ "$choice" = "1" ];
then
echo " bash /data/data/com.termux/files/usr/etc/Root/start-kali.sh " >> /data/data/com.termux/files/usr/etc/bash.bashrc
echo
echo "Kurulum tamamlandı, Termux'u yeniden başlatın"
elif [ "$choice" = "2" ];
then
echo " alias rootme='bash /data/data/com.termux/files/usr/etc/Root/start-kali.sh' " >> /data/data/com.termux/files/usr/etc/bash.bashrc
cd /data/data/com.termux/files/usr/etc
source bash.bashrc
echo 
echo "Kurulum tamamlandı, Termux'u yeniden başlatın ve konsola 'rootme' yazın."
else
echo                                             
echo "   ___   ___  _ __  ___  "
echo "  / _ \ / _ \| '_ \/ __| "
echo " | (_) | (_) | |_) \__ \ "
echo "  \___/ \___/| .__/|___/ "
echo "             | |         "
echo "             |_|         "
echo  
echo "Beklenmeyen bir hata oluştu, lütfen tekrar deneyin."
exit
fi
echo
echo "Root AnLinux tarafından temin edilmiştir."
echo "Tool AyazDoruck tarafından yapılmıştır."
echo
echo
echo "Bana ulaşın :"
echo "Instagram : @ayazdoruck "
echo
echo
