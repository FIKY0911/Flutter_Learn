import 'package:flutter/material.dart';

/// ============================================================================
/// 3. EVENT HANDLING DASAR - onChanged
/// Penjelasan: Menangani perubahan teks saat pengguna mengetik kata kunci di kolom pencarian.
/// Lokasi Code & Contoh:
/// • home.dart:139-143 (Meng-update _searchQuery secara realtime)
/// • search_bar_box.dart:32
/// ============================================================================
class OnChangedEventExample extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const OnChangedEventExample({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 3. EVENT HANDLING - onChanged
    /// Menangani perubahan teks saat pengguna mengetik kata kunci di kolom pencarian.
    /// ========================================================================
    return TextField(
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Cari nama menu, SKU, atau kode...',
      ),
    );
  }
}
