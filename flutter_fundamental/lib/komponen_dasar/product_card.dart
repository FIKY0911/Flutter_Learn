import 'package:flutter/material.dart';
import '../models/product_model.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Product Card Widget
/// Penjelasan: Mengelompokkan informasi visual produk (gambar, nama, harga, badge stok) dalam box berbayang.
/// Lokasi Code & Contoh:
/// • product_card.dart:110-140 (Text(product.name), Text(product.priceText))
/// • product_card.dart:48-58 (Image.network(product.imageUrl))
/// • product_card.dart:25 (InkWell)
/// • product_card.dart:28-39 (Container dengan BoxShadow & BorderRadius)
/// ============================================================================
class ProductCard extends StatelessWidget {
  final ProductModel product;
  final VoidCallback onTap;
  final VoidCallback onAddToCart;

  const ProductCard({
    super.key,
    required this.product,
    required this.onTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      /// ======================================================================
      /// 1. KOMPONEN DASAR - Button
      /// Digunakan untuk tombol aksi sentuh area kartu produk (InkWell).
      /// Lokasi Code & Contoh: product_card.dart:25 (InkWell)
      /// ======================================================================
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        /// ====================================================================
        /// 3. EVENT HANDLING DASAR - onTap
        /// Menangani sentuhan pengguna pada kartu produk (onTap memilih item menu).
        /// Lokasi Code & Contoh: product_card.dart:27 (onTap memilih item menu)
        /// ====================================================================
        onTap: onTap,
        /// ====================================================================
        /// 1. KOMPONEN DASAR - Card
        /// Mengelompokkan informasi visual produk (gambar, nama, harga, badge stok) dalam box berbayang.
        /// Lokasi Code & Contoh: product_card.dart:28-39 (Container dengan BoxShadow & BorderRadius)
        /// ====================================================================
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          /// ==================================================================
          /// 2. LAYOUT DALAM APLIKASI - Column / Vertical
          /// Menyusun elemen vertikal dari atas ke bawah di dalam kartu produk.
          /// Lokasi Code & Contoh: product_card.dart:40-42
          /// ==================================================================
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// ==============================================================
              /// 2. LAYOUT DALAM APLIKASI - Stack / Overlay
              /// Menumpuk badge/overlay "Stok Habis" di atas gambar produk.
              /// Lokasi Code & Contoh: product_card.dart:44-45 (Stack gambar & badge)
              /// ==============================================================
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                    /// ========================================================
                    /// 1. KOMPONEN DASAR - Image
                    /// Menampilkan foto produk di katalog.
                    /// Lokasi Code & Contoh: product_card.dart:48-58 (Image.network(product.imageUrl))
                    /// ========================================================
                    child: Image.network(
                      product.imageUrl,
                      height: 120,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 120,
                        color: Colors.grey.shade200,
                        child: const Icon(Icons.fastfood, size: 40, color: Colors.grey),
                      ),
                    ),
                  ),
                  if (product.isOutOfStock)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.6),
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        child: Center(
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            color: Colors.red,
                            child: const Text(
                              'Stok Habis',
                              style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade50,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              product.category,
                              style: TextStyle(fontSize: 10, color: Colors.orange.shade800, fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(height: 4),
                          /// ==================================================
                          /// 1. KOMPONEN DASAR - Text / Label
                          /// Menampilkan judul halaman, nama produk, kategori, harga.
                          /// Lokasi Code & Contoh: product_card.dart:110-140 (Text(product.name))
                          /// ==================================================
                          Text(
                            product.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                          ),
                        ],
                      ),
                      Text(
                        product.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 10, color: Colors.grey),
                      ),
                      /// ======================================================
                      /// 2. LAYOUT DALAM APLIKASI - Row / Horizontal
                      /// Menyusun elemen dari kiri ke kanan (harga + tombol tambah).
                      /// Lokasi Code & Contoh: product_card.dart:131-133
                      /// ======================================================
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          /// ==================================================
                          /// 1. KOMPONEN DASAR - Text / Label
                          /// Menampilkan harga produk.
                          /// Lokasi Code & Contoh: product_card.dart:110-140 (Text(product.priceText))
                          /// ==================================================
                          Text(
                            product.priceText,
                            style: const TextStyle(
                              color: Colors.deepOrange,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                          InkWell(
                            onTap: product.isOutOfStock ? null : onAddToCart,
                            child: Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: product.isOutOfStock ? Colors.grey.shade300 : Colors.deepOrange,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                color: product.isOutOfStock ? Colors.grey : Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
