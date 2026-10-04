import 'package:flutter/material.dart';

/// ============================================================================
/// 3. EVENT HANDLING DASAR - onPressed
/// Penjelasan: Menangani klik tombol (misalnya tombol "Kembali ke Kasir").
/// Lokasi Code & Contoh:
/// • cart_screen.dart:59 (onPressed kembali dari keranjang)
/// • app_router.dart:69
/// ============================================================================
class OnPressedEventExample extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const OnPressedEventExample({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 3. EVENT HANDLING - onPressed
    /// Menangani klik tombol aksi (misalnya tombol "Kembali ke Kasir").
    /// ========================================================================
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
