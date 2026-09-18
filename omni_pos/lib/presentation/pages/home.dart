import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omni_pos/core/constants/app_colors.dart';
import 'package:omni_pos/core/routes/app_router.dart';
import 'package:omni_pos/data/datasources/dummy_products.dart';
import 'package:omni_pos/data/models/product_model.dart';
import 'package:omni_pos/presentation/components/atoms/category_pill.dart';
import 'package:omni_pos/presentation/components/molecules/floating_cart_bar.dart';
import 'package:omni_pos/presentation/components/molecules/pos_header.dart';
import 'package:omni_pos/presentation/components/molecules/search_bar_box.dart';
import 'package:omni_pos/presentation/components/organisms/product_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedCategoryIndex = 0;
  int _currentNavIndex = 0;
  String _searchQuery = '';

  // Clone data dari dummy agar state selectedQty bisa diubah lokal di UI
  List<ProductModel> _productList = List.from(dummyProducts);

  final List<Map<String, dynamic>> _categories = const [
    {'name': 'Semua', 'count': 18},
    {'name': 'Makanan', 'count': 8},
    {'name': 'Minuman', 'count': 6},
    {'name': 'Camilan', 'count': 4},
  ];

  @override
  void initState() {
    super.initState();
    _productList = List.from(dummyProducts);
  }

  // Hitung total item yang dipilih untuk floating bar
  int get _totalItems =>
      _productList.fold(0, (sum, item) => sum + item.selectQty);

  // Total harga belanja terhitung dinamis
  int get _totalPriceRaw => _productList.fold(
      0, (sum, item) => sum + (item.price * item.selectQty));

  String get _totalPriceFormatted {
    final str = _totalPriceRaw.toString();
    final buffer = StringBuffer();
    for (int i = 0; i < str.length; i++) {
      if (i > 0 && (str.length - i) % 3 == 0) {
        buffer.write('.');
      }
      buffer.write(str[i]);
    }
    return 'Rp $buffer';
  }

  // Filter produk berdasarkan kategori yang dipilih dan kata kunci pencarian
  List<ProductModel> get _filteredProducts {
    return _productList.where((product) {
      if (_selectedCategoryIndex > 0) {
        final cat = _categories[_selectedCategoryIndex]['name'] as String;
        if (!product.category.toUpperCase().contains(cat.toUpperCase())) {
          return false;
        }
      }
      if (_searchQuery.trim().isNotEmpty) {
        final query = _searchQuery.toLowerCase().trim();
        final matchesName = product.name.toLowerCase().contains(query);
        final matchesCategory = product.category.toLowerCase().contains(query);
        if (!matchesName && !matchesCategory) {
          return false;
        }
      }
      return true;
    }).toList();
  }

  void _handleAdd(ProductModel product) {
    final index = _productList.indexWhere((element) => element.id == product.id);
    if (index != -1) {
      setState(() {
        final current = _productList[index];
        _productList[index] = current.copyWith(selectQty: current.selectQty + 1);
      });
    }
  }

  void _handleRemove(ProductModel product) {
    final index = _productList.indexWhere((element) => element.id == product.id);
    if (index != -1 && _productList[index].selectQty > 0) {
      setState(() {
        final current = _productList[index];
        _productList[index] = current.copyWith(selectQty: current.selectQty - 1);
      });
    }
  }

  Future<void> _navigateToCart() async {
    // Navigasi ke Rute Keranjang via GoRouter
    final selectedItems = _productList.where((p) => p.selectQty > 0).toList();
    final result = await context.push<bool>(
      AppRoutes.cart,
      extra: selectedItems,
    );

    // Jika checkout selesai dilakukan, reset kuantitas item
    if (result == true && mounted) {
      setState(() {
        _productList = _productList
            .map((p) => p.selectQty > 0 ? p.copyWith(selectQty: 0) : p)
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final displayProducts = _filteredProducts;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // 1. Molekul Header Stan
                const SliverToBoxAdapter(
                  child: PosHeader(),
                ),

                // 2. Molekul Search Box + Scanner
                SliverToBoxAdapter(
                  child: SearchBarBox(
                    onChanged: (val) {
                      setState(() {
                        _searchQuery = val;
                      });
                    },
                  ),
                ),

                // 3. Atom Kategori (Horizontal List)
                SliverToBoxAdapter(
                  child: Container(
                    height: 52,
                    margin: const EdgeInsets.only(top: 10),
                    child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      scrollDirection: Axis.horizontal,
                      itemCount: _categories.length,
                      separatorBuilder: (_, _) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final cat = _categories[index];
                        return Center(
                          child: CategoryPill(
                            title: cat['name'],
                            count: cat['count'],
                            isSelected: index == _selectedCategoryIndex,
                            onTap: () => setState(() => _selectedCategoryIndex = index),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // 4. Organisme Product Grid / Pesan Kosong
                if (displayProducts.isEmpty)
                  const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 48, horizontal: 16),
                      child: Center(
                        child: Text(
                          'Tidak ada menu yang sesuai pencarian.',
                          style: TextStyle(color: AppColors.textMuted, fontSize: 13),
                        ),
                      ),
                    ),
                  )
                else
                  ProductGrid(
                    products: displayProducts,
                    onAdd: _handleAdd,
                    onRemove: _handleRemove,
                    onProductTap: (product) {
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Menu ${product.name} dipilih'),
                          duration: const Duration(milliseconds: 700),
                        ),
                      );
                    },
                  ),
              ],
            ),

            // 5. Molekul Floating Cart Bar (Tampil jika ada item)
            if (_totalItems > 0)
              Positioned(
                bottom: 12,
                left: 16,
                right: 16,
                child: FloatingCartBar(
                  totalItemCount: _totalItems,
                  totalPrice: _totalPriceFormatted,
                  onCheckout: _navigateToCart,
                ),
              ),
          ],
        ),
      ),

      // 6. Navigasi Bawah (BottomNavigationBar Material 3)
      bottomNavigationBar: NavigationBar(
        height: 62,
        selectedIndex: _currentNavIndex,
        onDestinationSelected: (index) {
          if (index == 1) {
            _navigateToCart();
            return;
          }
          if (index == 2 || index == 3) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  index == 2
                      ? 'Fitur Riwayat Transaksi sedang dalam pengembangan'
                      : 'Fitur Kelola Stok sedang dalam pengembangan',
                ),
                duration: const Duration(milliseconds: 1500),
              ),
            );
            return;
          }
          setState(() => _currentNavIndex = index);
        },
        indicatorColor: Colors.transparent,
        destinations: [
          const NavigationDestination(
            icon: Icon(Icons.storefront_outlined, size: 20),
            selectedIcon: Icon(Icons.storefront, color: AppColors.primary, size: 20),
            label: 'Kasir',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('$_totalItems', style: const TextStyle(fontSize: 9)),
              child: const Icon(Icons.shopping_bag_outlined, size: 20),
            ),
            selectedIcon: const Icon(Icons.shopping_bag, color: AppColors.primary, size: 20),
            label: 'Keranjang',
          ),
          const NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined, size: 20),
            selectedIcon: Icon(Icons.receipt_long, color: AppColors.primary, size: 20),
            label: 'Riwayat',
          ),
          const NavigationDestination(
            icon: Icon(Icons.inventory_2_outlined, size: 20),
            selectedIcon: Icon(Icons.inventory_2, color: AppColors.primary, size: 20),
            label: 'Kelola Stok',
          ),
        ],
      ),
    );
  }
}