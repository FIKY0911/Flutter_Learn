import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class ScrollableLayoutScreen extends StatelessWidget {
  const ScrollableLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scrollable Layout'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. SingleChildScrollView Concept
          DemoSectionCard(
            title: '1. SingleChildScrollView',
            subtitle: 'Mencegah Bottom Overflow Error ketika konten melebihi tinggi layar atau ketika keyboard muncul.',
            codeSnippet: 'SingleChildScrollView(child: Column(...))',
            child: Container(
              height: 140,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.outline),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    8,
                    (index) => Container(
                      margin: const EdgeInsets.only(bottom: 6),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_downward_rounded, size: 16, color: AppColors.primary),
                          const SizedBox(width: 8),
                          Text('Baris Scrollable Item #${index + 1}'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // 2. CustomScrollView & Slivers
          DemoSectionCard(
            title: '2. CustomScrollView & Slivers Concept',
            subtitle: 'Scrollable fleksibel tingkat lanjut yang menggabungkan AppBar yang dapat mengecil (collapsible) dan list/grid.',
            codeSnippet: 'CustomScrollView(slivers: [SliverAppBar(), SliverList()])',
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.outline),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CustomScrollView(
                  slivers: [
                    const SliverAppBar(
                      pinned: true,
                      expandedHeight: 80.0,
                      backgroundColor: AppColors.primary,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text('Sliver Header', style: TextStyle(fontSize: 14)),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: Text('Sliver Item $index'),
                          dense: true,
                        ),
                        childCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
