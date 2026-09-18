import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'core/routes/app_router.dart';

void main() {
  runApp(const CampusPosApp());
}

class CampusPosApp extends StatelessWidget {
  const CampusPosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CampusPOS',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.background,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      ),
      // Mendaftarkan konfigurasi go_router
      routerConfig: appRouter,
    );
  }
}