# 🚀 RootMe Termux Kurulum Betiği

Bu betik, [Termux](https://termux.com/) uygulamasında **Kali Linux** ortamını kolayca kurmak ve kullanmak için tasarlanmıştır. `proot` teknolojisi sayesinde, root erişimine ihtiyaç duymadan sanal bir Kali Linux ortamı elde edersiniz. İki farklı kullanım modu sunar: Termux açılışında otomatik Kali'ye geçiş veya komutla manuel başlatma.

## ✨ Özellikler

* **Kolay Kurulum:** Tek bir betikle tüm bağımlılıkları ve Kali Linux temel sistemini kurar.
* **İki Modlu Çalışma:**
    * **Boot2Root:** Termux her açıldığında doğrudan Kali Linux ortamına girin.
    * **OnlyRoot:** Termux'u normal başlatın ve istediğiniz zaman `rootme` komutunu kullanarak Kali'ye geçin.
* **Otomatik Güncelleme:** Kurulum öncesinde Termux paketlerini günceller.
* **Yedekleme:** Mevcut `bash.bashrc` dosyanızın yedeğini alır.
* **AnLinux Entegrasyonu:** Kali Linux kurulumu için [AnLinux](https://github.com/EXALAB/AnLinux) kaynaklarını kullanır.

## ⚙️ Gereksinimler

* [Termux](https://termux.com/) uygulaması yüklü bir Android cihaz.

## 🛠️ Kurulum ve Kullanım

1.  **Termux'u Açın:** Cihazınızda Termux uygulamasını başlatın.
2.  **Betik Dosyasını İndirin:** Aşağıdaki komutu kullanarak `rootme.sh` betiğini indirin:

    ```bash
    wget https://raw.githubusercontent.com/AyazDoruck/rootme/main/rootme.sh
    ```
    *(Yukarıdaki linki kendi GitHub depona göre düzenlemeyi unutma!)*

3.  **Çalıştırma İzni Verin:** İndirdiğiniz betiğe çalıştırma izni verin:

    ```bash
    chmod +x rootme.sh
    ```

4.  **Betiği Çalıştırın:** Betiği başlatın:

    ```bash
    ./rootme.sh
    ```

5.  **Seçiminizi Yapın:** Betik size "Boot2Root" veya "OnlyRoot" seçeneklerini sunacaktır. İstediğiniz seçeneği girin ve Enter'a basın.

    * **Boot2Root (Seçim 1):** Kurulum tamamlandığında Termux'u kapatıp yeniden açtığınızda otomatik olarak Kali Linux ortamına geçeceksiniz.
    * **OnlyRoot (Seçim 2):** Kurulum tamamlandığında Termux'u kapatıp yeniden açın. Kali Linux ortamına girmek için Termux içinde `rootme` komutunu kullanın.

6.  **Kurulumu Tamamlayın:** Betik gerekli paketleri ve Kali Linux'u kuracaktır. İşlem tamamlandığında Termux'u yeniden başlatmanız istenecektir.

## 💡 Ek Bilgiler

* Kali Linux ortamından çıkmak için genellikle `exit` komutunu kullanabilirsiniz.
* Herhangi bir sorunla karşılaşırsanız, `bash.bashrc.bak` dosyasını kullanarak orijinal `bash.bashrc` dosyanıza geri dönebilirsiniz. (`cp /data/data/com.termux/files/usr/etc/bash.bashrc.bak /data/data/com.termux/files/usr/etc/bash.bashrc`)

## 🤝 Katkıda Bulunma

Geliştirmelere açıktır! Her türlü katkı, hata raporu veya özellik önerisi memnuniyetle karşılanır. Lütfen bir Pull Request açmaktan veya Issue oluşturmaktan çekinmeyin.


## 📧 İletişim

* **Instagram:** [@ayazdoruck](https://www.instagram.com/ayazdoruck/)

---
