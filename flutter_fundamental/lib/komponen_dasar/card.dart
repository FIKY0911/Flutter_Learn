import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Card
/// Penjelasan: Mengelompokkan informasi visual produk (gambar, nama, harga, badge stok) dalam box berbayang.
/// Lokasi Code & Contoh:
/// • product_card.dart:28-39 (Container dengan BoxShadow & BorderRadius)
/// • cart_screen.dart:89-95 (Card)
/// ============================================================================
class CardWidgetExample extends StatelessWidget {
  final Widget child;

  const CardWidgetExample({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 1. KOMPONEN DASAR - Card
    /// Container berbayang (BoxShadow & BorderRadius) atau Card widget.
    /// ========================================================================
    return Container(
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
      child: child,
    );
  }
}
