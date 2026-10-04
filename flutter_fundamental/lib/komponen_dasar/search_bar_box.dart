import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Search Bar Box Widget
/// Penjelasan: Digunakan untuk menerima pencarian nama menu, SKU, atau kode dari pengguna.
/// Lokasi Code & Contoh:
/// • search_bar_box.dart:30-39 (TextField)
/// • search_bar_box.dart:41-50 (IconButton)
/// • search_bar_box.dart:25-26 (Row / Horizontal)
/// • search_bar_box.dart:32 (onChanged)
/// ============================================================================
class SearchBarBox extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchBarBox({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      /// ======================================================================
      /// 2. LAYOUT DALAM APLIKASI - Row / Horizontal
      /// Menyusun elemen dari kiri ke kanan (kolom pencarian).
      /// Lokasi Code & Contoh: search_bar_box.dart:25-26
      /// ======================================================================
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),
          Expanded(
            /// ================================================================
            /// 1. KOMPONEN DASAR - Text Field / Input
            /// Digunakan untuk menerima pencarian nama menu, SKU, atau kode dari pengguna.
            /// Lokasi Code & Contoh: search_bar_box.dart:30-39 (TextField)
            /// ================================================================
            child: TextField(
              controller: controller,
              /// ==============================================================
              /// 3. EVENT HANDLING DASAR - onChanged
              /// Menangani perubahan teks saat pengguna mengetik kata kunci di kolom pencarian.
              /// Lokasi Code & Contoh: search_bar_box.dart:32
              /// ==============================================================
              onChanged: onChanged,
              decoration: const InputDecoration(
                hintText: 'Cari nama menu, SKU, atau kode...',
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),
          /// ==================================================================
          /// 1. KOMPONEN DASAR - Button
          /// Digunakan untuk tombol aksi seperti pencarian mic/QR.
          /// Lokasi Code & Contoh: search_bar_box.dart:41-50 (IconButton)
          /// ==================================================================
          IconButton(
            icon: Icon(
              controller.text.isNotEmpty ? Icons.clear : Icons.mic,
              color: Colors.grey.shade700,
            ),
            onPressed: () {
              if (controller.text.isNotEmpty) {
                controller.clear();
                onClear();
              }
            },
          ),
        ],
      ),
    );
  }
}
