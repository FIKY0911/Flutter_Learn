# Panduan Lengkap & Detail: Instalasi Flutter SDK di Windows

Dokumen ini menyajikan panduan mendalam (*step-by-step*) untuk menginstal dan mengonfigurasi **Flutter SDK** pada sistem operasi Windows (Windows 10 / Windows 11 64-bit). Panduan ini disusun secara ekshaustif mencakup persiapan sistem, struktur direktori, penataan variabel lingkungan (*environment variables*), integrasi toolchain, hingga penyelesaian masalah (*troubleshooting*).

---

## 📋 DAFTAR ISI
1. [Spesifikasi & Persyaratan Sistem](#1-spesifikasi--persyaratan-sistem)
2. [Prasyarat Perangkat Lunak Wajib (Git & PowerShell)](#2-prasyarat-perangkat-lunak-wajib-git--powershell)
3. [Pengunduhan & Penataan Direktori Flutter SDK](#3-pengunduhan--penataan-direktori-flutter-sdk)
4. [Konfigurasi Environment Variables (PATH)](#4-konfigurasi-environment-variables-path)
5. [Verifikasi Integrasi Terminal & Flutter Binaries](#5-verifikasi-integrasi-terminal--flutter-binaries)
6. [Analisis & Eksekusi Flutter Doctor](#6-analisis--eksekusi-flutter-doctor)
7. [Penyiapan Build Tools untuk Desktop Windows (C++)](#7-penyiapan-build-tools-untuk-desktop-windows-c)
8. [Konfigurasi Proxy / Mirror Network (Opsional)](#8-konfigurasi-proxy--mirror-network-opsional)
9. [Panduan Troubleshooting & Penyelesaian Masalah Error](#9-panduan-troubleshooting--penyelesaian-masalah-error)

---

## 1. Spesifikasi & Persyaratan Sistem

Sebelum melakukan proses instalasi, pastikan sistem komputer Windows Anda telah memenuhi rekomendasi minimum berikut:

* **Sistem Operasi**: Windows 10 (Build 19041+) atau Windows 11 (64-bit, x86_64 architecture).
* **Prosesor**: Intel Core i3 / AMD Ryzen 3 atau yang lebih tinggi (Disarankan 4 Core / 8 Threads+ untuk kompilasi cepat).
* **RAM**: 
  * Minimum: **8 GB**
  * Rekomendasi: **16 GB** atau lebih (Flutter + Android Emulator membutuhkan memori cukup besar).
* **Ruang Disk Bebas**:
  * Flutter SDK saja: **~2.8 GB**
  * Android Studio & Android SDK: **~10 GB - 15 GB**
  * Total rekomendasi ruang disk kosong: **Sektor SSD minimal 30 GB - 50 GB**.
* **Sistem Berkas (File System)**: NTFS (Hindari instalasi pada drive FAT32 / ExFAT).

---

## 2. Prasyarat Perangkat Lunak Wajib (Git & PowerShell)

Flutter mengandalkan **Git for Windows** dan **PowerShell** untuk pengunduhan dependensi, pembaruan versi SDK, serta eksekusi skrip internal.

### A. Penginstalan Git for Windows
1. Unduh installer Git terbaru dari situs resmi: [https://git-scm.com/download/win](https://git-scm.com/download/win).
2. Jalankan berkas installer (misal: `Git-2.xx.x-64-bit.exe`).
3. Pada opsi penyiapan instalasi:
   * **Select Components**: Centang `Git Bash Here`, `Git GUI Here`, dan `Scalar`.
   * **Adjusting your PATH environment**: Pilih opsi **Git from the command line and also from 3rd-party software** *(Rekomendasi)*.
   * **Choosing the default editor**: Pilih editor bawaan (VS Code / Vim / Notepad).
   * **Configuring the line ending conversions**: Pilih **Checkout Windows-style, commit Unix-style line endings** (`core.autocrlf = true`).
4. Klik **Install** hingga selesai.
5. Verifikasi penginstalan Git melalui PowerShell / CMD:
   ```cmd
   git --version
   ```
   *Output:* `git version 2.x.x.windows.x`

### B. Verifikasi PowerShell
Flutter membutuhkan **PowerShell 5.0** atau yang lebih baru.
1. Tekan `Win + R`, ketik `powershell`, lalu tekan Enter.
2. Jalankan perintah:
   ```powershell
   $PSVersionTable.PSVersion
   ```
   *Pastikan `Major` bernilai 5 atau lebih tinggi.*

---

## 3. Pengunduhan & Penataan Direktori Flutter SDK

> ⚠️ **ATURAN EMAS LOKASI DIREKTORI (PATH RULES):**
> 1. **JANGAN PERNAH** menginstal Flutter di `C:\Program Files\` atau `C:\Program Files (x86)\`. Direktori ini memerlukan hak akses Elevated Administrator yang akan menyebabkan Gradle Build dan Dart Pub Get gagal.
> 2. **JANGAN** menggunakan nama folder yang mengandung spasi (contoh: `C:\Folder Saya\flutter`) atau karakter khusus/aksen (contoh: `C:\Fikÿ\flutter`).

### A. Pilihan Metode Instalasi

#### Metode 1: Mengunduh Berkas ZIP Resmi (Manual)
1. Buka [https://docs.flutter.dev/get-started/install/windows](https://docs.flutter.dev/get-started/install/windows).
2. Unduh bundle `flutter_windows_3.x.x-stable.zip`.
3. Buat folder baru di drive `C:` bernama `src`:  
   👉 **`C:\src`** (atau `C:\Users\<Username>\development`).
4. Ekstrak isi ZIP ke dalam folder tersebut sehingga menghasilkan subfolder `C:\src\flutter`.

#### Metode 2: Mengkloning via Git (Sangat Direkomendasikan untuk Developer)
Kloning via Git mempermudah perpindahan antar-channel (`stable`, `beta`, `master`) dan update versi SDK secara instan.

1. Buka PowerShell atau Command Prompt.
2. Jalankan perintah berikut:
   ```cmd
   mkdir C:\src
   cd C:\src
   git clone -b stable https://github.com/flutter/flutter.git
   ```

### B. Peta Struktur Direktori Flutter SDK
Setelah diekstrak/dikloning, verifikasi bahwa struktur direktori Anda sesuai dengan bagan di bawah ini:

```plaintext
C:\
└── src\
    └── flutter\                 <-- FLUTTER_HOME
        ├── bin\                 <-- LOKASI PATH UTAMA
        │   ├── cache\           <-- Tempat penyimpanan Dart SDK & Android Artifacts
        │   ├── internal\
        │   ├── dart.bat
        │   ├── flutter.bat      <-- Skrip eksekusi utama Windows
        │   └── flutter
        ├── dev\
        ├── examples\
        ├── packages\            <-- Flutter Framework Packages
        ├── .gitignore
        └── README.md
```

Jalur (*path*) eksekusi biner utama yang **wajib** dimasukkan ke variabel lingkungan adalah:  
👉 **`C:\src\flutter\bin`**

---

## 4. Konfigurasi Environment Variables (PATH)

Agar perintah `flutter` dan `dart` dapat dipanggil dari terminal mana pun, Anda harus menambahkan `C:\src\flutter\bin` ke variabel lingkungan pengguna (`User Environment Variables`).

### METODE A: Melalui Antarmuka Grafis (GUI Windows) - Rekomendasi
1. Tekan tombol **Windows + R** di keyboard untuk membuka dialog *Run*.
2. Ketik `sysdm.cpl` lalu tekan **Enter** (atau klik **OK**). Ini akan membuka jendela *System Properties*.
3. Pindah ke tab **Advanced** di bagian atas.
4. Klik tombol **Environment Variables...** di bagian kanan bawah.
5. Di panel **User variables for <Nama_Pengguna>**:
   * Cari variabel bernama `Path` (atau `PATH`).
   * Jika variabel `Path` **sudah ada**:
     1. Pilih `Path`, lalu klik tombol **Edit...**.
     2. Di jendela *Edit environment variable*, klik tombol **New** di kolom kanan.
     3. Ketikkan atau tempel lokasi berikut:
        ```plaintext
        C:\src\flutter\bin
        ```
     4. Klik **Move Up** untuk memindahkan jalur ini ke posisi teratas (opsional, tetapi disarankan).
   * Jika variabel `Path` **belum ada**:
     1. Klik tombol **New...** di bawah *User variables*.
     2. Isi *Variable name*: `Path`
     3. Isi *Variable value*: `C:\src\flutter\bin`
6. Klik **OK** pada jendela Edit, klik **OK** pada jendela Environment Variables, dan klik **OK** pada jendela System Properties.

### METODE B: Melalui PowerShell (Otomatis via CLI)
Anda juga dapat menambahkan PATH secara langsung menggunakan skrip PowerShell (Buka PowerShell sebagai Administrator/User biasa):

```powershell
[Environment]::SetEnvironmentVariable(
    "Path",
    [Environment]::GetEnvironmentVariable("Path", "User") + ";C:\src\flutter\bin",
    "User"
)
```

---

## 5. Verifikasi Integrasi Terminal & Flutter Binaries

Setelah mengonfigurasi variabel lingkungan, verifikasi bahwa sistem dapat menemukan biner Flutter dengan benar.

> ⚠️ **PENTING**: Tutup seluruh jendela Terminal, Command Prompt, PowerShell, dan VS Code yang sedang terbuka sebelum melakukan uji coba ini, agar variabel lingkungan baru dimuat oleh sistem.

1. Buka **Command Prompt (cmd)** baru.
2. Jalankan perintah lokasi biner:
   ```cmd
   where flutter
   ```
   **Output yang Benar:**
   ```plaintext
   C:\src\flutter\bin\flutter.bat
   C:\src\flutter\bin\flutter
   ```

3. Jalankan perintah lokasi Dart:
   ```cmd
   where dart
   ```
   **Output yang Benar:**
   ```plaintext
   C:\src\flutter\bin\dart.bat
   C:\src\flutter\bin\dart
   ```

4. Periksa versi Flutter yang terpasang:
   ```cmd
   flutter --version
   ```
   *Saat pertama kali perintah ini dijalankan, Flutter akan secara otomatis mengunduh Dart SDK bawaan dan komponen awal ke dalam folder `C:\src\flutter\bin\cache`.*

---

## 6. Analisis & Eksekusi Flutter Doctor

`flutter doctor` adalah alat diagnostik internal Flutter yang memeriksa seluruh alat pengembangan (*toolchain*) yang terpasang pada komputer Anda.

Jalankan perintah berikut pada Command Prompt / PowerShell:

```cmd
flutter doctor -v
```
*(Opsi `-v` atau `--verbose` digunakan untuk menampilkan rincian detail setiap pemeriksaan).*

### Memahami Hasil Diagnostik `flutter doctor`:

| Simbol | Status | Keterangan |
| :---: | :--- | :--- |
| `[✓]` | **OK / Passed** | Komponen terpasang dengan benar dan siap digunakan. |
| `[!]` | **Warning / Action Required** | Komponen belum lengkap atau memerlukan langkah konfigurasi tambahan. |
| `[✗]` | **Error / Missing** | Komponen utama belum terpasang di sistem. |

### Contoh Output Diagnostik Awal:
```plaintext
[✓] Flutter (Channel stable, 3.24.0, on Microsoft Windows [Version 10.0.22631.3880], locale id-ID)
    • Flutter version 3.24.0 on channel stable at C:\src\flutter
    • Upstream repository https://github.com/flutter/flutter.git
    • Framework revision 80c84f7954 (3 weeks ago), 2024-08-06 14:15:30 -0700
    • Engine revision 0929ba2362
    • Dart version 3.5.0
    • DevTools version 2.37.2

[!] Android toolchain - develop for Android devices
    ✗ Android SDK directory not found. Check Android Studio installation.
[✗] Chrome - develop for web (Cannot find Chrome executable)
[!] Visual Studio - develop Windows apps
    ✗ Visual Studio not installed
[!] Android Studio (not installed)
[!] Connected device (none)
```

> 📌 **Langkah Selanjutnya**: Jangan khawatir dengan tanda `[!]` pada *Android toolchain* atau *Android Studio*. Langkah pelengkap instalasi Android SDK & Android Studio dijelaskan secara mendalam di dokumen **`android-studio-windows.md`**.

---

## 7. Penyiapan Build Tools untuk Desktop Windows (C++)

Jika Anda berencana mengompilasi aplikasi Flutter menjadi aplikasi desktop native Windows (`.exe`), Anda memerlukan kompiler C++ dari Visual Studio.

### Langkah-Langkah Penyiapan:
1. Unduh **Visual Studio Installer** dari [https://visualstudio.microsoft.com/downloads/](https://visualstudio.microsoft.com/downloads/).
2. Jalankan `VisualStudioSetup.exe`.
3. Pada halaman pemilihan beban kerja (*Workloads*):
   * Berikan centang pada **Desktop development with C++** (Pengembangan desktop dengan C++).
4. Di panel sebelah kanan (*Installation details*), pastikan komponen berikut tercentang:
   * `MSVC v143 - VS 2022 C++ x64/x86 build tools`
   * `Windows 10 SDK` atau `Windows 11 SDK`
   * `C++ CMake tools for Windows`
5. Klik **Install** (membutuhkan ruang disk sekitar 7 - 10 GB).
6. Setelah selesai, jalankan kembali `flutter doctor` untuk memastikan Visual Studio tercentang hijau `[✓]`.

---

## 8. Konfigurasi Proxy / Mirror Network (Opsional)

Jika Anda berada di dalam jaringan kantor/kampus yang menggunakan Proxy, atau mengalami kendala koneksi internet saat mengunduh paket Pub, tambahkan variabel lingkungan berikut:

### Konfigurasi Mirror Pub (Untuk Akses Lebih Cepat):
Tambahkan variabel lingkungan pengguna (*User Variables*):
* `PUB_HOSTED_URL` = `https://pub.flutter-io.cn` *(atau mirror resmi lainnya)*
* `FLUTTER_STORAGE_BASE_URL` = `https://storage.flutter-io.cn`

---

## 9. Panduan Troubleshooting & Penyelesaian Masalah Error

### ❓ Masalah 1: `'flutter' is not recognized as an internal or external command`
* **Penyebab Utama**: Path `C:\src\flutter\bin` belum dimasukkan ke variabel lingkungan `Path`, atau jendela Command Prompt tidak ditutup setelah menambahkan variabel baru.
* **Solusi**:
  1. Buka kembali `sysdm.cpl` > Environment Variables > User variables > `Path`.
  2. Pastikan baris `C:\src\flutter\bin` ada tanpa ada tanda petik ganda (`"`) di sekelilingnya.
  3. Tutup dan buka kembali terminal Command Prompt baru.

### ❓ Masalah 2: PowerShell Memblokir Skrip (`ps1 cannot be loaded because running scripts is disabled`)
* **Penyebab**: Kebijakan eksekusi skrip (*Execution Policy*) bawaan Windows membatasi skrip PowerShell otomatis.
* **Solusi**:
  1. Buka PowerShell sebagai **Administrator** (Klik kanan > *Run as Administrator*).
  2. Jalankan perintah:
     ```powershell
     Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
     ```
  3. Ketik `Y` lalu tekan Enter.

### ❓ Masalah 3: Proses `flutter doctor` atau `pub get` Menggantung (*Hangs/Freezes*)
* **Penyebab**: Terdapat file kunci (*lockfile*) yang belum dilepas karena proses sebelumnya dihentikan secara paksa, atau diblokir oleh Antivirus / Windows Defender.
* **Solusi**:
  1. Hapus berkas kunci di folder Flutter:
     ```cmd
     del C:\src\flutter\bin\cache\lockfile
     ```
  2. Buka **Windows Security** > *Virus & threat protection* > *Manage settings* > *Exclusions*.
  3. Tambahkan folder `C:\src\flutter` ke dalam daftar Exclusions agar Antivirus tidak memindai berkas cache Flutter secara real-time.

### ❓ Masalah 4: `Git lockfile error` saat melakukan update Flutter
* **Penyebab**: Berkas `.git/index.lock` masih terkunci.
* **Solusi**: Jalankan perintah berikut di dalam direktori `C:\src\flutter`:
  ```cmd
  cd C:\src\flutter
  del .git\index.lock
  git reset --hard HEAD
  flutter doctor
  ```
