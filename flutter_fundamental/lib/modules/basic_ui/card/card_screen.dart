import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../common/demo_section_card.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card & Container Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Basic Card with Elevation
          DemoSectionCard(
            title: '1. Standard Card with Elevation',
            subtitle: 'Card dasar dengan bayangan (elevation) dan border radius melengkung.',
            codeSnippet: 'Card(elevation: 4, shape: RoundedRectangleBorder(...))',
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.receipt_long_rounded, color: AppColors.primary),
                        const SizedBox(width: 8),
                        Text('Pesanan #WR-1024', style: AppTypography.titleMedium),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text('1x Nasi Goreng Spesial, 1x Es Teh Manis'),
                    const SizedBox(height: 12),
                    Text(
                      'Total: Rp 32.000',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // 2. Outlined Card & Custom Border
          DemoSectionCard(
            title: '2. Outlined Card & Gradient Container',
            subtitle: 'Card dengan garis tepi tanpa elevasi dan Container bergradasi modern.',
            codeSnippet: 'BoxDecoration(gradient: LinearGradient(...))',
            child: Column(
              children: [
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.outline),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.info_outline_rounded, color: AppColors.secondary),
                    title: Text('Info Promo Diskon 30%'),
                    subtitle: Text('Gunakan kode KUPONHEMAT pada checkout.'),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [AppColors.primary, AppColors.primaryDark],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.stars_rounded, color: Colors.amber, size: 36),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Member Platinum',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'Dapatkan poin cashback 2x lipat',
                              style: TextStyle(color: Colors.white.withValues(alpha: 0.9), fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
