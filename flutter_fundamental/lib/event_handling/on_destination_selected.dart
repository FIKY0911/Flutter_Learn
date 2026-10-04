import 'package:flutter/material.dart';

/// ============================================================================
/// 3. EVENT HANDLING DASAR - onDestinationSelected
/// Penjelasan: Menangani saat item pada navigasi bawah (Kasir, Keranjang, Riwayat, Kelola Stok) ditekan.
/// Lokasi Code & Contoh:
/// • home.dart:223-243
/// ============================================================================
class OnDestinationSelectedEventExample extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const OnDestinationSelectedEventExample({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    /// ========================================================================
    /// 3. EVENT HANDLING - onDestinationSelected
    /// Menangani saat item pada navigasi bawah ditekan.
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
