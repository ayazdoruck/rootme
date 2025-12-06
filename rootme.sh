#!/usr/bin/env bash

# Hata durumunda durdur
set -e

# Renkler
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Varsayılan Değerler
TEST_MODE=false
if [[ "$1" == "--test" ]]; then
    TEST_MODE=true
fi

# Dizin Ayarları
if [[ "$TEST_MODE" == "true" ]]; then
    # Test ortamı için yerel yollar
    BASE_DIR="$(pwd)/test_env"
    TERMUX_PREFIX="$BASE_DIR/usr"
    ETC_DIR="$TERMUX_PREFIX/etc"
    ROOT_DIR="$ETC_DIR/Root"
    BASHRC="$ETC_DIR/bash.bashrc"
    BASHRC_BAK="$ETC_DIR/bash.bashrc.bak"
    
    # Test ortamını oluştur
    mkdir -p "$ETC_DIR"
    touch "$BASHRC" # Boş bir bashrc oluştur
    
    echo -e "${YELLOW}[!] TEST MODU AKTİF${NC}"
    echo -e "${YELLOW}[!] İşlemler '$BASE_DIR' klasöründe simüle edilecek.${NC}"
else
    # Gerçek Termux yolları
    TERMUX_PREFIX="/data/data/com.termux/files/usr"
    ETC_DIR="$TERMUX_PREFIX/etc"
    ROOT_DIR="$ETC_DIR/Root"
    BASHRC="$ETC_DIR/bash.bashrc"
    BASHRC_BAK="$ETC_DIR/bash.bashrc.bak"
fi

# Komut Çalıştırma Yardımcısı (Wrapper)
run_cmd() {
    if [[ "$TEST_MODE" == "true" ]]; then
        echo -e "${YELLOW}[SIMULASYON] Komut çalıştırıldı: $*${NC}"
    else
        eval "$@"
    fi
}

# 1. Hata Yönetimi ve İnternet Kontrolü
check_internet() {
    echo -e "${BLUE}[*] İnternet bağlantısı kontrol ediliyor...${NC}"
    if [[ "$TEST_MODE" == "true" ]]; then
        echo -e "${GREEN}[+] (Simülasyon) İnternet bağlantısı var.${NC}"
        return 0
    fi

    if wget -q --spider http://google.com; then
        echo -e "${GREEN}[+] İnternet bağlantısı mevcut.${NC}"
    else
        echo -e "${RED}[!] Hata: İnternet bağlantısı yok. Lütfen bağlantınızı kontrol edin.${NC}"
        exit 1
    fi
}

# Banner
show_banner() {
    clear
    echo -e "${CYAN}"
    echo "  _____              _ _      "
    echo " |  __ \            ( ) |     "
    echo " | |  | | ___  _ __ |/| |_    "
    echo " | |  | |/ _ \| '_ \  | __|   "
    echo " | |__| | (_) | | | | | |_    "
    echo " |_____/ \___/|_| |_|  \__|   "
    echo -e "${NC}"
    echo -e "${YELLOW}  Termux Kali Linux Kurulum Aracı v1.3${NC}"
    echo -e "${YELLOW}  Geliştirici: @ayazdoruck${NC}"
    if [[ "$TEST_MODE" == "true" ]]; then
        echo -e "${RED}  *** TEST MODU ***${NC}"
    fi
    echo
}

# 2. Bağımlılıkların Kurulumu
install_dependencies() {
    echo -e "${BLUE}[*] Paket listeleri güncelleniyor ve gerekli araçlar kuruluyor...${NC}"
    
    if [[ "$TEST_MODE" == "true" ]]; then
        run_cmd "pkg update -y && pkg upgrade -y"
        run_cmd "pkg install wget openssl-tool proot bash nano neofetch -y"
        run_cmd "termux-setup-storage"
        return
    fi
    
    # Gerçek Kurulum
    local manager="apt"
    if command -v pkg &> /dev/null; then
        manager="pkg"
    fi

    $manager update -y && $manager upgrade -y
    
    local packages=("wget" "openssl-tool" "proot" "bash" "nano" "neofetch")
    for pack in "${packages[@]}"; do
        if ! command -v "$pack" &> /dev/null; then
             echo -e "${YELLOW}[*] $pack kuruluyor...${NC}"
             $manager install "$pack" -y
        else
             echo -e "${GREEN}[+] $pack zaten yüklü.${NC}"
        fi
    done
    
    echo -e "${BLUE}[*] Depolama izni isteniyor...${NC}"
    termux-setup-storage
}

# 3. Yedekleme
backup_bashrc() {
    if [[ -f "$BASHRC" ]]; then
        echo -e "${BLUE}[*] Mevcut bash.bashrc yedekleniyor...${NC}"
        cp "$BASHRC" "$BASHRC_BAK"
        echo -e "${GREEN}[+] Yedek alındı: $BASHRC_BAK${NC}"
    elif [[ "$TEST_MODE" == "true" ]]; then
        echo -e "${YELLOW}[SIMULASYON] bash.bashrc yedekleniyor (dosya mevcut değilse atlanır)...${NC}"
    fi
}

# 4. Kali Linux Kurulumu
install_kali() {
    echo -e "${BLUE}[*] Kali Linux kurulum dizini hazırlanıyor...${NC}"
    mkdir -p "$ROOT_DIR"
    cd "$ROOT_DIR"

    echo -e "${BLUE}[*] AnLinux kaynaklarından Kali Linux indiriliyor...${NC}"
    
    if [[ "$TEST_MODE" == "true" ]]; then
        run_cmd "wget https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Kali/kali.sh -O kali.sh"
        # Test için sahte bir kali.sh oluştur
        echo "#!/bin/bash" > kali.sh
        echo "echo 'Kali Linux Kurulumu Simüle Ediliyor...'" >> kali.sh
        echo "sleep 1" >> kali.sh
        echo "echo 'Kurulum Tamamlandı.'" >> kali.sh
        chmod +x kali.sh
    else
        wget -q https://raw.githubusercontent.com/EXALAB/AnLinux-Resources/master/Scripts/Installer/Kali/kali.sh -O kali.sh
        chmod +x kali.sh
    fi
    
    echo -e "${BLUE}[*] Kurulum başlatılıyor...${NC}"
    bash kali.sh
}

# 5. Yapılandırma
configure_shell() {
    local choice=$1
    local start_script="$ROOT_DIR/start-kali.sh"

    echo -e "${BLUE}[*] Kabuk yapılandırılıyor...${NC}"

    case "$choice" in
        "1") # Boot2Root
            echo -e "\n# RootMe - Boot2Root Mode" >> "$BASHRC"
            echo "bash $start_script" >> "$BASHRC"
            echo -e "${GREEN}[+] Boot2Root modu aktif edildi. Termux açıldığında Kali başlayacak.${NC}"
            ;;
        "2") # OnlyRoot
            echo -e "\n# RootMe - OnlyRoot Mode" >> "$BASHRC"
            echo "alias rootme='bash $start_script'" >> "$BASHRC"
            echo -e "${GREEN}[+] OnlyRoot modu aktif edildi. 'rootme' yazarak Kali'ye geçebilirsiniz.${NC}"
            ;;
        *)
            echo -e "${RED}[!] Geçersiz seçim.${NC}"
            exit 1
            ;;
    esac
}

# Ana Akış
main() {
    show_banner
    read -r -p "Kuruluma başlamak için Enter tuşuna basın..." _
    
    check_internet
    install_dependencies
    backup_bashrc
    install_kali

    clear
    show_banner
    echo -e "${CYAN}Kurulum Modunu Seçin:${NC}"
    echo -e "  ${GREEN}1.${NC} Boot2Root (Termux açılışında otomatik Kali)"
    echo -e "  ${GREEN}2.${NC} OnlyRoot (Manuel başlatma: 'rootme' komutu ile)"
    echo
    read -r -p "Seçiminiz (1/2): " choice

    case "$choice" in
        "1"|"2")
            configure_shell "$choice"
            ;;
        *)
            echo -e "${RED}[!] Hata: Lütfen 1 veya 2 giriniz.${NC}"
            exit 1
            ;;
    esac

    echo
    echo -e "${GREEN}Kurulum başarıyla tamamlandı!${NC}"
    
    if [[ "$TEST_MODE" == "true" ]]; then
        echo -e "${YELLOW}[INFO] Simülasyon bitti.${NC}"
        echo -e "${YELLOW}[INFO] Oluşturulan sanal ortamı incelemek için './test_env' klasörüne bakın.${NC}"
        echo -e "${YELLOW}[INFO] Temizlemek için: rm -rf test_env${NC}"
    else
        echo -e "${YELLOW}Lütfen değişikliklerin etkili olması için Termux'u yeniden başlatın.${NC}"
    fi
}

main
