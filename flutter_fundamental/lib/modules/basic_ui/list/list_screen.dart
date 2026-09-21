import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sampleItems = List.generate(6, (index) => 'Item Menu #${index + 1}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('List & ListTile Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. ListTile Anatomy
          DemoSectionCard(
            title: '1. ListTile Standard Anatomy',
            subtitle: 'Struktur standar ListTile dengan leading, title, subtitle, dan trailing icon.',
            codeSnippet: 'ListTile(leading: Icon(...), title: Text(...), trailing: Icon(...))',
            child: Column(
              children: [
                ListTile(
                  tileColor: AppColors.surfaceContainerLow,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  leading: const CircleAvatar(
                    backgroundColor: AppColors.primaryContainer,
                    child: Icon(Icons.fastfood_rounded, color: AppColors.primary),
                  ),
                  title: const Text('Ayam Bakar Madu', style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: const Text('Porsi komplit + sambal lalapan'),
                  trailing: const Text('Rp 25.000', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.primary)),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Ayam Bakar Madu dipilih')),
                    );
                  },
                ),
              ],
            ),
          ),

          // 2. Horizontal ListView
          DemoSectionCard(
            title: '2. Horizontal ListView (Chips / Cards)',
            subtitle: 'Daftar item yang dapat digeser secara horizontal (scrollDirection: Axis.horizontal).',
            codeSnippet: 'ListView.builder(scrollDirection: Axis.horizontal, ...)',
            child: SizedBox(
              height: 48,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                separatorBuilder: (context, index) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return Chip(
                    backgroundColor: index == 0 ? AppColors.primary : AppColors.surfaceContainer,
                    label: Text(
                      'Kategori ${index + 1}',
                      style: TextStyle(
                        color: index == 0 ? Colors.white : AppColors.onSurface,
                        fontWeight: index == 0 ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // 3. ListView.separated (Vertical)
          DemoSectionCard(
            title: '3. ListView.separated (Vertical List)',
            subtitle: 'Merender list dinamis dengan divider otomatis di antara setiap elemen.',
            codeSnippet: 'ListView.separated(separatorBuilder: (_, __) => Divider(), ...)',
            child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sampleItems.length,
              separatorBuilder: (context, index) => const Divider(height: 1, color: AppColors.divider),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 16,
                    backgroundColor: AppColors.secondaryContainer,
                    child: Text('${index + 1}', style: const TextStyle(fontSize: 12, color: AppColors.secondary, fontWeight: FontWeight.bold)),
                  ),
                  title: Text(sampleItems[index]),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppColors.textLight),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
