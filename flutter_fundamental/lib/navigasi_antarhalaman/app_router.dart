import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/product_model.dart';
import 'cart_screen.dart';
import 'home.dart';
import 'splash_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String home = '/home';
  static const String cart = '/cart';
  static const String history = '/history';
  static const String inventory = '/inventory';
}

/// ============================================================================
/// 4. NAVIGASI ANTARHALAMAN - Router Configuration
/// Penjelasan: Sentralisasi semua rute navigasi aplikasi menggunakan GoRouter.
/// Lokasi Code & Contoh:
/// • app_router.dart:21-50 (appRouter)
/// ============================================================================
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.home,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: AppRoutes.cart,
      builder: (context, state) {
        final items = state.extra as List<CartItemModel>? ?? [];
        return CartScreen(initialItems: items);
      },
    ),
    GoRoute(
      path: AppRoutes.history,
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Riwayat Transaksi')),
        body: const Center(child: Text('Halaman Riwayat Transaksi Kasir')),
      ),
    ),
    GoRoute(
      path: AppRoutes.inventory,
      builder: (context, state) => Scaffold(
        appBar: AppBar(title: const Text('Kelola Stok Produk')),
        body: const Center(child: Text('Halaman Manajemen Stok & Produk')),
      ),
    ),
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      /// ======================================================================
      /// 2. LAYOUT DALAM APLIKASI - Column / Vertical
      /// Menyusun elemen vertikal dari atas ke bawah (dialog error).
      /// Lokasi Code & Contoh: app_router.dart:58-60
      /// ======================================================================
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 60),
          const SizedBox(height: 16),
          Text(
            'Halaman Tidak Ditemukan: ${state.error}',
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            /// ================================================================
            /// 3. EVENT HANDLING DASAR - onPressed
            /// Menangani klik tombol kembali ke beranda.
            /// Lokasi Code & Contoh: app_router.dart:69
            /// ================================================================
            onPressed: () => context.go(AppRoutes.home),
            child: const Text('Kembali ke Beranda'),
          ),
        ],
      ),
    ),
  ),
);
