# Panduan Lengkap & Detail: Instalasi Android Studio & Android SDK di Linux

Dokumen ini berisi panduan tingkat lanjut dan rinci untuk menginstal **Android Studio**, mengonfigurasi **Android SDK**, memasang **KVM Hardware Acceleration**, mengonfigurasi **Environment Variables (`ANDROID_HOME`)**, mengintegrasikan **Plugin Flutter & Dart**, hingga membuat **Android Virtual Device (AVD / Emulator)** dan mengonfigurasi perangkat Android fisik pada sistem operasi Linux.

---

## 📋 DAFTAR ISI
1. [Prasyarat Utama: Akselerasi Perangkat Keras KVM](#1-prasyarat-utama-akselerasi-perangkat-keras-kvm)
2. [Spesifikasi & Persyaratan Sistem Minimum](#2-spesifikasi--persyaratan-sistem-minimum)
3. [Metode Pengunduhan & Instalasi Android Studio di Linux](#3-metode-pengunduhan--instalasi-android-studio-di-linux)
4. [Penyiapan Initial Wizard & Penentuan Lokasi SDK](#4-penyiapan-initial-wizard--penentuan-lokasi-sdk)
5. [Konfigurasi SDK Manager & Component Wajib (cmdline-tools)](#5-konfigurasi-sdk-manager--component-wajib-cmdline-tools)
6. [Pengaturan Environment Variables Shell (ANDROID_HOME & PATH)](#6-pengaturan-environment-variables-shell-android_home--path)
7. [Membuat Pintasan Peluncur Aplikasi (Desktop Entry)](#7-membuat-pintasan-peluncur-aplikasi-desktop-entry)
8. [Instalasi Plugin Flutter & Dart di Android Studio](#8-instalasi-plugin-flutter--dart-di-android-studio)
9. [Persetujuan Lisensi Android (Android Licenses)](#9-persetujuan-lisensi-android-android-licenses)
10. [Konfigurasi & Pembuatan Android Virtual Device (AVD / Emulator)](#10-konfigurasi--pembuatan-android-virtual-device-avd--emulator)
11. [Pengaturan Perangkat Fisik & Rules USB Debugging (udev)](#11-pengaturan-perangkat-fisik--rules-usb-debugging-udev)
12. [Panduan Troubleshooting & Penyelesaian Masalah Error](#12-panduan-troubleshooting--penyelesaian-masalah-error)

---

## 1. Prasyarat Utama: Akselerasi Perangkat Keras KVM

Agar Android Emulator dapat berjalan cepat dengan akselerasi native di Linux, sistem Anda membutuhkan modul kernel **KVM (Kernel-based Virtual Machine)**.

### A. Memeriksa Dukungan Virtualisasi CPU
Buka Terminal (`Ctrl + Alt + T`) dan jalankan:
```bash
egrep -c '(vmx|svm)' /proc/cpuinfo
```
*Jika hasilnya angka **1 atau lebih**, artinya CPU Anda mendukung virtualisasi KVM.*

### B. Menginstal KVM & Utilitas Virtualisasi
Jalankan perintah sesuai distribusi Linux Anda:

#### Untuk Ubuntu / Debian / Linux Mint / Pop!_OS:
```bash
sudo apt update
sudo apt install -y qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils cpu-checker virt-manager
```

#### Untuk Fedora / RHEL:
```bash
sudo dnf install -y qemu-kvm libvirt virt-install bridge-utils
```

#### Untuk Arch Linux / Manjaro:
```bash
sudo pacman -Syu --needed qemu-desktop libvirt virt-manager
```

### C. Mengatur Hak Akses Pengguna ke Grup KVM
Tambahkan akun pengguna aktif Anda ke grup `kvm` dan `libvirt`:
```bash
sudo usermod -aG kvm $USER
sudo usermod -aG libvirt $USER
```

### D. Verifikasi Status KVM
Jalankan perintah pengujian:
```bash
kvm-ok
```
**Output yang Benar:**
```plaintext
INFO: /dev/kvm exists
KVM acceleration can be used
```
*(Jika muncul pesan warning permission, lakukan **Log Out** lalu **Log In** kembali ke sesi desktop Linux Anda).*

---

## 2. Spesifikasi & Persyaratan Sistem Minimum

* **Arsitektur CPU**: 64-bit x86_64 dengan dukungan Intel VT-x atau AMD-V.
* **Memori RAM**:
  * Minimum: **8 GB**
  * Rekomendasi: **16 GB** (Android Studio + Emulator + Gradle daemon).
* **Ruang Disk Bebas**:
  * Aplikasi Android Studio: **~3.5 GB**
  * Android SDK, System Images & Emulator: **~12 GB - 20 GB**
  * Rekomendasi total ruang kosong: **SSD Minimal 30 GB - 50 GB**.
* **Resolusi Layar**: Minimal 1280 x 800 (Rekomendasi 1920 x 1080).

---

## 3. Metode Pengunduhan & Instalasi Android Studio di Linux

Google menyediakan biner resmi Android Studio berupa arsip `.tar.gz`.

### METODE A: Instalasi Standar via Tarball Resmi (Sangat Direkomendasikan)

1. Buka [https://developer.android.com/studio](https://developer.android.com/studio).
2. Unduh arsip installer (contoh: `android-studio-20xx.x.x-linux.tar.gz`).
3. Ekstrak arsip tersebut ke direktori `/opt/` (untuk instalasi global seluruh sistem):
   ```bash
   sudo tar -xzf ~/Downloads/android-studio-*-linux.tar.gz -C /opt/
   ```
4. Sesuaikan hak akses kepemilikan folder agar dapat diakses tanpa `sudo`:
   ```bash
   sudo chown -R $USER:$USER /opt/android-studio
   ```

*Jalur eksekusi aplikasi Android Studio Anda sekarang berada di:*  
👉 **`/opt/android-studio/bin/studio.sh`**

5. Jalankan Android Studio awal dari Terminal:
   ```bash
   /opt/android-studio/bin/studio.sh
   ```

---

## 4. Penyiapan Initial Wizard & Penentuan Lokasi SDK

Saat Android Studio berjalan untuk pertama kali:

1. **Import Studio Settings**: Pilih **Do not import settings**, lalu klik **OK**.
2. **Data Sharing**: Pilih *Don't send*.
3. Pada layar **Welcome**, klik **Next**.
4. Pada layar **Install Type**: Pilih **Custom**, lalu klik **Next**.
5. Pilih Tema Tampilan (*Darcula / Light*), lalu klik **Next**.
6. **SDK Components Setup**:
   * Perhatikan dan catat lokasi **Android SDK Location**:  
     👉 **`/home/<username>/Android/Sdk`** (atau `~/Android/Sdk`)
   * Pastikan komponen berikut tercentang:
     * `Android SDK Platform`
     * `Android Virtual Device`
7. Klik **Next**, pilih **Accept** untuk menyetujui lisensi SDK, lalu klik **Finish** untuk memulai pengunduhan SDK dasar.

---

## 5. Konfigurasi SDK Manager & Component Wajib (`cmdline-tools`)

> ⚠️ **WAJIB DIPERHATIKAN:**  
> Tanpa komponen `cmdline-tools`, perintah `flutter doctor` akan menampilkan kegagalan: `Android toolchain - cmdline-tools component is missing`.

### Langkah-Langkah Menginstal SDK Tools Wajib:
1. Buka Android Studio.
2. Di layar awal (*Welcome Screen*), klik menu **More Actions** > **SDK Manager** (atau via `Tools` > `SDK Manager`).
3. Di jendela SDK Manager, klik tab **SDK Tools** di bagian atas.
4. Berikan tanda centang pada item-item wajib berikut:
   * [x] **Android SDK Command-line Tools (latest)** 👈 *(WAJIB UNTUK FLUTTER!)*
   * [x] **Android SDK Platform-Tools** *(Berisi biner `adb`)*
   * [x] **Android SDK Build-Tools**
   * [x] **Android Emulator**
5. Klik **Apply** di kanan bawah, klik **OK** pada jendela dialog.
6. Tunggu proses instalasi selesai, lalu klik **Finish** dan **OK**.

---

## 6. Pengaturan Environment Variables Shell (`ANDROID_HOME` & `PATH`)

Agar alat baris perintah seperti `adb`, `emulator`, dan `sdkmanager` dapat dipanggil dari mana saja di terminal, tambahkan jalur SDK ke berkas konfigurasi shell Anda (`~/.bashrc` atau `~/.zshrc`).

### Langkah-Langkah Konfigurasi:
1. Buka berkas `~/.bashrc` (atau `~/.zshrc` jika menggunakan Zsh):
   ```bash
   nano ~/.bashrc
   ```
2. Tambahkan baris-baris berikut di bagian bawah berkas:
   ```bash
   # Konfigurasi Android SDK Environment Variables
   export ANDROID_HOME=$HOME/Android/Sdk
   export PATH=$PATH:$ANDROID_HOME/emulator
   export PATH=$PATH:$ANDROID_HOME/platform-tools
   export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
   
   # Konfigurasi JAVA_HOME (Menggunakan JDK Bawaan Android Studio)
   export JAVA_HOME=/opt/android-studio/jbr
   export PATH=$PATH:$JAVA_HOME/bin
   ```
3. Simpan berkas (`Ctrl + O`, `Enter`), lalu keluar (`Ctrl + X`).
4. Muat ulang variabel lingkungan:
   ```bash
   source ~/.bashrc
   ```

### Verifikasi Perintah `adb`:
```bash
which adb
```
**Output yang Benar:**
```plaintext
/home/<username>/Android/Sdk/platform-tools/adb
```

---

## 7. Membuat Pintasan Peluncur Aplikasi (Desktop Entry)

Agar Anda tidak perlu lagi membuka terminal dan mengetik `/opt/android-studio/bin/studio.sh` setiap kali ingin membuka Android Studio:

1. Jalankan Android Studio.
2. Pada bilah menu atas, pilih **Tools** > **Create Desktop Entry...**.
3. Centang *Create the entry for all users* (jika ingin berlaku global).
4. Klik **OK**.
5. Sekarang ikon Android Studio akan muncul di daftar peluncur aplikasi (Application Launcher / Dash) Linux Anda.

---

## 8. Instalasi Plugin Flutter & Dart di Android Studio

1. Di Android Studio, buka menu **Plugins** (`File` > `Settings` > `Plugins` atau dari layar awal).
2. Pindah ke tab **Marketplace**.
3. Cari **Flutter** pada kolom pencarian.
4. Klik tombol **Install** (Pilih **Install** saat diminta memasang plugin **Dart** otomatis).
5. Setelah instalasi selesai, klik **Restart IDE**.

---

## 9. Persetujuan Lisensi Android (Android Licenses)

Jalankan perintah berikut di Terminal Linux Anda untuk menyetujui seluruhlisensi SDK Android:

```bash
flutter doctor --android-licenses
```

Ketik **`y`** lalu tekan **Enter** pada setiap konfirmasi pertanyaan yang muncul hingga seluruh lisensi disetujui (*All SDK package licenses accepted*).

---

## 10. Konfigurasi & Pembuatan Android Virtual Device (AVD / Emulator)

1. Di Android Studio, buka **More Actions** > **Virtual Device Manager** (atau menu `Tools` > `Device Manager`).
2. Klik tombol **Create device** (ikon `+`).
3. **Hardware Selection**: Pilih model HP yang mendukung Play Store, contohnya **Pixel 7**. Klik **Next**.
4. **System Image**:
   * Pindah ke tab **x86 Images**.
   * Unduh gambar sistem target, misalnya **API 34 (UpsideDownCake)** x86_64.
   * Pilih gambar sistem yang sudah diunduh, lalu klik **Next**.
5. **Verify Configuration**:
   * Nama AVD: `Pixel 7 API 34`.
   * Emulated Performance: *Hardware - GLES 2.0*.
   * Klik **Finish**.
6. Klik ikon **Play** (segitiga hijau) untuk menguji pengaktifan Emulator.

---

## 11. Pengaturan Perangkat Fisik & Rules USB Debugging (udev)

Jika Anda ingin menghubungkan HP Android fisik via kabel USB di Linux, Anda memerlukan aturan `udev` agar sistem memberikan izin akses non-root ke perangkat USB.

### Langkah-Langkah Konfigurasi udev:
1. Instal paket rules Android universal:
   ```bash
   sudo apt install -y android-sdk-platform-tools-common
   ```
2. Atau tambahkan grup `adbusers` secara manual:
   ```bash
   sudo usermod -aG adbusers $USER
   ```
3. Aktifkan **USB Debugging** di HP Android Anda (Opsi Pengembang).
4. Hubungkan HP ke komputer via USB dan setujui prompt dialog izin di layar HP.
5. Verifikasi koneksi di Terminal:
   ```bash
   flutter devices
   ```

---

## 12. Panduan Troubleshooting & Penyelesaian Masalah Error

### ❓ Masalah 1: Emulator Gagal Dijalankan (`/dev/kvm permission denied`)
* **Penyebab**: Akun pengguna Anda belum memiliki hak akses baca/tulis ke perangkat `/dev/kvm`.
* **Solusi**:
  1. Jalankan perintah penyesuaian izin grup:
     ```bash
     sudo usermod -aG kvm $USER
     sudo chmod 666 /dev/kvm
     ```
  2. Lakukan Log Out dan Log In kembali.

### ❓ Masalah 2: `flutter doctor` Tidak Mendeteksi Android Studio
* **Penyebab**: Flutter tidak dapat menemukan lokasi instalasi kustom `/opt/android-studio`.
* **Solusi**: Setel jalur direktori Android Studio secara manual menggunakan perintah `flutter config`:
  ```bash
  flutter config --android-studio-dir="/opt/android-studio"
  ```

### ❓ Masalah 3: Error `Android SDK directory not found`
* **Solusi**: Setel jalur SDK Android secara manual menggunakan `flutter config`:
  ```bash
  flutter config --android-sdk="$HOME/Android/Sdk"
  ```

### ❓ Masalah 4: Akhir Diagnostik `flutter doctor`
Jalankan kembali diagnostik akhir:
```bash
flutter doctor -v
```
**Hasil Ideal:**
```plaintext
[✓] Flutter (Channel stable, 3.24.0, on Linux 6.8.0)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Chrome - develop for web
[✓] Linux toolchain - develop for Linux desktop
[✓] Android Studio (version 2024.1)
[✓] Connected device (1 available)
[✓] Network resources

• No issues found!
```
