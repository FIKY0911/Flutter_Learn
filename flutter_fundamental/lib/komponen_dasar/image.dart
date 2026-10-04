import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Image
/// Penjelasan: Menampilkan logo aplikasi di Splash Screen dan foto produk di katalog & keranjang.
/// Lokasi Code & Contoh:
/// • splash_screen.dart:49-52 (Image.asset('assets/images/cashier_logo.png'))
/// • product_card.dart:48-58 (Image.network(product.imageUrl))
/// ============================================================================
class ImageWidgetExample extends StatelessWidget {
  final String imageUrl;
  final bool isAsset;

  const ImageWidgetExample({
    super.key,
    required this.imageUrl,
    this.isAsset = false,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 1. KOMPONEN DASAR - Image
    /// Menampilkan logo aplikasi di Splash Screen (Image.asset)
    /// dan foto produk di katalog & keranjang (Image.network).
    /// ========================================================================
    if (isAsset) {
      return Image.asset(
        imageUrl,
        width: 80,
        height: 80,
        errorBuilder: (context, error, stackTrace) => const Icon(
          Icons.point_of_sale_rounded,
          size: 80,
          color: Colors.deepOrange,
        ),
      );
    }

    return Image.network(
      imageUrl,
      height: 120,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => Container(
        height: 120,
        color: Colors.grey.shade200,
        child: const Icon(Icons.fastfood, size: 40, color: Colors.grey),
      ),
    );
  }
}
