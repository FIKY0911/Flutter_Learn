import 'package:flutter/material.dart';

/// ============================================================================
/// 3. EVENT HANDLING DASAR - onTap
/// Penjelasan: Menangani sentuhan pengguna pada kategori atau kartu produk.
/// Lokasi Code & Contoh:
/// • home.dart:164 (onTap memilih filter kategori)
/// • product_card.dart:27 (onTap memilih item menu)
/// ============================================================================
class OnTapEventExample extends StatelessWidget {
  final VoidCallback onTap;
  final Widget child;

  const OnTapEventExample({
    super.key,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 3. EVENT HANDLING - onTap
    /// Menangani sentuhan pengguna pada kategori atau kartu produk.
    /// ========================================================================
    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
