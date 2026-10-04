import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_router.dart';
import 'home.dart';

/// ============================================================================
/// 4. NAVIGASI ANTARHALAMAN - Redirect / Replacement Navigation
/// Penjelasan: Pindah otomatis setelah Splash Screen berpendar 1 detik.
/// Lokasi Code & Contoh:
/// • splash_screen.dart:24 (context.go(AppRoutes.home))
/// ============================================================================
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Timing delay 1 detik sebelum navigasi redirect replacement ke Halaman Utama
    Timer(const Duration(seconds: 1), () {
      if (mounted) {
        try {
          /// ==================================================================
          /// 4. NAVIGASI ANTARHALAMAN - Redirect / Replacement Navigation
          /// Pindah otomatis setelah Splash Screen berpendar 1 detik.
          /// Lokasi Code & Contoh: splash_screen.dart:24 (context.go(AppRoutes.home))
          /// ==================================================================
          context.go(AppRoutes.home);
        } catch (_) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container Logo Splash Screen
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              /// ==============================================================
              /// 1. KOMPONEN DASAR - Image
              /// Menampilkan logo aplikasi di Splash Screen.
              /// Lokasi Code & Contoh: splash_screen.dart:49-52 (Image.asset('assets/images/cashier_logo.png'))
              /// ==============================================================
              child: Image.asset(
                'assets/images/cashier_logo.png',
                width: 80,
                height: 80,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.point_of_sale_rounded,
                  size: 80,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Aplikasi Kasir POS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Solusi Transaksi Kasir Warung Mas Rusdi',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.85),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 40),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
