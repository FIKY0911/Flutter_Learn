import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class TabNavScreen extends StatelessWidget {
  const TabNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tab Navigation Demo'),
          bottom: const TabBar(
            indicatorColor: Colors.white,
            indicatorWeight: 3,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(icon: Icon(Icons.fastfood_rounded), text: 'Makanan'),
              Tab(icon: Icon(Icons.local_cafe_rounded), text: 'Minuman'),
              Tab(icon: Icon(Icons.icecream_rounded), text: 'Dessert'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            _TabItemView(
              category: 'Makanan Utama',
              description: 'Daftar menu makanan berat: Nasi Goreng, Ayam Bakar, Mie Goreng.',
              icon: Icons.fastfood_rounded,
              color: AppColors.primary,
            ),
            _TabItemView(
              category: 'Minuman Segar',
              description: 'Daftar aneka minuman: Es Teh Manis, Jus Alpukat, Kopi Susu.',
              icon: Icons.local_cafe_rounded,
              color: AppColors.secondary,
            ),
            _TabItemView(
              category: 'Dessert & Camilan',
              description: 'Daftar camilan penutup: Pisang Goreng Keju, Roti Bakar.',
              icon: Icons.icecream_rounded,
              color: Colors.deepOrange,
            ),
          ],
        ),
      ),
    );
  }
}

class _TabItemView extends StatelessWidget {
  final String category;
  final String description;
  final IconData icon;
  final Color color;

  const _TabItemView({
    required this.category,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: color.withValues(alpha: 0.15),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 16),
            Text(category, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(description, textAlign: TextAlign.center, style: const TextStyle(color: AppColors.textMuted)),
          ],
        ),
      ),
    );
  }
}
