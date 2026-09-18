import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:omni_pos/data/models/product_model.dart';
import 'package:omni_pos/presentation/pages/cart_screen.dart';
import 'package:omni_pos/presentation/pages/home.dart';

// Alias if PosScreen is referenced
typedef PosScreen = HomePage;

/// Definisi nama dan path rute untuk konsistensi di seluruh aplikasi
class AppRoutes {
  static const String home = '/';
  static const String homeName = 'home';
  static const String cart = '/cart';
  static const String cartName = 'cart';
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home,
  routes: [
    // Rute Utama: Halaman Kasir / POS Screen
    GoRoute(
      path: AppRoutes.home,
      name: AppRoutes.homeName,
      builder: (BuildContext context, GoRouterState state) {
        return const HomePage();
      },
    ),
    // Rute Keranjang: Menerima data produk yang dipilih melalui state.extra
    GoRoute(
      path: AppRoutes.cart,
      name: AppRoutes.cartName,
      builder: (BuildContext context, GoRouterState state) {
        // Mengambil data parsing jika dikirim lewat context.push
        final items = state.extra as List<ProductModel>? ?? [];
        return CartScreen(selectedProducts: items);
      },
    ),
  ],
  errorBuilder: (BuildContext context, GoRouterState state) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Tidak Ditemukan'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text(
              'Rute "${state.uri}" tidak ditemukan.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(AppRoutes.home),
              child: const Text('Kembali ke Beranda'),
            ),
          ],
        ),
      ),
    );
  },
);