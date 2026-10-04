import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/product_model.dart';

/// ============================================================================
/// 4. NAVIGASI ANTARHALAMAN - Back Navigation & Detail Keranjang
/// Penjelasan: Kembali dari halaman Keranjang ke halaman Kasir.
/// Lokasi Code & Contoh:
/// • cart_screen.dart:61 (context.pop())
/// • cart_screen.dart:34-37 (Text('Rincian Keranjang'))
/// • cart_screen.dart:58-76 (ElevatedButton)
/// • cart_screen.dart:89-95 (Card)
/// • cart_screen.dart:83-87 (ListView.separated vertikal)
/// • cart_screen.dart:83 (Scrollable Layout)
/// • cart_screen.dart:59 (onPressed)
/// ============================================================================
class CartScreen extends StatefulWidget {
  final List<CartItemModel> initialItems;

  const CartScreen({
    super.key,
    required this.initialItems,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late List<CartItemModel> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.initialItems);
  }

  double get _grandTotal => _items.fold(0, (sum, item) => sum + item.totalPrice);

  void _popBack(BuildContext context) {
    try {
      if (context.canPop()) {
        /// ====================================================================
        /// 4. NAVIGASI ANTARHALAMAN - Back Navigation
        /// Kembali dari halaman Keranjang ke halaman Kasir.
        /// Lokasi Code & Contoh: cart_screen.dart:61 (context.pop())
        /// ====================================================================
        context.pop();
        return;
      }
    } catch (_) {}
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// ====================================================================
        /// 1. KOMPONEN DASAR - Text / Label
        /// Menampilkan judul halaman ("Rincian Keranjang").
        /// Lokasi Code & Contoh: cart_screen.dart:34-37 (Text('Rincian Keranjang'))
        /// ====================================================================
        title: const Text('Rincian Keranjang'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          /// ==================================================================
          /// 3. EVENT HANDLING DASAR - onPressed
          /// Menangani klik tombol kembali dari keranjang.
          /// Lokasi Code & Contoh: cart_screen.dart:59 (onPressed kembali dari keranjang)
          /// ==================================================================
          onPressed: () => _popBack(context),
        ),
      ),
      body: _items.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  const SizedBox(height: 16),
                  const Text(
                    'Keranjang Anda Kosong',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  /// ==========================================================
                  /// 1. KOMPONEN DASAR - Button
                  /// Digunakan untuk tombol aksi seperti "Kembali ke Kasir".
                  /// Lokasi Code & Contoh: cart_screen.dart:58-76 (ElevatedButton)
                  /// ==========================================================
                  ElevatedButton(
                    onPressed: () => _popBack(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Kembali ke Kasir'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  /// ==========================================================
                  /// 1. KOMPONEN DASAR - List
                  /// Menampilkan daftar keranjang secara vertikal.
                  /// Lokasi Code & Contoh: cart_screen.dart:83-87 (ListView.separated vertikal)
                  /// 
                  /// 2. LAYOUT DALAM APLIKASI - Scrollable Layout
                  /// Membuat daftar keranjang bisa digulir ketika konten panjang.
                  /// Lokasi Code & Contoh: cart_screen.dart:83 (ListView.separated)
                  /// ==========================================================
                  child: ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: _items.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      /// ======================================================
                      /// 1. KOMPONEN DASAR - Card
                      /// Mengelompokkan informasi visual item keranjang.
                      /// Lokasi Code & Contoh: cart_screen.dart:89-95
                      /// ======================================================
                      return Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  item.product.imageUrl,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(width: 60, height: 60, color: Colors.grey.shade200),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      item.product.name,
                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      item.product.priceText,
                                      style: const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove_circle_outline, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        if (item.quantity > 1) {
                                          item.quantity--;
                                        } else {
                                          _items.removeAt(index);
                                        }
                                      });
                                    },
                                  ),
                                  Text(
                                    '${item.quantity}',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.add_circle_outline, color: Colors.green),
                                    onPressed: () {
                                      setState(() {
                                        item.quantity++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 10,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Total Pembayaran', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(
                              'Rp ${_grandTotal.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                              style: const TextStyle(fontSize: 18, color: Colors.deepOrange, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height: 14),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Transaksi Berhasil Disimpan!')),
                              );
                              _popBack(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepOrange,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 14),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                            ),
                            child: const Text('Bayar Sekarang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
