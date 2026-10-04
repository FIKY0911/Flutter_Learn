import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Button
/// Penjelasan: Digunakan untuk tombol aksi seperti pencarian mic/QR, tambah/kurang kuantitas, dan tombol kembali.
/// Lokasi Code & Contoh:
/// • cart_screen.dart:58-76 (ElevatedButton)
/// • search_bar_box.dart:41-50 (IconButton)
/// • product_card.dart:25 (InkWell)
/// ============================================================================
class ButtonWidgetExample extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const ButtonWidgetExample({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 1. KOMPONEN DASAR - Button
    /// Tombol aksi ElevatedButton, IconButton, atau InkWell.
    /// ========================================================================
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      child: Text(label),
    );
  }
}
