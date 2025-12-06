# 🚀 RootMe Termux Kurulum Betiği

Bu betik, [Termux](https://termux.com/) uygulamasında **Kali Linux** ortamını kolayca kurmak ve kullanmak için tasarlanmıştır. `proot` teknolojisi sayesinde, root erişimine ihtiyaç duymadan sanal bir Kali Linux ortamı elde edersiniz.

## ✨ Özellikler

*   **⚡ Kolay ve Otomatik Kurulum:** Tek bir komutla gerekli tüm paketleri, bağımlılıkları ve Kali Linux'u kurar.
*   **🛠️ İki Farklı Çalışma Modu:**
    *   **Boot2Root:** Termux her açıldığında otomatik olarak Kali Linux başlar.
    *   **OnlyRoot:** Termux normal başlar, istediğiniz zaman `rootme` komutu ile Kali Linux'a geçersiniz.
*   **🛡️ Güvenli:** Mevcut `bash.bashrc` dosyanızın yedeğini alır (`bash.bashrc.bak`), böylece bir sorun olursa geri dönebilirsiniz.
*   **🧪 Test Modu:** Geliştiriciler için, Android cihazı olmadan betiği test etmeye yarayan simülasyon modu ( `--test` parametresi ile).
*   **🌐 İnternet Kontrolü:** Kuruluma başlamadan önce bağlantınızı kontrol eder.

## ⚙️ Gereksinimler

*   [Termux](https://termux.com/) uygulaması yüklü bir Android cihaz.
*   Aktif internet bağlantısı.
*   En az 2GB boş depolama alanı (önerilen).

## 🛠️ Kurulum ve Kullanım

1.  **Termux'u Açın ve Paketleri Güncelleyin:**
    ```bash
    pkg update && pkg upgrade
    ```

2.  **Betiği İndirin:**
    ```bash
    wget https://raw.githubusercontent.com/AyazDoruck/rootme/main/rootme.sh
    ```

3.  **Çalıştırma İzni Verin:**
    ```bash
    chmod +x rootme.sh
    ```

4.  **Betiği Çalıştırın:**
    ```bash
    ./rootme.sh
    ```

5.  **Mod Seçin:**
    *   Kurulum sırasında size **Boot2Root** veya **OnlyRoot** seçeneklerinden birini seçmeniz istenecektir.
    *   Seçiminizi yapın ve kurulumun tamamlanmasını bekleyin.

6.  **Termux'u Yeniden Başlatın:** Kurulum bittiğinde değişikliklerin aktif olması için Termux'u kapatıp açın.

## 🐛 Sorun Giderme

*   **Kurulum Hatası:** İnternet bağlantınızın stabil olduğundan emin olun.
*   **Eski Ayarlara Dönme:** Eğer bir şeyler ters giderse, `bash.bashrc` dosyanızı yedekten geri yükleyebilirsiniz:
    ```bash
    cp $PREFIX/etc/bash.bashrc.bak $PREFIX/etc/bash.bashrc
    ```
*   **Test Modu:** Betiği bilgisayarınızda (Linux/WSL/Git Bash) test etmek için:
    ```bash
    ./rootme.sh --test
    ```

## 🤝 Katkıda Bulunma

Geliştirmelere açıktır! Her türlü katkı, hata raporu veya özellik önerisi memnuniyetle karşılanır. Lütfen bir Pull Request açmaktan veya Issue oluşturmaktan çekinmeyin.

## 📧 İletişim

*   **Instagram:** [@ayazdoruck](https://www.instagram.com/ayazdoruck/)
*   **Geliştirici:** Ayaz Doruck

---
*Bu proje açık kaynaklıdır ve eğitim amaçlıdır.*
