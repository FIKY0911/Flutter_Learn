# Business Requirement Document (BRD)
## WarungKatalog Mobile System

---

## 1. Document Control & Executive Summary

* **Project Name:** WarungKatalog Mobile System
* **Document Version:** 1.0.0
* **Target Release:** Pemrograman Mobile Pertemuan 3 & 4 (Academic Milestone & Practical Track)
* **Prepared By:** Senior Mobile Software Engineer / Lead Technical Mentor
* **Executive Summary:** Dokumen ini merumuskan justifikasi bisnis, batasan cakupan, objektif strategis, serta kebutuhan fungsional tingkat tinggi untuk sistem katalog menu warung makan berbasis mobile. Sistem ini dirancang untuk mengatasi inefisiensi penyampaian informasi menu konvensional sekaligus menjadi standar pembelajaran implementasi UI responsif, penanganan event dasar, dan navigasi multi-layar.

---

## 2. Business Objectives & Strategic Alignment

### 2.1 Latar Belakang Masalah (Business Problem)
* **Keterbatasan Media Fisik:** Menu cetak konvensional rentan rusak, memerlukan biaya cetak ulang setiap ada pembaruan harga, dan tidak memberikan pengalaman interaktif bagi pelanggan.
* **Kejelasan Informasi Produk:** Pelanggan sering membutuhkan informasi rincian komposisi/deskripsi makanan sebelum memesan, yang memakan waktu pelayan jika dijelaskan berulang kali secara lisan.
* **Kebutuhan Standarisasi Praktikum:** Diperlukan studi kasus aplikasi yang mencakup seluruh capaian pembelajaran (komponen antarmuka, layout terstruktur, navigasi, dan event handling) tanpa terbebani kompleksitas arsitektur backend di tahap awal.

### 2.2 Objektif Bisnis (SMART Objectives)
1. **Transparansi Informasi:** Menyediakan katalog digital dengan akses detail produk 100% luring (*in-memory*) secara instan (< 1 detik per transisi halaman).
2. **Efisiensi Operasional:** Mengurangi waktu tanya-jawab menu antara pelanggan dan pelayan warung dengan visualisasi dan rincian yang lengkap.
3. **Capaian Pedagogis (Academic Target):** Memastikan 100% mahasiswa mampu memahami alur perpindahan data antarhalaman (*push payload*) dan pemisahan presentational widget dari data model.

---

## 3. Stakeholder Analysis

| Stakeholder | Peran / Kategori | Kebutuhan Utama (*Key Interests*) |
| :--- | :--- | :--- |
| **Pelanggan Warung** | End-User (Eksternal) | Akses cepat ke daftar menu, kejelasan harga, kemudahan navigasi detail produk, dan konfirmasi pemesanan[cite: 1]. |
| **Pemilik Warung** | Business Owner (Internal) | Katalog menu tersusun rapi, representasi makanan menarik, dan potensi pengurangan beban operasional cetak menu. |
| **Dosen / Instruktur** | Academic Evaluator | Pemenuhan rubrik capaian pembelajaran: minimal 2 halaman, 5 komponen UI, event handling, dan layout rapi[cite: 1]. |
| **Mahasiswa Developer** | Technical Implementer | Struktur kode deklaratif yang mudah dipahami, arsitektur modular, dan dokumentasi teknis yang jelas[cite: 1]. |

---

## 4. Project Scope

### 4.1 In-Scope (Fase 1 - Baseline MVP)
* Penyediaan katalog menu berbasis kategori (Makanan, Minuman, Camilan) menggunakan list data model in-memory.
* Fitur penelusuran visual via mock-up search box untuk kemudahan identifikasi menu[cite: 1].
* Tampilan antarmuka dua halaman: Halaman Katalog (Beranda) dan Halaman Rincian Menu (Detail)[cite: 1].
* Mekanisme interaksi ketuk: navigasi berparameter (*payload passing*) dan umpan balik visual (*SnackBar notification*)[cite: 1].
* Tata letak modular menggunakan kaidah hierarki visual (*typography, padding, spacing*)[cite: 1].

### 4.2 Out-of-Scope (Ditunda ke Fase Berikutnya)
* Integrasi jaringan internet, REST API eksternal, dan backend database (Node.js/Express).
* Pemrosesan transaksi pembayaran (*payment gateway*) dan verifikasi perbankan.
* Autentikasi akun pengguna (Login / Register / Multi-role permissions).
* Pelacakan pesanan real-time berbasis GPS atau WebSocket.

---

## 5. Business Process Flow (Alur Proses Bisnis)

```text
[ Pelanggan Membuka Aplikasi ]
              │
              ▼
[ Menampilkan Daftar Menu (HomeScreen) ]
              │
              ├──> [ Melihat Foto/Ikon, Judul, & Harga ]
              │
              ├──> [ Mengetik Kata Kunci di Kolom Pencarian (Mockup) ]
              │
              ▼
[ Memilih Kartu Menu / Tombol "Detail" ]
              │
              │ (Alur Navigasi: Push Data Model)
              ▼
[ Masuk ke Halaman Detail (DetailMenuScreen) ]
              │
              ├──> [ Membaca Deskripsi Lengkap Produk ]
              │
              ├──> [ Menekan Tombol Kembali ] ──> [ Kembali ke HomeScreen ]
              │
              ▼
[ Menekan Tombol "Pesan Sekarang" ]
              │
              ▼
[ Sistem Menampilkan Umpan Balik: "Menu Berhasil Ditambahkan" ]
