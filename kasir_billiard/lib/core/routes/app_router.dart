import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


// typedef CasirScreen = HomePage;

// Definisi nama dan path rute untuk konsistensi di seluruh aplikasi
class AppRouter {
  // Loading screen after open app
  static const String splash = '/splash';
  static const String splashName = 'splash';

  // home
  static const String home = '/';
  static const String homeHame = 'home';

  // kasir
  static const String kasir = '/kasir';
  static const String kasirName = 'kasir';

  // Member VIP
  static const String memberVIP = '/member-vip';
  static const String memberVIPName = 'member-vip';

  // Laporan
  static const String laporan = '/laporan';
  static const String laporanName = 'laporan';

  // Setting
  static const String setting = '/setting';
  static const String settingName = 'setting';
}

// final GoRouter appRouter = GoRouter(
//   initialLocation: AppRoutes.splash,
//     routes: [
//       // Rute Splash Screen
//       GoRoute(
//           path: AppRoutes.splash,
//           name: AppRoutes.splashName,
//           builder: (BuilderContext context, GoRouterState state){
//               return const SplashScreen();
//           },
//       ),
//
//     ]
// );