import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class GridLayoutScreen extends StatelessWidget {
  const GridLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final gridItems = [
      {'title': 'Makanan', 'icon': Icons.lunch_dining_rounded, 'color': Colors.orange},
      {'title': 'Minuman', 'icon': Icons.local_cafe_rounded, 'color': Colors.brown},
      {'title': 'Snack', 'icon': Icons.cookie_rounded, 'color': Colors.amber},
      {'title': 'Promo', 'icon': Icons.discount_rounded, 'color': Colors.red},
      {'title': 'Favorit', 'icon': Icons.favorite_rounded, 'color': Colors.pink},
      {'title': 'Terdekat', 'icon': Icons.near_me_rounded, 'color': Colors.teal},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid Layout'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. GridView.count
          DemoSectionCard(
            title: '1. GridView.count (Fixed 3 Kolom)',
            subtitle: 'Layout grid dengan jumlah kolom tetap menggunakan properti crossAxisCount.',
            codeSnippet: 'GridView.count(crossAxisCount: 3, mainAxisSpacing: 10, ...)',
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.9,
              children: gridItems.map((item) {
                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.outline.withValues(alpha: 0.5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: (item['color'] as Color).withValues(alpha: 0.2),
                        child: Icon(item['icon'] as IconData, color: item['color'] as Color, size: 22),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item['title'] as String,
                        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),

          // 2. GridView.builder with Aspect Ratio
          DemoSectionCard(
            title: '2. GridView.builder (2 Kolom Kartu Produk)',
            subtitle: 'GridView yang efisien untuk me-render puluhan/ratusan item secara lazy loading.',
            codeSnippet: 'GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(...))',
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.outline),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Menu #${index + 1}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 4),
                      Text('Rp ${(index + 1) * 15}.000', style: const TextStyle(color: AppColors.primary, fontWeight: FontWeight.w600, fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
