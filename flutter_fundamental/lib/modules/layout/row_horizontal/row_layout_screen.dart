import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class RowLayoutScreen extends StatefulWidget {
  const RowLayoutScreen({super.key});

  @override
  State<RowLayoutScreen> createState() => _RowLayoutScreenState();
}

class _RowLayoutScreenState extends State<RowLayoutScreen> {
  MainAxisAlignment _mainAlign = MainAxisAlignment.spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row / Horizontal Layout'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Row MainAxisAlignment Playground
          DemoSectionCard(
            title: '1. Row Alignment Playground',
            subtitle: 'Menyusun widget berdampingan secara horizontal dari kiri ke kanan.',
            codeSnippet: 'Row(mainAxisAlignment: $_mainAlign)',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildAlignChip(MainAxisAlignment.start, 'start'),
                      _buildAlignChip(MainAxisAlignment.center, 'center'),
                      _buildAlignChip(MainAxisAlignment.end, 'end'),
                      _buildAlignChip(MainAxisAlignment.spaceBetween, 'spaceBetween'),
                      _buildAlignChip(MainAxisAlignment.spaceAround, 'spaceAround'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  height: 80,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.outline),
                  ),
                  child: Row(
                    mainAxisAlignment: _mainAlign,
                    children: [
                      _buildSquare('1', AppColors.primary),
                      _buildSquare('2', AppColors.secondary),
                      _buildSquare('3', AppColors.starRating),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. Expanded vs Flexible in Row
          DemoSectionCard(
            title: '2. Expanded vs Flexible (Flex Ratio)',
            subtitle: 'Expanded memaksa widget memenuhi porsi rasio (flex: 2 vs flex: 1) untuk mencegah pixel overflow.',
            codeSnippet: 'Row(children: [Expanded(flex: 2, ...), Expanded(flex: 1, ...)])',
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.primaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Expanded (Flex 2)', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.secondaryContainer,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text('Flex 1', textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // Typical Real Case (Icon + Expanded Text + Button)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.outline),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on_rounded, color: AppColors.primary),
                      const SizedBox(width: 8),
                      const Expanded(
                        child: Text(
                          'Jl. Sudirman No. 45, Jakarta Selatan (Alamat Pengiriman)',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: () {},
                        child: const Text('Ubah'),
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

  Widget _buildAlignChip(MainAxisAlignment align, String name) {
    final isSelected = _mainAlign == align;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: ChoiceChip(
        label: Text(name, style: const TextStyle(fontSize: 11)),
        selected: isSelected,
        onSelected: (val) {
          if (val) setState(() => _mainAlign = align);
        },
      ),
    );
  }

  Widget _buildSquare(String text, Color color) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(text, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
