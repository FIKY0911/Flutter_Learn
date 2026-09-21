# Product Requirement Document (PRD)
## WarungKatalog Mobile (Fokus Data Dummy & Antarmuka Dasar)

---

## 1. Document Overview & Executive Summary

* **Product Name:** WarungKatalog Mobile
* **Target Milestone:** Pemrograman Mobile Pertemuan 3 & 4 (Praktikum & Tugas Mandiri)
* **Platform:** Mobile Application (Flutter SDK / Android & iOS)
* **Status:** Baseline MVP (Fokus Mockup & In-Memory Data)
* **Tujuan Dokumen:** Mendefinisikan kebutuhan sistem, struktur antarmuka UI, hierarki data dummy lokal, dan batasan implementasi prototipe dua halaman tanpa ketergantungan backend/API.

---

## 2. Problem Statement & User Personas

### 2.1 Problem Statement
Warung makan membutuhkan katalog digital ringkas agar pelanggan dapat melihat daftar menu, variasi harga, serta deskripsi makanan/minuman dengan cepat. Pada aspek pembelajaran, mahasiswa membutuhkan percontohan kode yang memenuhi syarat minimal dua halaman, menggunakan komponen visual dasar, dan menerapkan pemisahan data dummy yang terstruktur.

### 2.2 User Persona
* **Mahasiswa / Developer Pemula:** Membutuhkan struktur kode yang rapi, mudah dipelajari alur datanya, dan bebas dari error overflow.
* **Pelanggan Warung (End User):** Memerlukan daftar menu yang mudah dibaca, informasi harga yang transparan, serta navigasi yang responsif.

---

## 3. Product Scope & Functional Requirements

### 3.1 Functional Requirements Matrix

| ID | Fitur / Komponen | Kebutuhan Fungsional | Komponen UI Flutter | Prioritas |
| :--- | :--- | :--- | :--- | :--- |
| **FR-01** | Halaman Utama (Home) | Menampilkan app bar dengan judul dan tata letak vertikal | `Scaffold`, `AppBar`, `Column` | P0 (Wajib) |
| **FR-02** | Form Input Mockup | Input textfield untuk simulasi kolom pencarian menu | `TextField`, `InputDecoration` | P1 |
| **FR-03** | Daftar Katalog | Render daftar kartu menu secara berulang dari sumber data dummy | `ListView.builder` | P0 (Wajib) |
| **FR-04** | Komponen Kartu Menu | Kartu menu memuat ikon kategori, teks nama, teks harga terformat, dan tombol aksi | `Card`, `Container`, `Icon`, `Text`, `ElevatedButton` | P0 (Wajib) |
| **FR-05** | Efek Sentuhan | Efek riak material (*ripple*) saat area kartu disentuh | `InkWell`, `Material` | P1 |
| **FR-06** | Navigasi Antarhalaman | Berpindah dari Home ke Detail dengan meneruskan objek data menu | `Navigator.push`, `MaterialPageRoute` | P0 (Wajib) |
| **FR-07** | Halaman Detail | Menampilkan banner visual, badge kategori, judul besar, harga, dan teks deskripsi lengkap | `SingleChildScrollView`, `Column`, `Divider`, `Text` | P0 (Wajib) |
| **FR-08** | Tombol Kembali | Navigasi kembali ke halaman utama dari app bar atau tombol | `Navigator.pop` | P0 (Wajib) |
| **FR-09** | Feedback Aksi | Menampilkan umpan balik visual (*SnackBar*) saat tombol pesan ditekan | `ScaffoldMessenger`, `SnackBar` | P0 (Wajib) |

---

## 4. Struktur Data Dummy (In-Memory Model)

Data dummy dibuat *strongly-typed* menggunakan model Dart murni dan disimpan dalam list statis lokal tanpa memanggil endpoint backend atau server database.

### 4.1 Skema Entity Data (`MenuModel`)
* `id` (`String`): Identifier unik item menu.
* `name` (`String`): Nama menu makanan/minuman.
* `category` (`String`): Kategori menu (`Makanan`, `Minuman`, `Camilan`).
* `price` (`int`): Nilai harga integer murni (memudahkan agregasi/perhitungan di masa depan).
* `rating` (`double`): Nilai rating kepuasan menu.
* `icon` (`IconData`): Ikon bawaan Material Icons untuk stabilitas rendering tanpa aset eksternal.
* `description` (`String`): Paragraf deskripsi rincian menu.
* `isAvailable` (`bool`): Status ketersediaan menu di warung.

### 4.2 Dataset In-Memory (`dummyMenuList`)
Memuat minimal 9 entitas menu yang mewakili:
1. **Makanan:** Nasi Goreng Spesial, Ayam Bakar Madu, Mie Goreng Seafood, Soto Ayam Lamongan.
2. **Minuman:** Es Teh Manis Melati, Es Jeruk Peras Murni, Kopi Susu Gula Aren.
3. **Camilan:** Tahu Goreng Krispi, Pisang Bakar Keju Cokelat.

---

## 5. Arsitektur Antarmuka (Information Architecture)

```text
[ Root: WarungKatalogApp ]
 │
 ├── [ Screen 1: HomeScreen ]
 │     ├── AppBar ('Warung Mas Fiky')
 │     └── Column Layout
 │           ├── TextField (Pencarian Menu)
 │           ├── Section Title ('Daftar Menu Hari Ini')
 │           └── ListView.builder (Sumber: dummyMenuList)
 │                 └── MenuItemCard (Card + InkWell)
 │                       ├── Icon Container (Visual Produk)
 │                       ├── Text Column (Nama & Harga Rupiah)
 │                       └── Button ('Detail') ──> Navigator.push(DetailMenuScreen)
 │
 └── [ Screen 2: DetailMenuScreen ]
       ├── AppBar ('Detail Menu' + Back Button) ──> Navigator.pop()
       ├── SingleChildScrollView
       │     ├── Banner Icon Box
       │     ├── Category Tag
       │     ├── Title Text (Bold H1)
       │     ├── Price Text (Green Accent)
       │     ├── Divider
       │     └── Description Paragraph (Grey-700)
       └── Sticky Bottom Bar
             └── Button ('Pesan Sekarang') ──> Trigger SnackBar Feedback
