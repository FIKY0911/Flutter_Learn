# Flutter Learn 🚀

Repository ini berisi kumpulan proyek dan latihan pembelajaran pengembangan aplikasi menggunakan Flutter & Dart.

---

## 📂 Struktur Proyek

Repository ini memiliki beberapa sub-proyek Flutter:
- **`flutter_fundamental/`**: Latihan dasar dan konsep fundamental Flutter (widget, layout, state, dll).
- **`mynotes/`**: Aplikasi catatan (*Notes App*).
- **`omni_pos/`**: Proyek aplikasi *Point of Sale* (POS).
- **`tutorial-install/`**: Panduan/catatan instalasi dan konfigurasi lingkungan Flutter.

---

## 🛠️ Prasyarat (Prerequisites)

Sebelum memulai, pastikan perangkat Anda telah terpasang:
1. **Git**: [Unduh Git](https://git-scm.com/)
2. **Flutter SDK**: [Panduan Instalasi Flutter](https://docs.flutter.dev/get-started/install) (versi stable direkomendasikan)
3. **IDE / Editor**: Visual Studio Code atau Android Studio dengan ekstensi Flutter & Dart.
4. **Target Device**: Android Emulator, iOS Simulator, Perangkat Fisik (dengan USB Debugging aktif), atau Web Browser (Chrome).

Pastikan instalasi Flutter sudah siap dengan menjalankan perintah berikut di terminal:
```bash
flutter doctor
```

---

## 🚀 Panduan Memulai (Getting Started)

### 1. Clone Repository

Buka terminal dan clone repository ini ke komputer lokal Anda:

**Menggunakan HTTPS:**
```bash
git clone https://github.com/FIKY0911/Flutter_Learn.git
```

**Atau menggunakan SSH:**
```bash
git clone git@github.com:FIKY0911/Flutter_Learn.git
```

Setelah itu, masuk ke direktori repository:
```bash
cd Flutter_Learn
```

---

### 2. Pilih Sub-Proyek & Install Dependencies (`flutter pub get`)

Masuk ke folder sub-proyek yang ingin Anda jalankan, lalu unduh semua dependencies yang dibutuhkan:

```bash
# Contoh: Masuk ke folder flutter_fundamental
cd flutter_fundamental

# Mengunduh dependencies package
flutter pub get
```

> **Catatan:** Lakukan langkah `flutter pub get` di dalam direktori sub-proyek yang bersangkutan (misalnya `cd omni_pos` atau `cd mynotes`), bukan di direktori *root*.

---

### 3. Menjalankan Aplikasi (`flutter run`)

1. **Periksa device / emulator yang terhubung:**
   ```bash
   flutter devices
   ```

2. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

3. **Menjalankan pada device / target spesifik:**
   Jika Anda memiliki lebih dari satu device/emulator aktif, tentukan target menggunakan flag `-d`:
   ```bash
   # Menjalankan di Chrome (Web)
   flutter run -d chrome

   # Menjalankan di Linux Desktop
   flutter run -d linux

   # Menjalankan di Device/Emulator Android tertentu
   flutter run -d <DEVICE_ID>
   ```

---

## 💡 Perintah Bermanfaat Lainnya

| Perintah | Deskripsi |
| :--- | :--- |
| `flutter doctor` | Memeriksa kelengkapan lingkungan pengembangan Flutter |
| `flutter pub get` | Mengunduh package/library yang didefinisikan di `pubspec.yaml` |
| `flutter pub upgrade` | Memperbarui package dependencies ke versi terbaru yang kompatibel |
| `flutter clean` | Membersihkan cache build (gunakan jika terjadi konflik build/error aneh) |
| `flutter run` | Menjalankan aplikasi dalam mode *Debug* dengan fitur Hot Reload |
| `flutter build apk` | Melakukan build aplikasi Android (APK) dalam mode *Release* |

---

## ⌨️ Kontrol Saat Aplikasi Berjalan (Hot Reload & Hot Restart)

Ketika aplikasi berjalan via terminal (`flutter run`):
- Tekan **`r`** : Melakukan **Hot Reload** (memperbarui perubahan UI tanpa me-restart state).
- Tekan **`R`** : Melakukan **Hot Restart** (me-restart seluruh state aplikasi).
- Tekan **`q`** : Menghentikan aplikasi (*Quit*).
- Tekan **`h`** : Menampilkan bantuan daftar shortcut perintah.
