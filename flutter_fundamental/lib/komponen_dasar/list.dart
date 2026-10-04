import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - List
/// Penjelasan: Menampilkan daftar kategori secara horizontal dan daftar keranjang secara vertikal.
/// Lokasi Code & Contoh:
/// • home.dart:152-168 (ListView.separated horizontal)
/// • cart_screen.dart:83-87 (ListView.separated vertikal)
/// ============================================================================
class ListWidgetExample extends StatelessWidget {
  final List<String> items;
  final bool isHorizontal;

  const ListWidgetExample({
    super.key,
    required this.items,
    this.isHorizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 1. KOMPONEN DASAR - List
    /// ListView.separated horizontal/vertikal.
    /// ========================================================================
    return ListView.separated(
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      itemCount: items.length,
      separatorBuilder: (context, index) => SizedBox(
        width: isHorizontal ? 8 : 0,
        height: isHorizontal ? 0 : 8,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.deepOrange.shade50,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(items[index]),
        );
      },
    );
  }
}
