# 📱 Flutter Fundamental Guide & Showcase

Repository modul pembelajaran komprehensif Flutter yang mencakup widget UI dasar, sistem tata letak (*layout*), navigasi antar halaman, serta implementasi studi kasus nyata (*Katalog Warung Mas Rusdi*) menggunakan arsitektur **Atomic Design**.

---

## 📑 Daftar Isi

1. [UI Dasar (Basic Widgets)](#1-ui-dasar-basic-widgets)
   - [Text / Label](#11-text--label)
   - [Image & Avatar](#12-image--avatar)
   - [Button](#13-button)
   - [Text Field / Input](#14-text-field--input)
   - [Card & Container](#15-card--container)
   - [List & ListTile](#16-list--listtile)
   - [Basic Navigation Widgets](#17-basic-navigation-widgets-appbar--bottomsheet)
2. [Layout Widgets](#2-layout-widgets)
   - [Column (Vertical Layout)](#21-column-vertical-layout)
   - [Row (Horizontal Layout)](#22-row-horizontal-layout)
   - [Stack & Overlay](#23-stack--overlay)
   - [Grid Layout](#24-grid-layout)
   - [Scrollable Layout](#25-scrollable-layout)
3. [Navigasi Antar Halaman](#3-navigasi-antar-halaman)
   - [Push & Back Navigation](#31-push--back-navigation)
   - [Bottom Navigation Bar](#32-bottom-navigation-bar)
   - [Drawer Navigation (Side Menu)](#33-drawer-navigation-side-menu)
   - [Tab Navigation (TabBar & TabBarView)](#34-tab-navigation-tabbar--tabbarview)
4. [Studi Kasus Terintegrasi](#4-studi-kasus-terintegrasi-katalog-warung)
5. [Cara Menjalankan Modul](#5-cara-menjalankan-modul)

---

## 1. UI Dasar (Basic Widgets)

Modul ini terletak pada: `lib/modules/basic_ui/`

### 1.1 Text / Label
*File:* `lib/modules/basic_ui/text_label/text_label_screen.dart`

Digunakan untuk menampilkan teks dengan berbagai format gaya (*styling*), pemotongan (*ellipsis*), maupun teks variasi dengan `RichText`.

```dart
// Text Dasar dengan Style
Text(
  'Halo Flutter Developer!',
  style: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  ),
  maxLines: 2,
  overflow: TextOverflow.ellipsis, // Memotong dengan '...' jika teks terlalu panjang
)

// RichText (Kombinasi multiple style dalam satu paragraf)
RichText(
  text: TextSpan(
    text: 'Total: ',
    style: TextStyle(color: Colors.grey, fontSize: 14),
    children: [
      TextSpan(
        text: 'Rp 25.000',
        style: TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ],
  ),
)
```

---

### 1.2 Image & Avatar
*File:* `lib/modules/basic_ui/image/image_screen.dart`

Digunakan untuk memuat gambar dari URL/Internet (`Image.network`), aset lokal (`Image.asset`), serta foto profil bulat (`CircleAvatar`).

```dart
// Gambar dari URL dengan error builder dan placeholder
Image.network(
  'https://images.unsplash.com/photo-1555396273-367ea4eb4db5',
  width: double.infinity,
  height: 200,
  fit: BoxFit.cover, // Menyesuaikan gambar agar mengisi area
  loadingBuilder: (context, child, progress) {
    if (progress == null) return child;
    return Center(child: CircularProgressIndicator());
  },
)

// Avatar Profil Bulat
CircleAvatar(
  radius: 30,
  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=3'),
)
```

---

### 1.3 Button
*File:* `lib/modules/basic_ui/button/button_screen.dart`

Menyediakan variasi tombol interaktif: `ElevatedButton`, `OutlinedButton`, `TextButton`, `IconButton`, dan `FloatingActionButton (FAB)`.

```dart
// Tombol Utama (Elevated)
ElevatedButton(
  onPressed: () {
    // Aksi ketika tombol ditekan
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  child: const Text('Beli Sekarang'),
)

// Tombol Outline (Garis Luar)
OutlinedButton.icon(
  onPressed: () {},
  icon: const Icon(Icons.share),
  label: const Text('Bagikan'),
)

// Tombol Teks / Minimalis
TextButton(
  onPressed: () {},
  child: const Text('Lihat Selengkapnya'),
)
```

---

### 1.4 Text Field / Input
*File:* `lib/modules/basic_ui/text_field_input/text_field_input_screen.dart`

Digunakan untuk menerima input pengguna, validasi data formulir, dan visibilitas password.

```dart
final TextEditingController _nameController = TextEditingController();

// Input Teks dengan Dekorasi
TextField(
  controller: _nameController,
  decoration: InputDecoration(
    labelText: 'Nama Lengkap',
    hintText: 'Masukkan nama Anda',
    prefixIcon: const Icon(Icons.person),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
  ),
)

// Form Validation dengan TextFormField
TextFormField(
  obscureText: true, // Sembunyikan karakter (password)
  decoration: const InputDecoration(
    labelText: 'Kata Sandi',
    prefixIcon: Icon(Icons.lock),
  ),
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    return null;
  },
)
```

---

### 1.5 Card & Container
*File:* `lib/modules/basic_ui/card/card_screen.dart`

`Card` memberikan efek bayangan (*elevation*) dan permukaan terangkat, sedangkan `Container` memberikan kustomisasi dekorasi, *border radius*, *gradient*, dan padding.

```dart
Card(
  elevation: 4,
  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
  child: Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      gradient: LinearGradient(
        colors: [Colors.orange.shade50, Colors.white],
      ),
    ),
    child: const Text('Konten di dalam Card dengan styling'),
  ),
)
```

---

### 1.6 List & ListTile
*File:* `lib/modules/basic_ui/list/list_screen.dart`

Digunakan untuk menampilkan deretan data secara vertikal atau horizontal.

```dart
// ListView.separated untuk data dinamis dengan pembatas (divider)
ListView.separated(
  itemCount: items.length,
  separatorBuilder: (context, index) => const Divider(),
  itemBuilder: (context, index) {
    return ListTile(
      leading: const Icon(Icons.fastfood, color: Colors.orange),
      title: Text('Menu Item #${index + 1}'),
      subtitle: Text('Deskripsi singkat item ke-${index + 1}'),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        // Aksi klik item
      },
    );
  },
)
```

---

### 1.7 Basic Navigation Widgets (AppBar & BottomSheet)
*File:* `lib/modules/basic_ui/navigation/basic_navigation_screen.dart`

Mencakup komponen navigasi struktural dalam satu halaman: `AppBar` (*actions*, *leading*), `PopupMenuButton`, dialog, dan `showModalBottomSheet`.

```dart
// Membuka Modal Bottom Sheet
showModalBottomSheet(
  context: context,
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  ),
  builder: (context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Filter & Pengaturan', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tutup'),
          ),
        ],
      ),
    );
  },
);
```

---

## 2. Layout Widgets

Modul ini terletak pada: `lib/modules/layout/`

### 2.1 Column (Vertical Layout)
*File:* `lib/modules/layout/column_vertical/column_layout_screen.dart`

Menyusun widget anak secara **vertikal** dari atas ke bawah.

```dart
Column(
  mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribusi sumbu utama (vertikal)
  crossAxisAlignment: CrossAxisAlignment.start,       // Posisi sumbu silang (horizontal)
  children: [
    Text('Judul Halaman', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
    const SizedBox(height: 8),
    Text('Subjudul pendukung informasi'),
    const Spacer(), // Mengisi sisa ruang kosong
    ElevatedButton(onPressed: () {}, child: Text('Submit')),
  ],
)
```

---

### 2.2 Row (Horizontal Layout)
*File:* `lib/modules/layout/row_horizontal/row_layout_screen.dart`

Menyusun widget anak secara **horizontal** dari kiri ke kanan. Gunakan `Expanded` atau `Flexible` untuk mencegah *RenderFlex overflow*.

```dart
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const Icon(Icons.star, color: Colors.amber),
    const SizedBox(width: 8),
    Expanded(
      child: Text(
        'Teks panjang yang otomatis menyesuaikan lebar layar',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ),
    ElevatedButton(onPressed: () {}, child: const Text('Aksi')),
  ],
)
```

---

### 2.3 Stack & Overlay
*File:* `lib/modules/layout/stack/stack_layout_screen.dart`

Menyusun widget secara **bertumpuk** (*layering*). Widget `Positioned` digunakan untuk menempatkan elemen pada koordinat tertentu.

```dart
Stack(
  children: [
    // Layer 1: Background Gambar
    ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network('https://images.unsplash.com/photo-1555396273-367ea4eb4db5', height: 180, width: double.infinity, fit: BoxFit.cover),
    ),
    // Layer 2: Badge Diskon di pojok kanan atas
    Positioned(
      top: 12,
      right: 12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(20)),
        child: const Text('PROMO 50%', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
      ),
    ),
  ],
)
```

---

### 2.4 Grid Layout
*File:* `lib/modules/layout/grid/grid_layout_screen.dart`

Menyusun elemen dalam bentuk kotak/tabel multi-kolom responsif menggunakan `GridView.count` atau `GridView.builder`.

```dart
GridView.builder(
  padding: const EdgeInsets.all(16),
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,          // Jumlah 2 kolom
    crossAxisSpacing: 12,       // Jarak horizontal antar item
    mainAxisSpacing: 12,        // Jarak vertikal antar item
    childAspectRatio: 0.75,     // Rasio lebar:tinggi kartu
  ),
  itemCount: 10,
  itemBuilder: (context, index) {
    return Card(
      child: Center(child: Text('Item Grid $index')),
    );
  },
)
```

---

### 2.5 Scrollable Layout
*File:* `lib/modules/layout/scrollable/scrollable_layout_screen.dart`

Mengatur tampilan yang dapat digulir (*scrolling*) dan memanfaatkan efek lanjutan seperti **Slivers / Parallax App Bar**.

```dart
// 1. SingleChildScrollView (Untuk halaman form / konten statis yang panjang)
SingleChildScrollView(
  padding: const EdgeInsets.all(16),
  child: Column(
    children: [ /* Banyak widget */ ],
  ),
)

// 2. CustomScrollView dengan SliverAppBar (Efek Collapsible Header)
CustomScrollView(
  slivers: [
    SliverAppBar(
      expandedHeight: 200.0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text('Detail Produk'),
        background: Image.network('https://placehold.co/600x400', fit: BoxFit.cover),
      ),
    ),
    SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => ListTile(title: Text('Data baris $index')),
        childCount: 20,
      ),
    ),
  ],
)
```

---

## 3. Navigasi Antar Halaman

Modul ini terletak pada: `lib/modules/navigation/`

### 3.1 Push & Back Navigation
*File:* `lib/modules/navigation/push_back/push_back_screen.dart`

Berpindah ke halaman baru menggunakan tumpukan rute (*Navigation Stack*), mengirim parameter, dan menerima data balasan saat kembali (*pop*).

```dart
// 1. Navigasi ke halaman baru (Push)
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailMenuScreen(
      menuItem: selectedItem, // Mengirim parameter/objek
    ),
  ),
);

// 2. Kembali ke halaman sebelumnya (Back / Pop)
Navigator.pop(context);

// 3. Kembali dengan membawa nilai kembalian (Result)
Navigator.pop(context, 'Data hasil seleksi');

// 4. Menerima nilai balasan (Awaiting result)
final result = await Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const FormPage()),
);
if (result != null) {
  print('Data diterima: $result');
}
```

---

### 3.2 Bottom Navigation Bar
*File:* `lib/modules/navigation/bottom_nav/bottom_nav_screen.dart`

Menyediakan bilah navigasi di bagian bawah layar (*Material 3 `NavigationBar`*) untuk beralih antar halaman utama.

```dart
int _selectedIndex = 0;

final List<Widget> _pages = [
  const HomeTab(),
  const SearchTab(),
  const ProfileTab(),
];

Scaffold(
  body: _pages[_selectedIndex],
  bottomNavigationBar: NavigationBar(
    selectedIndex: _selectedIndex,
    onDestinationSelected: (int index) {
      setState(() {
        _selectedIndex = index;
      });
    },
    destinations: const [
      NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Beranda'),
      NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Pencarian'),
      NavigationDestination(icon: Icon(Icons.person_outlined), selectedIcon: Icon(Icons.person), label: 'Profil'),
    ],
  ),
);
```

---

### 3.3 Drawer Navigation (Side Menu)
*File:* `lib/modules/navigation/drawer/drawer_nav_screen.dart`

Menu samping (*drawer panel*) yang dapat ditarik dari sisi kiri layar, umumnya berisi profil pengguna dan daftar rute menu.

```dart
Scaffold(
  appBar: AppBar(title: const Text('Drawer Demo')),
  drawer: Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const UserAccountsDrawerHeader(
          accountName: Text('Mas Rusdi'),
          accountEmail: Text('rusdi@warung.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person, color: Colors.orange, size: 36),
          ),
          decoration: BoxDecoration(color: Colors.orange),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: const Text('Beranda'),
          onTap: () => Navigator.pop(context),
        ),
        ListTile(
          leading: const Icon(Icons.receipt_long),
          title: const Text('Riwayat Transaksi'),
          onTap: () {
            Navigator.pop(context);
            // Navigasi ke halaman riwayat
          },
        ),
      ],
    ),
  ),
  body: const Center(child: Text('Tarik dari kiri atau klik ikon menu di AppBar')),
);
```

---

### 3.4 Tab Navigation (TabBar & TabBarView)
*File:* `lib/modules/navigation/tab/tab_nav_screen.dart`

Memisahkan konten menjadi beberapa tab horizontal menggunakan `DefaultTabController`, `TabBar`, dan `TabBarView`.

```dart
DefaultTabController(
  length: 3, // Jumlah tab
  child: Scaffold(
    appBar: AppBar(
      title: const Text('Kategori Menu'),
      bottom: const TabBar(
        tabs: [
          Tab(icon: Icon(Icons.fastfood), text: 'Makanan'),
          Tab(icon: Icon(Icons.local_cafe), text: 'Minuman'),
          Tab(icon: Icon(Icons.icecream), text: 'Snack'),
        ],
      ),
    ),
    body: const TabBarView(
      children: [
        FoodTabView(),
        DrinkTabView(),
        SnackTabView(),
      ],
    ),
  ),
);
```

---

## 4. Studi Kasus Terintegrasi (Katalog Warung)

*File:* `lib/presentation/screens/home_screen.dart` & `detail_menu_screen.dart`

Studi kasus **Katalog Warung Mas Rusdi** mendemonstrasikan bagaimana seluruh komponen di atas digabungkan menjadi aplikasi utuh dengan arsitektur **Atomic Design**:
- **Atoms**: `AppButton`, `AppBadge`, `AppIconBox`, `AppNetworkImage`, `AppStatusDot`.
- **Molecules**: `PriceTag`, `CategoryChip`, `RatingBadge`, `QuantityCounter`, `SearchBarInput`, `SectionHeader`.
- **Organisms**: `WarungAppBar`, `PromoBanner`, `MenuCard`, `BottomNavBar`, `DetailHeroBanner`, `DetailBottomBar`.
- **Templates**: `CatalogTemplate`, `DetailTemplate`.
- **Screens**: `HomeScreen`, `DetailMenuScreen`.

---

## 5. Cara Menjalankan Modul

1. Masuk ke direktori `flutter_fundamental`:
   ```bash
   cd flutter_fundamental
   ```

2. Jalankan perintah unduh dependencies:
   ```bash
   flutter pub get
   ```

3. Jalankan aplikasi pada simulator / browser / device:
   ```bash
   flutter run
   ```

Aplikasi akan membuka **Main Menu Hub** yang memungkinkan Anda memilih dan mencoba setiap modul (UI Dasar, Layout, Navigasi, atau Aplikasi Katalog) secara langsung.
