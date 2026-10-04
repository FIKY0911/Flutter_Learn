import 'package:flutter/material.dart';

/// ============================================================================
/// 1. KOMPONEN DASAR ANTARMUKA MOBILE - Navigation
/// Penjelasan: Baris navigasi bawah untuk berpindah menu utama.
/// Lokasi Code & Contoh:
/// • home.dart:220-270 (NavigationBar Material 3)
/// ============================================================================
class NavigationComponentExample extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const NavigationComponentExample({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 1. KOMPONEN DASAR - Navigation
    /// NavigationBar Material 3 menu utama bagian bawah.
    /// ========================================================================
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.point_of_sale), label: 'Kasir'),
        NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Keranjang'),
        NavigationDestination(icon: Icon(Icons.receipt_long), label: 'Riwayat'),
        NavigationDestination(icon: Icon(Icons.inventory), label: 'Kelola Stok'),
      ],
    );
  }
}
