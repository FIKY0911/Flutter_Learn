import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Text Field / Input
/// Penjelasan: Digunakan untuk menerima pencarian nama menu, SKU, atau kode dari pengguna.
/// Lokasi Code & Contoh:
/// • search_bar_box.dart:30-39 (TextField)
/// ============================================================================
class TextFieldInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  const TextFieldInputWidget({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 1. KOMPONEN DASAR - Text Field / Input
    /// Menerima input teks pencarian nama menu, SKU, atau kode.
    /// ========================================================================
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: const InputDecoration(
        hintText: 'Cari nama menu, SKU, atau kode...',
        border: InputBorder.none,
        isDense: true,
      ),
    );
  }
}
