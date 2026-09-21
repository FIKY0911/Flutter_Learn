# Panduan Lengkap & Detail: Instalasi & Konfigurasi Visual Studio Code di Linux untuk Flutter

Dokumen ini berisi panduan komprehensif mengenai instalasi, konfigurasi, integrasi ekstensi, serta optimasi **Visual Studio Code (VS Code)** di berbagai distribusi Linux (Ubuntu, Debian, Linux Mint, Fedora, Arch Linux, Manjaro, dll.) untuk pengembangan aplikasi Flutter dan Dart.

---

## ⚠️ PERHATIAN PENTING: Visual Studio Code vs Visual Studio

| Karakteristik | **Visual Studio Code (VS Code)** *(Dokumen ini)* | **Visual Studio (IDE)** |
| :--- | :--- | :--- |
| **Definisi** | Code editor modern, ringan, *cross-platform* (Linux, macOS, Windows) | Full-featured IDE berukuran besar yang ditujukan terutama untuk platform Windows/.NET/C++ |
| **Ketersediaan di Linux** | **Tersedia secara native** di Linux (`.deb`, `.rpm`, `tar.gz`, Snap, AUR) | **TIDAK TERSEDIA** di Linux (hanya ada di OS Windows) |
| **Fungsi di Flutter** | **Editor utama** tempat menulis, mengedit kode, debug, dan mengelola proyek Flutter | Toolchain compiler C++ Windows (tidak relevan untuk Linux) |
| **Kebutuhan** | **Sangat Direkomendasikan** untuk coding harian di Linux | Tidak digunakan di Linux |

---

## 📋 DAFTAR ISI
1. [Spesifikasi & Persyaratan Sistem di Linux](#1-spesifikasi--persyaratan-sistem-di-linux)
2. [Metode Instalasi Visual Studio Code di Berbagai Distro](#2-metode-instalasi-visual-studio-code-di-berbagai-distro)
   - [A. Ubuntu / Debian / Linux Mint (APT Repository & .deb)](#a-ubuntu--debian--linux-mint-apt-repository--deb)
   - [B. Fedora / RHEL / CentOS (DNF/YUM Repository & .rpm)](#b-fedora--rhel--centos-dnfyum-repository--rpm)
   - [C. Arch Linux / Manjaro (Pacman & AUR)](#c-arch-linux--manjaro-pacman--aur)
   - [D. Universal Snap Package](#d-universal-snap-package)
   - [E. Flatpak (Flathub)](#e-flatpak-flathub)
3. [Verifikasi Perintah `code` di Terminal](#3-verifikasi-perintah-code-di-terminal)
4. [Instalasi Ekstensi Wajib Flutter & Dart](#4-instalasi-ekstensi-wajib-flutter--dart)
5. [Rekomendasi Ekstensi Pendukung Produktivitas](#5-rekomendasi-ekstensi-pendukung-produktivitas)
6. [Konfigurasi Optimal `settings.json` di Linux](#6-konfigurasi-optimal-settingsjson-di-linux)
7. [Konfigurasi Penting Linux: Tingkatkan Batas File Watcher (Inotify)](#7-konfigurasi-penting-linux-tingkatkan-batas-file-watcher-inotify)
8. [Pemilihan Perangkat, Linux Desktop Runner, & Emulator](#8-pemilihan-perangkat-linux-desktop-runner--emulator)
9. [Menjalankan & Debugging Proyek Flutter](#9-menjalankan--debugging-proyek-flutter)
10. [Shortcut Keyboard Esensial Flutter di Linux](#10-shortcut-keyboard-esensial-flutter-di-linux)
11. [Panduan Troubleshooting Khusus Linux](#11-panduan-troubleshooting-khusus-linux)

---

## 1. Spesifikasi & Persyaratan Sistem di Linux

* **Sistem Operasi**: Distribusi Linux 64-bit modern (Ubuntu 20.04+, Debian 11+, Fedora 38+, Arch Linux, dll.).
* **RAM**: Minimal 4 GB (Disarankan 8 GB - 16 GB jika menjalankan Android Studio / Emulator bersamaan).
* **Ruang Disk**: ~500 MB untuk aplikasi VS Code.
* **Akses Root / Sudo**: Diperlukan untuk instalasi paket sistem.

---

## 2. Metode Instalasi Visual Studio Code di Berbagai Distro

Pilih salah satu metode instalasi yang sesuai dengan distribusi Linux Anda di bawah ini:

### A. Ubuntu / Debian / Linux Mint (APT Repository & .deb)

#### Opsi 1: Menggunakan Official Microsoft APT Repository (Direkomendasikan - Auto Update)
Buka Terminal (`Ctrl + Alt + T`) dan jalankan:

```bash
# 1. Pasang dependensi yang diperlukan
sudo apt update
sudo apt install -y wget gpg apt-transport-https

# 2. Impor kunci GPG resmi Microsoft
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
rm -f packages.microsoft.gpg

# 3. Daftarkan repository VS Code
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null

# 4. Perbarui indeks paket dan pasang VS Code
sudo apt update
sudo apt install -y code
```

#### Opsi 2: Menggunakan File `.deb` Langsung
1. Unduh file paket `.deb` dari situs resmi: [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Masuk ke folder unduhan dan pasang dengan perintah:
   ```bash
   cd ~/Downloads
   sudo dpkg -i code_*.deb
   sudo apt-get install -f # Memperbaiki jika ada dependensi yang kurang
   ```

---

### B. Fedora / RHEL / CentOS (DNF/YUM Repository & .rpm)

Buka Terminal dan jalankan:

```bash
# 1. Impor kunci GPG Microsoft
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

# 2. Daftarkan repository VS Code
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

# 3. Perbarui metadata dan instal VS Code
dnf check-update
sudo dnf install -y code
```

---

### C. Arch Linux / Manjaro (Pacman & AUR)

#### Opsi 1: Versi Open Source Code-OSS (Tersedia di repo resmi Arch)
```bash
sudo pacman -Syu code
```

#### Opsi 2: Versi Resmi Microsoft Visual Studio Code (via AUR)
Menggunakan AUR helper seperti `yay` atau `paru`:
```bash
yay -S visual-studio-code-bin
```

---

### D. Universal Snap Package

Jika sistem Linux Anda telah mengaktifkan Snap (*Ubuntu secara bawaan sudah aktif*):

```bash
sudo snap install --classic code
```

---

### E. Flatpak (Flathub)

```bash
flatpak install flathub com.visualstudio.code
```
> ⚠️ **Catatan Khusus Flatpak**: Karena Flatpak berjalan dalam sandbox yang terisolasi, VS Code Flatpak mungkin membutuhkan izin tambahan untuk mengakses Flutter SDK di path host (`~/.local/share/flatpak/overrides` atau Flatseal). Metode native package (`.deb`/`.rpm`/`apt`) lebih direkomendasikan untuk pengembangan Flutter.

---

## 3. Verifikasi Perintah `code` di Terminal

Setelah instalasi selesai, verifikasi bahwa VS Code dapat diakses dari terminal:

```bash
code --version
```
Jika muncul nomor versi, Anda dapat langsung membuka direktori proyek apa pun dengan perintah:
```bash
cd ~/Documents/Mobile/Flutter_Learn
code .
```

---

## 4. Instalasi Ekstensi Wajib Flutter & Dart

### Metode 1: Melalui Antarmuka Visual Studio Code
1. Luncurkan VS Code.
2. Buka panel ekstensi dengan menekan **`Ctrl + Shift + X`**.
3. Ketik **`Flutter`** di kotak pencarian.
4. Pilih ekstensi **Flutter** oleh `Dart Code` (`dart-code.flutter`) lalu klik **Install**.
   *(Ekstensi Dart akan otomatis ikut terinstal).*

### Metode 2: Melalui Terminal (CLI)
```bash
code --install-extension dart-code.dart-code
code --install-extension dart-code.flutter
```

---

## 5. Rekomendasi Ekstensi Pendukung Produktivitas

Instal ekstensi tambahan berikut untuk pengalaman coding Flutter yang optimal:

```bash
code --install-extension usernamehw.errorlens
code --install-extension pkief.material-icon-theme
code --install-extension jeroen-meijer.pubspec-assist
code --install-extension naumovs.color-highlight
code --install-extension localizely.flutter-intl
```

| Ekstensi | Fungsi |
| :--- | :--- |
| **Error Lens** | Menampilkan error/warning langsung di baris kode tanpa perlu mengarahkan kursor |
| **Material Icon Theme** | Ikon visual yang rapi untuk file Dart, folder assets, dan struktur proyek |
| **Pubspec Assist** | Membantu menambah & mencari package pub.dev tanpa membuka browser |
| **Color Highlight** | Memberikan pratinjau warna langsung pada kode `Colors.blue` / hex code |

---

## 6. Konfigurasi Optimal `settings.json` di Linux

Konfigurasi ini mengaktifkan format otomatis, perapian import otomatis saat file disimpan, dan visualisasi widget guide:

1. Di VS Code, tekan **`Ctrl + Shift + P`**.
2. Ketik **`Preferences: Open User Settings (JSON)`** dan tekan Enter.
3. Masukkan konfigurasi JSON berikut:

```json
{
  // Format kode dan autosave
  "editor.formatOnSave": true,
  "editor.formatOnType": true,
  "editor.rulers": [80],
  "editor.tabSize": 2,
  "editor.defaultFormatter": "Dart-Code.dart-code",

  // Code actions saat file disimpan
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.organizeImports": "explicit"
  },

  // Konfigurasi spesifik file Dart
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": "off"
  },

  // Fitur UI Flutter
  "dart.previewFlutterUiGuides": true,
  "dart.showTodos": true,
  "dart.lineLength": 80,
  "dart.warnWhenAddDependencyFails": true
}
```

---

## 7. Konfigurasi Penting Linux: Tingkatkan Batas File Watcher (Inotify)

Di Linux, editor dan Flutter mengawasi perubahan file proyek secara *real-time* menggunakan *inotify*. Jika proyek Anda memiliki banyak file dependencies, batas default kernel Linux dapat habis dan menyebabkan pesan peringatan atau crash:

> *"Visual Studio Code is unable to watch for file changes in this large workspace"*

### Solusi Permanen:
1. Buka file konfigurasi `sysctl.conf`:
   ```bash
   sudo nano /etc/sysctl.d/99-vfs-inotify.conf
   ```
2. Tambahkan baris berikut:
   ```ini
   fs.inotify.max_user_watches=524288
   ```
3. Simpan (`Ctrl + O`, Enter, lalu `Ctrl + X`).
4. Terapkan perubahan tanpa perlu restart:
   ```bash
   sudo sysctl -p /etc/sysctl.d/99-vfs-inotify.conf
   ```

---

## 8. Pemilihan Perangkat, Linux Desktop Runner, & Emulator

Di Linux, Flutter mendukung beberapa target eksekusi langsung dari VS Code:

1. Klik tombol **Device Selector** di pojok kanan bawah Status Bar VS Code (atau tekan **`Ctrl + Shift + P`** lalu pilih **`Flutter: Select Device`**).
2. Pilihan target yang dapat dipilih meliputi:
   - **Linux Desktop (`linux`)**: Menjalankan aplikasi langsung sebagai aplikasi native desktop Linux GTK *(Sangat cepat & ringan untuk testing UI)*.
   - **Chrome Web (`chrome`)**: Menjalankan aplikasi di Google Chrome / Chromium.
   - **Android Emulator**: Menjalankan emulator AVD Android yang telah dibuat melalui Android Studio.
   - **Perangkat Fisik Android**: Smartphone Android yang terhubung via kabel USB dengan USB Debugging aktif.

---

## 9. Menjalankan & Debugging Proyek Flutter

1. Buka file `lib/main.dart`.
2. Tekan **`F5`** untuk memulai sesi Debugging, atau tekan **`Ctrl + F5`** untuk menjalankan mode cepat tanpa breakpoint.
3. Saat aplikasi berjalan, toolbar debug di bagian atas menyediakan tombol aksi:
   - ⚡ **Hot Reload**: Tekan tombol petir atau `Ctrl + F5`
   - 🔄 **Hot Restart**: `Ctrl + Shift + F5`
   - ⏹️ **Stop**: `Shift + F5`
4. Atau buka integrated terminal di VS Code (**``Ctrl + ` ``**) dan jalankan:
   ```bash
   flutter run
   ```
   Gunakan tombol **`r`** (Hot Reload), **`R`** (Hot Restart), atau **`q`** (Keluar).

---

## 10. Shortcut Keyboard Esensial Flutter di Linux

| Shortcut | Fungsi |
| :--- | :--- |
| **`Ctrl + .`** *(pada Widget)* | **Quick Fix / Refactor**: Bungkus dengan Widget, Padding, Row, Column, atau Hapus Widget |
| **`Ctrl + Shift + P`** | Membuka **Command Palette** |
| **`F5`** | Menjalankan aplikasi (Start Debugging) |
| **`Ctrl + F5`** | Menjalankan aplikasi (Run Without Debugging) |
| **`Ctrl + Shift + F5`** | Melakukan **Hot Restart** |
| **`Ctrl + Space`** | Membuka saran *IntelliSense* |
| **`F12`** | Menuju definisi kode (*Go to Definition*) |
| **`Ctrl + /`** | Memberikan komentar/uncomment baris kode |
| **`stless` + Tab** | Snippet membuat `StatelessWidget` |
| **`stful` + Tab** | Snippet membuat `StatefulWidget` |

---

## 11. Panduan Troubleshooting Khusus Linux

### ❌ Error 1: "Flutter SDK not found"
* **Solusi**:
  1. Pastikan path Flutter SDK sudah ada di file `~/.bashrc` atau `~/.zshrc`:
     ```bash
     export PATH="$PATH:$HOME/development/flutter/bin"
     ```
  2. Di VS Code, tekan **`Ctrl + Shift + P`** > **`Flutter: Change SDK`** > pilih lokasi folder Flutter SDK Anda.

### ❌ Error 2: Menjalankan Target Desktop Linux Gagal (`clang / cmake / pkg-config missing`)
* **Solusi**: Pasang paket dependensi build Linux GTK:
  ```bash
  # Ubuntu / Debian
  sudo apt install -y clang cmake ninja-build pkg-config libgtk-3-dev
  
  # Fedora
  sudo dnf install -y clang cmake ninja-build pkg-config gtk3-devel
  
  # Arch Linux
  sudo pacman -S clang cmake ninja pkgconf gtk3
  ```

### ❌ Error 3: KVM Permission Denied saat Menjalankan Emulator Android dari VS Code
* **Solusi**: Tambahkan user Linux Anda ke grup `kvm`:
  ```bash
  sudo usermod -aG kvm $USER
  ```
  Lalu lakukan *logout* dan *login* ulang ke sesi desktop Linux Anda.

---

> 💡 **Verifikasi Status**: Jalankan `flutter doctor -v` melalui terminal VS Code untuk memastikan seluruh komponen Flutter, Android SDK, Chrome, dan Linux toolchain telah terdeteksi dengan status centang hijau `[✓]`.
