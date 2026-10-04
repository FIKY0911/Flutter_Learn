# Panduan Lengkap & Detail: Instalasi Flutter SDK di Linux

Dokumen ini menyajikan panduan komprehensif dan mendalam untuk menginstal serta mengonfigurasi **Flutter SDK** pada sistem operasi Linux (Ubuntu, Debian, Linux Mint, Fedora, RHEL, Arch Linux, dan Manjaro). Panduan ini mencakup instalasi dependensi native, manajemen hak akses file, pengaturan variabel lingkungan shell (`.bashrc` / `.zshrc`), hingga verifikasi build toolchain.

---

## 📋 DAFTAR ISI
1. [Spesifikasi & Persyaratan Sistem Linux](#1-spesifikasi--persyaratan-sistem-linux)
2. [Instalasi Paket Dependensi Sistem per Distribusi](#2-instalasi-paket-dependensi-sistem-per-distribusi)
3. [Pengunduhan & Penataan Direktori Flutter SDK](#3-pengunduhan--penataan-direktori-flutter-sdk)
4. [Konfigurasi Environment Variables Shell (PATH)](#4-konfigurasi-environment-variables-shell-path)
5. [Verifikasi Biner Flutter & Pre-caching Artifacts](#5-verifikasi-biner-flutter--pre-caching-artifacts)
6. [Analisis & Eksekusi Flutter Doctor](#6-analisis--eksekusi-flutter-doctor)
7. [Penyiapan Build Tools untuk Desktop Linux (GTK 3 & Clang)](#7-penyiapan-build-tools-untuk-desktop-linux-gtk-3--clang)
8. [Panduan Troubleshooting & Penyelesaian Masalah Error](#8-panduan-troubleshooting--penyelesaian-masalah-error)

---

## 1. Spesifikasi & Persyaratan Sistem Linux

Pastikan sistem Linux Anda memenuhi persyaratan perangkat keras dan lingkungan berikut:

* **Arsitektur CPU**: x86_64 (64-bit).
* **Sistem Operasi**: Distribusi Linux modern 64-bit (Ubuntu 20.04 LTS/22.04 LTS/24.04 LTS, Debian 11/12, Fedora 38+, Arch Linux).
* **Memori RAM**:
  * Minimum: **8 GB**
  * Rekomendasi: **16 GB** (Kompilasi C++ dan Android Emulator memerlukan konsumsi RAM tinggi).
* **Ruang Disk Bebas**:
  * Flutter SDK & Toolchain: **~3.5 GB**
  * Android Studio & Android SDK: **~12 GB - 18 GB**
  * Rekomendasi total ruang disk kosong: **SSD Minimal 30 GB - 50 GB**.
* **Pustaka Bawaan Wajib**: `glibc` versi 2.28 atau lebih baru, POSIX-compliant shell (`bash` atau `zsh`).

---

## 2. Instalasi Paket Dependensi Sistem per Distribusi

Flutter membutuhkan beberapa perkakas baris perintah (`bash`, `curl`, `git`, `unzip`, `xz`, `zip`) serta pustaka grafis (`libglu1-mesa`, `libgtk-3-dev`) agar dapat berfungsi dengan sempurna.

Buka Terminal Anda (`Ctrl + Alt + T`) dan jalankan perintah sesuai dengan distribusi Linux yang Anda gunakan:

### A. Untuk Distribusi Berbasis Ubuntu / Debian / Linux Mint / Pop!_OS
```bash
sudo apt update && sudo apt install -y \
    bash \
    curl \
    file \
    git \
    coreutils \
    diffutils \
    unzip \
    sed \
    xz-utils \
    zip \
    libglu1-mesa \
    build-essential \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    libgtk-3-dev \
    liblzma-dev \
    libstdc++6
```

### B. Untuk Distribusi Berbasis Fedora / RHEL / CentOS Stream
```bash
sudo dnf groupinstall -y "Development Tools" "Development Libraries"
sudo dnf install -y \
    bash \
    curl \
    file \
    git \
    unzip \
    xz \
    zip \
    libGLU \
    clang \
    cmake \
    ninja-build \
    pkg-config \
    gtk3-devel \
    lzma-devel \
    gcc-c++
```

### C. Untuk Distribusi Berbasis Arch Linux / Manjaro / EndeavourOS
```bash
sudo pacman -Syu --needed \
    base-devel \
    curl \
    git \
    unzip \
    xz \
    zip \
    glu \
    clang \
    cmake \
    ninja \
    pkgconf \
    gtk3 \
    lzma
```

---

## 3. Pengunduhan & Penataan Direktori Flutter SDK

> ⚠️ **ATURAN HAK AKSES DIREKTORI (PERMISSION RULES):**
> 1. **JANGAN PERNAH** mengunduh atau mengompres Flutter SDK di folder akar sistem seperti `/usr/local/flutter` atau `/opt/flutter` menggunakan `sudo`. Penggunaan `sudo` saat menjalankan Flutter akan merusak izin berkas internal (`permission denied`).
> 2. Selalu tempatkan Flutter SDK di dalam *Home Directory* milik pengguna lokal Anda (`$HOME` atau `/home/<username>/`).

### A. Lokasi Direktori Standar
Rekomendasi lokasi instalasi terbaik:  
👉 **`/home/<username>/development/flutter`** (atau `~/development/flutter`)

Buat direktori `development`:
```bash
mkdir -p ~/development
```

### B. Metode Instalasi

#### METODE 1: Menggunakan Git Clone (Sangat Direkomendasikan)
Metode ini memudahkan proses update Flutter di kemudian hari cukup dengan perintah `flutter upgrade`.

```bash
cd ~/development
git clone -b stable https://github.com/flutter/flutter.git
```

#### METODE 2: Mengunduh Tarball `.tar.xz` (Manual)
1. Unduh berkas dari [https://docs.flutter.dev/get-started/install/linux](https://docs.flutter.dev/get-started/install/linux).
2. Ekstrak berkas `flutter_linux_3.x.x-stable.tar.xz` ke dalam folder `~/development`:
   ```bash
   tar -xf ~/Downloads/flutter_linux_3.x.x-stable.tar.xz -C ~/development/
   ```

### C. Bagan Struktur Folder Flutter SDK
Setelah proses ekstraksi/kloning selesai, struktur folder akan tampak seperti berikut:

```plaintext
/home/<username>/
└── development/
    └── flutter/                 <-- FLUTTER_HOME
        ├── bin/                 <-- LOKASI BINER UTAMA
        │   ├── cache/           <-- Tempat penyimpan Dart SDK & Engine Artifacts
        │   ├── internal/
        │   ├── dart
        │   └── flutter          <-- Skrip eksekusi utama Linux
        ├── dev/
        ├── packages/            <-- Paket Framework Flutter
        └── README.md
```

Path biner utama yang harus dimasukkan ke variabel lingkungan shell Anda adalah:  
👉 **`/home/<username>/development/flutter/bin`** (atau `~/development/flutter/bin`)

---

## 4. Konfigurasi Environment Variables Shell (PATH)

Agar biner `flutter` dan `dart` dapat dipanggil dari terminal mana saja tanpa mengetikkan path lengkap, Anda harus menambahkan biner Flutter ke variabel lingkungan `PATH` di berkas konfigurasi shell Anda.

### A. Identifikasi Shell yang Digunakan
Periksa shell aktif Anda dengan perintah:
```bash
echo $SHELL
```
* Jika outputnya `/bin/bash`, maka edit berkas **`~/.bashrc`**.
* Jika outputnya `/bin/zsh`, maka edit berkas **`~/.zshrc`**.

### B. Menambahkan PATH ke Shell Configuration

#### Untuk Shell Bash (`~/.bashrc`):
1. Buka berkas `~/.bashrc` menggunakan editor teks Nano:
   ```bash
   nano ~/.bashrc
   ```
2. Gulir ke bagian paling bawah berkas, lalu tambahkan baris berikut:
   ```bash
   # Konfigurasi Environment Variable Flutter SDK
   export FLUTTER_HOME="$HOME/development/flutter"
   export PATH="$FLUTTER_HOME/bin:$PATH"
   ```
3. Simpan perubahan dengan menekan `Ctrl + O`, tekan `Enter`, lalu keluar dengan `Ctrl + X`.
4. Muat ulang konfigurasi shell secara langsung tanpa perlu restart komputer:
   ```bash
   source ~/.bashrc
   ```

#### Untuk Shell Zsh (`~/.zshrc`):
1. Buka berkas `~/.zshrc`:
   ```bash
   nano ~/.zshrc
   ```
2. Tambahkan baris yang sama di bagian bawah:
   ```bash
   # Konfigurasi Environment Variable Flutter SDK
   export FLUTTER_HOME="$HOME/development/flutter"
   export PATH="$FLUTTER_HOME/bin:$PATH"
   ```
3. Simpan dan muat ulang konfigurasi:
   ```bash
   source ~/.zshrc
   ```

---

## 5. Verifikasi Biner Flutter & Pre-caching Artifacts

1. Periksa lokasi biner Flutter yang terdeteksi oleh sistem:
   ```bash
   which flutter
   ```
   **Output yang Benar:**
   ```plaintext
   /home/<username>/development/flutter/bin/flutter
   ```

2. Periksa lokasi biner Dart:
   ```bash
   which dart
   ```
   **Output yang Benar:**
   ```plaintext
   /home/<username>/development/flutter/bin/dart
   ```

3. Jalankan perintah *pre-cache* untuk mengunduh artefak biner pengembangan awal (Dart SDK, Engine Binaries, Web SDK):
   ```bash
   flutter precache
   ```

4. Periksa versi Flutter yang terpasang:
   ```bash
   flutter --version
   ```

---

## 6. Analisis & Eksekusi Flutter Doctor

Jalankan alat diagnostik `flutter doctor` untuk menganalisis kesiapan dependensi sistem Linux Anda:

```bash
flutter doctor -v
```

### Contoh Tampilan Output `flutter doctor` di Linux:
```plaintext
[✓] Flutter (Channel stable, 3.24.0, on Linux 6.8.0-40-generic, locale en_US.UTF-8)
    • Flutter version 3.24.0 on channel stable at /home/fiky/development/flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 80c84f7954 (3 weeks ago), 2024-08-06 14:15:30 -0700
    • Engine revision 0929ba2362
    • Dart version 3.5.0
    • DevTools version 2.37.2

[!] Android toolchain - develop for Android devices
    ✗ Android SDK directory not found. Check Android Studio installation.
[✓] Chrome - develop for web
    • Chrome at google-chrome
[✓] Linux toolchain - develop for Linux desktop
    • clang version 18.1.3
    • cmake version 3.28.3
    • ninja version 1.11.1
    • pkg-config version 1.8.1
    • gtk+-3.0 version 3.24.41
[!] Android Studio (not installed)
[!] Connected device (none)
```

> 📌 **Catatan**: Jika `Linux toolchain` sudah bertanda centang `[✓]`, sistem Anda sudah siap membangun aplikasi desktop Linux. Untuk menyelesaikan setup *Android toolchain* dan *Android Studio*, buka panduan **`android-studio-linux.md`**.

---

## 7. Penyiapan Build Tools untuk Desktop Linux (GTK 3 & Clang)

Aplikasi desktop Linux dibangun menggunakan GTK 3 dan kompiler Clang/C++. Jika `flutter doctor` menampilkan peringatan pada bagian `Linux toolchain`, instal pustaka berikut:

```bash
sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev
```

Untuk memverifikasi kompilasi desktop Linux, Anda dapat menguji dengan membuat proyek sampel:
```bash
flutter create tes_desktop
cd tes_desktop
flutter run -d linux
```

---

## 8. Panduan Troubleshooting & Penyelesaian Masalah Error

### ❓ Masalah 1: `bash: flutter: command not found`
* **Penyebab**: Perintah `export PATH` belum dimasukkan ke berkas `~/.bashrc` / `~/.zshrc`, atau perintah `source ~/.bashrc` belum dijalankan di jendela terminal aktif.
* **Solusi**: 
  1. Pastikan Anda telah memasukkan `export PATH="$HOME/development/flutter/bin:$PATH"` ke dalam `~/.bashrc`.
  2. Jalankan `source ~/.bashrc` atau buka jendela terminal baru.

### ❓ Masalah 2: `Permission denied` saat menjalankan perintah `flutter`
* **Penyebab**: Berkas eksekusi Flutter tidak memiliki izin eksekusi (*executable permission*), atau folder instalasi dibuat menggunakan perintah `sudo`.
* **Solusi**:
  1. Ubah kepemilikan folder Flutter ke pengguna lokal Anda:
     ```bash
     sudo chown -R $USER:$USER ~/development/flutter
     ```
  2. Berikan izin eksekusi pada biner Flutter:
     ```bash
     chmod +x ~/development/flutter/bin/flutter
     chmod +x ~/development/flutter/bin/dart
     ```

### ❓ Masalah 3: Bentrok Instalasi Snap Package (`/snap/bin/flutter`)
* **Penyebab**: Flutter diinstal melalui Snap (`sudo snap install flutter`), yang sering mengalami pembatasan akses (*sandbox confinement*) saat mengakses SDK Android atau direktori eksternal.
* **Solusi**:
  1. Hapus Flutter versi Snap:
     ```bash
     sudo snap remove flutter
     ```
  2. Gunakan metode Git clone atau Tarball sesuai bagian 3 dokumen ini.

### ❓ Masalah 4: Peringatan `pub status code 403` atau Network Socket Timeout
* **Penyebab**: Koneksi internet terhalang oleh firewall atau kendala DNS.
* **Solusi**: Tambahkan variabel lingkungan mirror pub sementara pada `~/.bashrc`:
  ```bash
  export PUB_HOSTED_URL="https://pub.flutter-io.cn"
  export FLUTTER_STORAGE_BASE_URL="https://storage.flutter-io.cn"
  ```
