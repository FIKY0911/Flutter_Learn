# Panduan Lengkap & Detail: Instalasi Android Studio & Android SDK di Windows

Dokumen ini berisi panduan tingkat lanjut dan rinci untuk menginstal **Android Studio**, mengonfigurasi **Android SDK**, menginstal **Command-line Tools**, mengatur **Variabel Lingkungan Sistem (ANDROID_HOME)**, mengintegrasikan **Plugin Flutter & Dart**, hingga membuat **Android Virtual Device (AVD / Emulator)** di Windows (Windows 10 / 11 64-bit).

---

## 📋 DAFTAR ISI
1. [Peran Android Studio & Android SDK dalam Flutter](#1-peran-android-studio--android-sdk-dalam-flutter)
2. [Spesifikasi & Persyaratan Sistem Minimum](#2-spesifikasi--persyaratan-sistem-minimum)
3. [Pengunduhan & Instalasi Android Studio](#3-pengunduhan--instalasi-android-studio)
4. [Penyiapan Initial Wizard & Penentuan Lokasi SDK](#4-penyiapan-initial-wizard--penentuan-lokasi-sdk)
5. [Konfigurasi SDK Manager & Component Wajib (cmdline-tools)](#5-konfigurasi-sdk-manager--component-wajib-cmdline-tools)
6. [Pengaturan System Environment Variables (ANDROID_HOME & PATH)](#6-pengaturan-system-environment-variables-android_home--path)
7. [Instalasi Plugin Flutter & Dart di Android Studio](#7-instalasi-plugin-flutter--dart-di-android-studio)
8. [Persetujuan Lisensi Android (Android Licenses)](#8-persetujuan-lisensi-android-android-licenses)
9. [Konfigurasi & Pembuatan Android Virtual Device (AVD / Emulator)](#9-konfigurasi--pembuatan-android-virtual-device-avd--emulator)
10. [Konfigurasi Perangkat Fisik (Physical Android Phone Setup)](#10-konfigurasi-perangkat-fisik-physical-android-phone-setup)
11. [Panduan Troubleshooting & Penyelesaian Masalah Error](#11-panduan-troubleshooting--penyelesaian-masalah-error)

---

## 1. Peran Android Studio & Android SDK dalam Flutter

Meskipun Anda menulis kode menggunakan Flutter atau VS Code, Flutter **tetap membutuhkan Android SDK, Build-Tools, dan ADB (Android Debug Bridge)** untuk mengubah kode Dart menjadi paket aplikasi Android (`.apk` / `.aab`) serta menjalankannya di perangkat Android. Android Studio adalah cara resmi dan termudah dari Google untuk mengelola seluruh perkakas ini.

---

## 2. Spesifikasi & Persyaratan Sistem Minimum

* **Sistem Operasi**: Windows 10/11 (64-bit).
* **RAM**: 
  * Minimum: **8 GB**
  * Rekomendasi: **16 GB** (Android Studio + Emulator mengkonsumsi ~6-8 GB RAM saat aktif).
* **Ruang Disk**:
  * Aplikasi Android Studio: **~3 GB**
  * Android SDK, System Images & Emulator: **~10 GB - 15 GB**
* **Teknologi Virtualisasi CPU**: Intel VT-x atau AMD-V (Wajib diaktifkan di BIOS/UEFI untuk menjalankan Emulator).

---

## 3. Pengunduhan & Instalasi Android Studio

### A. Pengunduhan Installer
1. Buka situs resmi Google Android Developer: [https://developer.android.com/studio](https://developer.android.com/studio).
2. Klik tombol **Download Android Studio** (Berkas installer: `android-studio-20xx.x.x-windows.exe`).

### B. Langkah-Langkah Instalasi (Wizard setup)
1. Klik kanan pada berkas `.exe` yang diunduh, lalu pilih **Run as administrator**.
2. Pada layar *Welcome to Android Studio Setup*, klik **Next**.
3. Pada layar **Choose Components**:
   * Centang **Android Studio** *(Wajib)*
   * Centang **Android Virtual Device** *(Wajib - untuk emulator)*
   * Klik **Next**.
4. Pada layar **Configuration Settings (Path Instalasi Aplikasi)**:
   * Jalur instalasi default:  
     👉 **`C:\Program Files\Android\Android Studio`**
   * Klik **Next**.
5. Klik **Install** dan tunggu hingga proses penyalinan selesai.
6. Centang *Start Android Studio*, lalu klik **Finish**.

---

## 4. Penyiapan Initial Wizard & Penentuan Lokasi SDK

Saat Android Studio pertama kali dibuka:

1. **Import Studio Settings**: Pilih **Do not import settings**, lalu klik **OK**.
2. **Data Sharing**: Pilih *Don't send* atau *Send usage statistics*.
3. Pada layar **Welcome**, klik **Next**.
4. Pada layar **Install Type**: Pilih **Custom** *(Sangat disarankan agar kita dapat mengontrol penuh instalasi SDK)*, lalu klik **Next**.
5. Select UI Theme: Pilih tema tampilan (*Darcula / Light*), lalu klik **Next**.
6. **SDK Components Setup**:
   * Perhatikan dan catat lokasi **Android SDK Location**:  
     👉 **`C:\Users\<Nama_User_Anda>\AppData\Local\Android\Sdk`**
     *(Catatan: Folder `AppData` secara default disembunyikan oleh Windows)*.
   * Pastikan komponen berikut tercentang:
     * `Android SDK Platform`
     * `Android Virtual Device`
     * `Performance (Intel HAXM / Android Emulator Hypervisor Driver)`
7. Klik **Next**, pilih **Accept** pada lisensi komponen, lalu klik **Finish** untuk mengunduh SDK awal.

---

## 5. Konfigurasi SDK Manager & Component Wajib (`cmdline-tools`)

> ⚠️ **PENYEBAB UTAMA ERROR FLUTTER DOCTOR:**  
> Secara bawaan, Android Studio **TIDAK** menginstal *Android SDK Command-line Tools*. Hal ini menyebabkan error: `cmdline-tools component is missing` pada `flutter doctor`.

### Langkah-Langkah Menginstal SDK Tools Wajib:
1. Buka Android Studio.
2. Pada layar utama (*Welcome Screen*), klik menu **More Actions** di sebelah kanan, lalu pilih **SDK Manager** (atau jika ada proyek terbuka, buka dari menu `Tools` > `SDK Manager`).
3. Di jendela SDK Manager, pindah ke tab **SDK Tools** di bagian atas.
4. Berikan tanda centang pada item-item berikut:
   * [x] **Android SDK Command-line Tools (latest)** 👈 *(WAJIB UNTUK FLUTTER!)*
   * [x] **Android SDK Platform-Tools** *(Berisi ADB & Fastboot)*
   * [x] **Android SDK Build-Tools 34 (atau versi terbaru)**
   * [x] **Android Emulator**
   * [x] **Android Emulator Hypervisor Driver (for AMD/Intel processors)**
5. Hapus centang pada *Hide Obsolete Packages* jika ingin melihat versi spesifik.
6. Klik tombol **Apply** di kanan bawah, klik **OK** pada dialog konfirmasi.
7. Tunggu hingga proses pengunduhan selesai, lalu klik **Finish** dan **OK**.

---

## 6. Pengaturan System Environment Variables (`ANDROID_HOME` & `PATH`)

Pengaturan variabel lingkungan ini memungkinkan Flutter CLI, Gradle, dan Terminal menemukan lokasi Android SDK dan perkakas `adb`.

### A. Membuat Variabel `ANDROID_HOME`
1. Tekan tombol **Windows + R**, ketik `sysdm.cpl`, lalu tekan Enter.
2. Pindah ke tab **Advanced**, lalu klik **Environment Variables...**.
3. Di panel **User variables for <Nama_User_Anda>** (atau *System variables*):
   * Klik tombol **New...**.
   * Isi **Variable name**: `ANDROID_HOME`
   * Isi **Variable value**: `C:\Users\<Nama_User_Anda>\AppData\Local\Android\Sdk`
     *(Sesuaikan `<Nama_User_Anda>` dengan nama akun Windows Anda)*.
   * Klik **OK**.

### B. Menambahkan Jalur Android Tools ke Variabel `Path`
1. Di panel **User variables**, cari dan pilih variabel `Path`, lalu klik **Edit...**.
2. Klik tombol **New** di kolom kanan, lalu tambahkan 3 baris path baru berikut satu per satu:
   ```plaintext
   %ANDROID_HOME%\platform-tools
   %ANDROID_HOME%\cmdline-tools\latest\bin
   %ANDROID_HOME%\emulator
   ```
3. Klik **OK** pada semua jendela untuk menyimpan.

### C. Verifikasi via Command Prompt Baru
Buka Command Prompt (cmd) baru dan jalankan:
```cmd
adb --version
```
**Output yang Benar:**
```plaintext
Android Debug Bridge version 1.0.41
Version 35.0.1-xxxxxx
Installed as C:\Users\<Nama_User>\AppData\Local\Android\Sdk\platform-tools\adb.exe
```

---

## 7. Instalasi Plugin Flutter & Dart di Android Studio

1. Buka Android Studio.
2. Pada bilah menu kiri, pilih **Plugins** (atau dari menu `File` > `Settings` > `Plugins`).
3. Di tab **Marketplace**, ketik **Flutter** pada kolom pencarian.
4. Klik tombol **Install** pada plugin buatan *flutter.dev*.
5. Akan muncul dialog popup konfirmasi bahwa Flutter membutuhkan plugin **Dart**. Klik **Install** untuk menyetujuinya.
6. Setelah instalasi selesai, klik **Restart IDE** untuk memperbarui sistem.

---

## 8. Persetujuan Lisensi Android (Android Licenses)

Sebelum dapat mengompilasi aplikasi Android, Anda wajib menyetujui lisensi SDK Android via terminal.

1. Buka **Command Prompt (cmd)** atau **PowerShell** baru sebagai pengguna biasa.
2. Jalankan perintah:
   ```cmd
   flutter doctor --android-licenses
   ```
3. Terminal akan menampilkan teks perjanjian lisensi Google SDK.
4. Tekan tombol **`y`** lalu tekan **Enter** pada setiap pertanyaan yang muncul (sekitar 6–7 kali) hingga muncul pernyataan:
   ```plaintext
   All SDK package licenses accepted
   ```

---

## 9. Konfigurasi & Pembuatan Android Virtual Device (AVD / Emulator)

### Langkah-Langkah Pembuatan Emulator:
1. Di Android Studio, klik **More Actions** > **Virtual Device Manager** (atau menu `Tools` > `Device Manager`).
2. Klik tombol **Create device** (atau ikon `+`).
3. **Select Hardware**:
   * Pilih kategori **Phone**.
   * Pilih model ponsel yang menyertakan **Google Play Store** (terdapat ikon Play Store), contohnya **Pixel 7** atau **Pixel 8**.
   * Klik **Next**.
4. **System Image**:
   * Pindah ke tab **Recommended** atau **x86 Images**.
   * Pilih versi Android yang diinginkan, misalnya **API Level 34 (UpsideDownCake)** atau **API Level 33 (Tiramisu)**.
   * Jika ada ikon unduh di samping nama versi, klik ikon tersebut dan tunggu hingga selesai.
   * Pilih System Image yang sudah diunduh, lalu klik **Next**.
5. **Verify Configuration**:
   * Nama AVD: `Pixel 7 API 34` *(Bisa diubah sesuai selera)*.
   * Startup orientation: *Portrait*.
   * Emulated Performance: Pilih *Hardware - GLES 2.0* (untuk performa grafis lebih cepat).
   * Klik **Finish**.
6. Menjalankan Emulator: Klik tombol **Play** (segitiga hijau) di sebelah kanan nama AVD Anda.

---

## 10. Konfigurasi Perangkat Fisik (Physical Android Phone Setup)

Jika Anda ingin menguji aplikasi Flutter secara langsung di HP Android fisik:

1. Buka **Pengaturan (Settings)** di HP Android Anda.
2. Masuk ke **Tentang Ponsel (About Phone)** > Ketuk **Nomor Bentukan (Build Number)** sebanyak **7 kali** berturut-turut hingga muncul pesan *"Anda adalah seorang pengembang!"*.
3. Kembali ke Pengaturan > **Sistem / Opsi Pengembang (Developer Options)**.
4. Aktifkan **Debugging USB (USB Debugging)**.
5. Hubungkan HP Android ke komputer menggunakan kabel data USB.
6. Pada HP Android Anda, centang *Selalu izinkan dari komputer ini*, lalu ketuk **Izinkan (Allow)**.
7. Jalankan perintah ini di Command Prompt Windows untuk memverifikasi HP terdeteksi:
   ```cmd
   flutter devices
   ```

---

## 11. Panduan Troubleshooting & Penyelesaian Masalah Error

### ❓ Masalah 1: Error `cmdline-tools component is missing` di `flutter doctor`
* **Solusi**: Pastikan Anda telah menginstal `Android SDK Command-line Tools (latest)` di SDK Manager (lihat Langkah 5).

### ❓ Masalah 2: Error `Android license status unknown` atau `java.lang.NoClassDefFoundError`
* **Penyebab**: Versi Java Runtime tidak cocok atau SDK command-line tools belum terkonfigurasi.
* **Solusi**:
  1. Atur variabel `JAVA_HOME` mengarah ke JDK bawaan Android Studio:
     * Variable: `JAVA_HOME`
     * Value: `C:\Program Files\Android\Android Studio\jbr`
  2. Buka CMD baru dan jalankan kembali `flutter doctor --android-licenses`.

### ❓ Masalah 3: Android Emulator Sangat Lambat atau Gagal Dijalankan (`VT-x is disabled`)
* **Penyebab**: Fitur Virtualisasi CPU belum diaktifkan di BIOS/UEFI motherboard Anda.
* **Solusi**:
  1. Restart komputer dan masuk ke menu BIOS/UEFI (Tekan F2, Del, atau F12 saat booting).
  2. Cari pengaturan **Intel Virtualization Technology (VT-x)** atau **AMD-V / SVM Mode**.
  3. Ubah nilainya menjadi **Enabled**, simpan (F10), dan boot kembali ke Windows.

### ❓ Masalah 4: Flutter Doctor Tidak Mendeteksi Android Studio (`Android Studio (not installed)`)
* **Penyebab**: Android Studio diinstal di direktori non-standar.
* **Solusi**: Beritahu Flutter lokasi instalasi Android Studio secara manual:
  ```cmd
  flutter config --android-studio-dir="C:\Program Files\Android\Android Studio"
  ```
