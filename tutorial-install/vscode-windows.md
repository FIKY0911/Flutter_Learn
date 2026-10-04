# Panduan Lengkap & Detail: Instalasi & Konfigurasi Visual Studio Code di Windows untuk Flutter

Dokumen ini berisi panduan komprehensif mengenai instalasi, konfigurasi, integrasi ekstensi, serta optimasi **Visual Studio Code (VS Code)** di sistem operasi Windows (Windows 10 / 11 64-bit) untuk pengembangan aplikasi Flutter dan Dart.

---

## ⚠️ PERHATIAN PENTING: Visual Studio Code vs Visual Studio

Seringkali terjadi kebingungan antara **Visual Studio Code** dan **Visual Studio**:

| Karakteristik | **Visual Studio Code (VS Code)** *(Dokumen ini)* | **Visual Studio (IDE)** |
| :--- | :--- | :--- |
| **Definisi** | Code editor ringan, modular, dan cepat dari Microsoft | Full-featured IDE berukuran besar untuk .NET, C++, C# |
| **Fungsi di Flutter** | **Editor utama** tempat menulis, mengedit kode, debug, dan mengelola proyek Flutter | Toolchain **C++ Build Tools** yang digunakan Flutter saat mem-build aplikasi desktop Windows (`.exe`) |
| **Ukuran Installer** | Ringan (~90 - 100 MB) | Berat (~10 - 30+ GB) |
| **Kebutuhan** | **Sangat Direkomendasikan** untuk coding harian | Hanya dibutuhkan jika Anda ingin kompilasi desktop Windows |

> Jika Anda mencari panduan pemasangan *Visual Studio C++ Build Tools* untuk keperluan desktop target Windows di `flutter doctor`, silakan lihat panduan di [`flutter-windows.md`](flutter-windows.md#7-penyiapan-build-tools-untuk-desktop-windows-c).

---

## 📋 DAFTAR ISI
1. [Spesifikasi & Persyaratan Sistem](#1-spesifikasi--persyaratan-sistem)
2. [Pengunduhan & Instalasi Visual Studio Code](#2-pengunduhan--instalasi-visual-studio-code)
3. [Memastikan Perintah `code` Tersedia di PATH](#3-memastikan-perintah-code-tersedia-di-path)
4. [Instalasi Ekstensi Wajib Flutter & Dart](#4-instalasi-ekstensi-wajib-flutter--dart)
5. [Rekomendasi Ekstensi Pendukung Produktivitas](#5-rekomendasi-ekstensi-pendukung-produktivitas)
6. [Konfigurasi Optimal `settings.json` untuk Flutter](#6-konfigurasi-optimal-settingsjson-untuk-flutter)
7. [Pemilihan Perangkat & Menjalankan Emulator](#7-pemilihan-perangkat--menjalankan-emulator)
8. [Menjalankan & Debugging Proyek Flutter](#8-menjalankan--debugging-proyek-flutter)
9. [Shortcut Keyboard Esensial Flutter di VS Code](#9-shortcut-keyboard-esensial-flutter-di-vs-code)
10. [Panduan Troubleshooting & Solusi Masalah](#10-panduan-troubleshooting--solusi-masalah)

---

## 1. Spesifikasi & Persyaratan Sistem

* **Sistem Operasi**: Windows 10 atau Windows 11 (64-bit).
* **Prosesor**: 1.6 GHz atau lebih cepat.
* **RAM**: Minimal 4 GB (Disarankan 8 GB atau lebih jika menjalankan Android Emulator secara bersamaan).
* **Ruang Disk**: ~500 MB untuk aplikasi VS Code dan ekstensinya.

---

## 2. Pengunduhan & Instalasi Visual Studio Code

### A. Pengunduhan Installer
1. Buka situs resmi Visual Studio Code: [https://code.visualstudio.com/](https://code.visualstudio.com/)
2. Klik tombol **Download for Windows (Stable Build)** (atau pilih tipe *User Installer x64* / *System Installer x64*).
3. Simpan file installer (`VSCodeUserSetup-x64-x.x.x.exe`).

### B. Langkah-Langkah Instalasi (PENTING)
1. Jalankan berkas installer `.exe` yang telah diunduh.
2. Pilih **I accept the agreement**, lalu klik **Next**.
3. Tentukan lokasi instalasi (default disarankan: `C:\Users\<User>\AppData\Local\Programs\Microsoft VS Code`), lalu klik **Next**.
4. Pada layar **Select Additional Tasks**, **PASTIKAN MENCENTANG SEMUA OPSI BERIKUT**:
   - [x] **Add "Open with Code" action to Windows Explorer file context menu** *(Memudahkan membuka file langsung dengan klik kanan)*
   - [x] **Add "Open with Code" action to Windows Explorer directory context menu** *(Memudahkan membuka folder proyek langsung dengan klik kanan)*
   - [x] **Register Code as an editor for supported file types**
   - [x] **Add to PATH (requires shell restart)** 👈 *(WAJIB: agar perintah `code .` dapat dijalankan dari Terminal / Command Prompt)*
5. Klik **Install**, tunggu proses instalasi selesai, lalu klik **Finish** untuk meluncurkan VS Code.

---

## 3. Memastikan Perintah `code` Tersedia di PATH

Untuk memverifikasi bahwa integrasi command line berjalan dengan benar:

1. Buka **Command Prompt** (`cmd`) atau **PowerShell**.
2. Ketik perintah berikut dan tekan Enter:
   ```bash
   code --version
   ```
3. Jika versi VS Code muncul (misalnya `1.9x.x`), integrasi PATH berhasil.
4. Anda dapat membuka folder proyek apa pun langsung dari terminal dengan masuk ke folder tersebut lalu mengetik:
   ```bash
   cd C:\path\ke\proyek_flutter
   code .
   ```

---

## 4. Instalasi Ekstensi Wajib Flutter & Dart

Visual Studio Code membutuhkan ekstensi resmi agar dapat mengenali sintaksis Dart, menyediakan fitur *IntelliSense*, *code completion*, *hot reload*, dan *debugging*.

### Langkah Instalasi via Antarmuka VS Code:
1. Buka **Visual Studio Code**.
2. Buka tab **Extensions** di bilah samping kiri (ikon 4 kotak) atau tekan shortcut **`Ctrl + Shift + X`**.
3. Di kotak pencarian, ketik **`Flutter`**.
4. Temukan ekstensi **Flutter** resmi dari penerbit **Dart Code** (`dart-code.flutter`).
5. Klik tombol **Install**.
   *(Catatan: Menginstal ekstensi Flutter akan secara otomatis menginstal ekstensi **Dart** (`dart-code.dart-code`))* .

### Alternatif: Instalasi via Command Line
Anda juga dapat menginstalnya langsung melalui terminal:
```bash
code --install-extension dart-code.dart-code
code --install-extension dart-code.flutter
```

---

## 5. Rekomendasi Ekstensi Pendukung Produktivitas

Untuk meningkatkan kenyamanan dan kecepatan pengembangan aplikasi Flutter di VS Code:

| Ekstensi | Extension ID | Deskripsi Kegunaan |
| :--- | :--- | :--- |
| **Flutter Tree** | `marqures.flutter-tree` | Memvisualisasikan Widget Tree secara ringkas |
| **Pubspec Assist** | `jeroen-meijer.pubspec-assist` | Membantu menambah/memperbarui package dependencies di `pubspec.yaml` secara otomatis |
| **Error Lens** | `usernamehw.errorlens` | Menampilkan pesan error dan warning langsung di baris kode (inline) tanpa perlu hover |
| **Material Icon Theme** | `pkief.material-icon-theme` | Memberikan ikon folder dan file Dart/Flutter yang rapi dan mudah dikenali |
| **Color Highlight** | `naumovs.color-highlight` | Menampilkan pratinjau warna langsung pada kode hex/Color di editor |
| **Flutter Intl** | `localizely.flutter-intl` | Mempermudah manajemen lokalisasi / multi-bahasa i18n pada aplikasi Flutter |

---

## 6. Konfigurasi Optimal `settings.json` untuk Flutter

Konfigurasi ini mengaktifkan format kode otomatis saat menyimpan file (*Format on Save*), merapikan impor (*Organize Imports*), serta menampilkan panduan indentasi widget tree.

### Cara Membuka `settings.json`:
1. Di VS Code, tekan **`Ctrl + Shift + P`** untuk membuka *Command Palette*.
2. Ketik **`Preferences: Open User Settings (JSON)`** lalu tekan Enter.
3. Tambahkan konfigurasi berikut ke dalam file `settings.json`:

```json
{
  // Pengaturan format dan penyimpanan otomatis
  "editor.formatOnSave": true,
  "editor.formatOnType": true,
  "editor.rulers": [80],
  "editor.tabSize": 2,
  "editor.defaultFormatter": "Dart-Code.dart-code",

  // Otomatis memperbaiki import dan lint saat save
  "editor.codeActionsOnSave": {
    "source.fixAll": "explicit",
    "source.organizeImports": "explicit"
  },

  // Pengaturan khusus bahasa Dart & Flutter
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": "off"
  },

  // Fitur UI Flutter di VS Code
  "dart.previewFlutterUiGuides": true,
  "dart.showTodos": true,
  "dart.lineLength": 80,
  "dart.warnWhenAddDependencyFails": true,
  "dart.flutterCreateAndroidLanguage": "kotlin",
  "dart.flutterCreateIosLanguage": "swift"
}
```

---

## 7. Pemilihan Perangkat & Menjalankan Emulator

VS Code memungkinkan Anda memilih dan menyalakan emulator / target device langsung dari editor:

1. Perhatikan sudut kanan bawah pada **Status Bar** VS Code (biasanya bertuliskan nama device seperti `Windows (windows-x64)`, `Chrome (web)`, `No Device`, atau nama emulator).
2. Klik pada teks target device tersebut (atau tekan **`Ctrl + Shift + P`** dan ketik **`Flutter: Select Device`**).
3. Menu drop-down akan muncul di bagian atas menampilkan:
   - Emulator Android yang sudah dibuat (misal: `Pixel 7 Pro API 34`).
   - Browser Web (misal: `Chrome`).
   - Desktop Windows (`windows`).
   - Opsi **`Create Android emulator`** atau **`Launch Emulator`**.
4. Pilih emulator yang diinginkan untuk meluncurkannya.

---

## 8. Menjalankan & Debugging Proyek Flutter

### Cara 1: Menggunakan Debug Menu / Shortcut (Direkomendasikan)
1. Buka file utama aplikasi: `lib/main.dart`.
2. Tekan **`F5`** untuk menjalankan dalam mode **Debug** (dengan breakpoint).
3. Atau tekan **`Ctrl + F5`** untuk menjalankan dalam mode **Run Without Debugging** (lebih cepat).
4. Saat aplikasi berjalan, bilah kontrol *Debug Toolbar* akan muncul di bagian atas dengan tombol:
   - ⚡ **Hot Reload** (`Ctrl + F5` atau tombol petir)
   - 🔄 **Hot Restart** (`Ctrl + Shift + F5`)
   - ⏸️ **Pause / Resume** (`F6` / `F5`)
   - ⏹️ **Stop** (`Shift + F5`)

### Cara 2: Menggunakan Integrated Terminal VS Code
1. Buka Terminal terintegrasi di VS Code dengan menekan **``Ctrl + ` ``** (backtick).
2. Jalankan perintah:
   ```bash
   flutter run
   ```
3. Tekan tombol **`r`** untuk Hot Reload, **`R`** untuk Hot Restart, atau **`q`** untuk keluar.

---

## 9. Shortcut Keyboard Esensial Flutter di VS Code

| Shortcut | Fungsi |
| :--- | :--- |
| **`Ctrl + .`** *(pada Widget)* | **Quick Fix / Refactor**: Membungkus widget dengan `Padding`, `Center`, `Row`, `Column`, `Container`, atau menghapus widget (*Remove Widget*) |
| **`Ctrl + Shift + P`** | Membuka **Command Palette** untuk semua perintah VS Code / Flutter |
| **`F5`** | Menjalankan aplikasi dalam mode **Start Debugging** |
| **`Ctrl + F5`** | Menjalankan aplikasi dalam mode **Run Without Debugging** |
| **`Ctrl + Shift + F5`** | Melakukan **Hot Restart** pada sesi debug aktif |
| **`Ctrl + Space`** | Membuka auto-complete / saran properti widget (*IntelliSense*) |
| **`F12`** / **`Ctrl + Klik`** | Lompat ke definisi widget / kelas (*Go to Definition*) |
| **`Alt + Shift + F`** | Merapikan format kode dokumen secara manual (*Format Document*) |
| **`stless` + Tab** | Snippet untuk membuat kelas `StatelessWidget` baru secara instan |
| **`stful` + Tab** | Snippet untuk membuat kelas `StatefulWidget` baru secara instan |

---

## 10. Panduan Troubleshooting & Solusi Masalah

### ❌ Error 1: "Flutter SDK not found" di VS Code
* **Penyebab**: VS Code belum mendeteksi letak folder SDK Flutter di sistem Anda.
* **Solusi**:
  1. Tekan **`Ctrl + Shift + P`**, ketik **`Flutter: Change SDK`**.
  2. Pilih **Locate SDK**, lalu arahkan ke folder tempat Anda mengekstrak Flutter SDK (contoh: `C:\src\flutter` atau `C:\flutter`).
  3. Pastikan path `C:\flutter\bin` sudah didaftarkan ke *System Environment Variables (PATH)* Windows.

### ❌ Error 2: Perintah `code` Tidak Dikenali di Terminal
* **Penyebab**: Opsi *Add to PATH* belum dicentang saat instalasi atau terminal belum di-restart.
* **Solusi**:
  1. Tutup semua jendela Command Prompt / PowerShell lalu buka kembali.
  2. Jika masih belum berhasil, tambahkan path berikut ke Environment Variables `Path` user Anda:  
     `C:\Users\<Nama_User>\AppData\Local\Programs\Microsoft VS Code\bin`

### ❌ Error 3: Extension Dart/Flutter Lambat atau Sering Crash
* **Solusi**:
  1. Buka Command Palette (**`Ctrl + Shift + P`**).
  2. Ketik **`Dart: Restart Analysis Server`** lalu tekan Enter.
  3. Lakukan `flutter clean` dan `flutter pub get` di terminal proyek.

---

> 💡 **Tips Tambahan**: Anda dapat menjalankan perintah `flutter doctor` kapan saja melalui Command Palette VS Code (**`Ctrl + Shift + P`** > ketik **`Flutter: Run Flutter Doctor`**) untuk memeriksa kesehatan konfigurasi sistem.
