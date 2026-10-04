import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Text / Label
/// Penjelasan: Menampilkan judul halaman, nama produk, kategori, harga, dan pesan error.
/// Lokasi Code & Contoh:
/// • product_card.dart:110-140 (Text(product.name), Text(product.priceText))
/// • cart_screen.dart:34-37 (Text('Rincian Keranjang'))
/// ============================================================================
class TextLabelExample extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const TextLabelExample({
    super.key,
    required this.text,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 1. KOMPONEN DASAR - Text / Label
    /// Menampilkan judul halaman, nama produk, kategori, harga, dan pesan error.
    /// ========================================================================
    return Text(
      text,
      style: style ?? const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
    );
  }
}
