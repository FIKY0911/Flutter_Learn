import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../komponen_dasar/search_bar_box.dart';
import '../layout_dalam_aplikasi/product_grid.dart';
import '../models/product_model.dart';
import 'app_router.dart';
import 'cart_screen.dart';

/// ============================================================================
/// 4. NAVIGASI ANTARHALAMAN - Home Screen Widget (Kasir Main Page)
/// Penjelasan: Berpindah dari halaman Kasir/Home ke halaman Detail Keranjang sambil membawa data produk (extra). Navigasi menu utama di bagian bawah layar (NavigationBar).
/// Lokasi Code & Contoh:
/// • home.dart:105-108 (context.push(AppRoutes.cart, extra: selectedItems))
/// • home.dart:220-270 (NavigationBar Material 3)
/// • home.dart:127-128 (Stack layar utama)
/// • home.dart:129-130 (CustomScrollView)
/// • home.dart:152-168 (ListView.separated horizontal)
/// • home.dart:164 (onTap memilih filter kategori)
/// • home.dart:139-143 (onChanged update search query)
/// • home.dart:223-243 (onDestinationSelected)
/// ============================================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedCategory = 'Semua';
  int _currentNavIndex = 0;

  final List<String> _categories = ['Semua', 'Makanan', 'Minuman', 'Cemilan'];
  final List<CartItemModel> _cartItems = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<ProductModel> get _filteredProducts {
    return dummyKasirProducts.where((p) {
      final matchesCat = _selectedCategory == 'Semua' || p.category == _selectedCategory;
      final matchesSearch = _searchQuery.isEmpty || p.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCat && matchesSearch;
    }).toList();
  }

  int get _totalCartQuantity => _cartItems.fold(0, (sum, item) => sum + item.quantity);
  double get _totalCartAmount => _cartItems.fold(0, (sum, item) => sum + item.totalPrice);

  void _addToCart(ProductModel product) {
    setState(() {
      final index = _cartItems.indexWhere((i) => i.product.id == product.id);
      if (index >= 0) {
        _cartItems[index].quantity++;
      } else {
        _cartItems.add(CartItemModel(product: product));
      }
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} ditambahkan ke keranjang'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _openCartDetails() {
    if (_cartItems.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Keranjang masih kosong!')),
      );
      return;
    }

    final items = List<CartItemModel>.from(_cartItems);
    try {
      /// ======================================================================
      /// 4. NAVIGASI ANTARHALAMAN - Push / Route Navigation
      /// Berpindah dari halaman Kasir/Home ke halaman Detail Keranjang sambil membawa data produk yang dipilih (extra).
      /// Lokasi Code & Contoh: home.dart:105-108 (context.push(AppRoutes.cart, extra: selectedItems))
      /// ======================================================================
      context.push(AppRoutes.cart, extra: items);
    } catch (_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CartScreen(initialItems: items)),
      );
    }
  }

  void _openHistory() {
    try {
      context.push(AppRoutes.history);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Halaman Riwayat Transaksi')),
      );
    }
  }

  void _openInventory() {
    try {
      context.push(AppRoutes.inventory);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Halaman Kelola Stok')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text('Kasir Warung Mas Rusdi'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: _openHistory,
          ),
          IconButton(
            icon: const Icon(Icons.inventory_2_outlined),
            onPressed: _openInventory,
          ),
        ],
      ),
      /// ======================================================================
      /// 2. LAYOUT DALAM APLIKASI - Stack / Overlay
      /// Menumpuk elemen di atas elemen lain (menumpuk floating bar belanja di atas scroll view).
      /// Lokasi Code & Contoh: home.dart:127-128 (Stack layar utama)
      /// ======================================================================
      body: Stack(
        children: [
          /// ==================================================================
          /// 2. LAYOUT DALAM APLIKASI - Scrollable Layout
          /// Membuat seluruh halaman kasir bisa digulir ketika konten panjang.
          /// Lokasi Code & Contoh: home.dart:129-130 (CustomScrollView)
          /// ==================================================================
          CustomScrollView(
            slivers: [
              // Search Bar Box Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SearchBarBox(
                    controller: _searchController,
                    /// ========================================================
                    /// 3. EVENT HANDLING DASAR - onChanged
                    /// Meng-update _searchQuery secara realtime saat pengguna mengetik kata kunci di kolom pencarian.
                    /// Lokasi Code & Contoh: home.dart:139-143 (Meng-update _searchQuery secara realtime)
                    /// ========================================================
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value;
                      });
                    },
                    onClear: () {
                      setState(() {
                        _searchQuery = '';
                      });
                    },
                  ),
                ),
              ),

              // Category Filter Horizontal List
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 42,
                  /// ==========================================================
                  /// 1. KOMPONEN DASAR - List
                  /// Menampilkan daftar kategori secara horizontal.
                  /// Lokasi Code & Contoh: home.dart:152-168 (ListView.separated horizontal)
                  /// ==========================================================
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: _categories.length,
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final cat = _categories[index];
                      final isSelected = cat == _selectedCategory;
                      return ChoiceChip(
                        label: Text(cat),
                        selected: isSelected,
                        selectedColor: Colors.deepOrange,
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        /// ====================================================
                        /// 3. EVENT HANDLING DASAR - onTap
                        /// Menangani sentuhan pengguna pada kategori (onTap memilih filter kategori).
                        /// Lokasi Code & Contoh: home.dart:164 (onTap memilih filter kategori)
                        /// ====================================================
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = cat;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 16)),

              // Product Grid
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: ProductGrid(
                  products: _filteredProducts,
                  onProductTap: (product) {
                    showModalBottomSheet(
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 8),
                            Text(product.description, style: TextStyle(color: Colors.grey.shade600)),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(product.priceText, style: const TextStyle(fontSize: 18, color: Colors.deepOrange, fontWeight: FontWeight.bold)),
                                ElevatedButton.icon(
                                  onPressed: product.isOutOfStock ? null : () {
                                    Navigator.pop(context);
                                    _addToCart(product);
                                  },
                                  icon: const Icon(Icons.add_shopping_cart),
                                  label: Text(product.isOutOfStock ? 'Stok Habis' : 'Tambah'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.deepOrange,
                                    foregroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  onAddToCart: _addToCart,
                ),
              ),

              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),

          // Floating Cart Bar Overlay (Stack Overlay)
          if (_cartItems.isNotEmpty)
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(16),
                color: Colors.deepOrange,
                child: InkWell(
                  onTap: _openCartDetails,
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Badge(
                              label: Text('$_totalCartQuantity'),
                              backgroundColor: Colors.white,
                              textColor: Colors.deepOrange,
                              child: const Icon(Icons.shopping_bag, color: Colors.white),
                            ),
                            const SizedBox(width: 14),
                            Text(
                              'Rp ${_totalCartAmount.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                        const Row(
                          children: [
                            Text('Keranjang', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_forward_ios, color: Colors.white, size: 14),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),

      /// ======================================================================
      /// 1. KOMPONEN DASAR - Navigation
      /// 4. NAVIGASI ANTARHALAMAN - Bottom Navigation
      /// Baris navigasi bawah untuk berpindah menu utama (Kasir, Keranjang, Riwayat, Kelola Stok).
      /// Lokasi Code & Contoh: home.dart:220-270 (NavigationBar Material 3)
      /// ======================================================================
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentNavIndex,
        /// ====================================================================
        /// 3. EVENT HANDLING DASAR - onDestinationSelected
        /// Menangani saat item pada navigasi bawah (Kasir, Keranjang, Riwayat, Kelola Stok) ditekan.
        /// Lokasi Code & Contoh: home.dart:223-243
        /// ====================================================================
        onDestinationSelected: (int index) {
          setState(() {
            _currentNavIndex = index;
          });
          if (index == 1) {
            _openCartDetails();
          } else if (index == 2) {
            _openHistory();
          } else if (index == 3) {
            _openInventory();
          }
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.point_of_sale), label: 'Kasir'),
          NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
          NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Riwayat'),
          NavigationDestination(icon: Icon(Icons.inventory), label: 'Kelola Stok'),
        ],
      ),
    );
  }
}
