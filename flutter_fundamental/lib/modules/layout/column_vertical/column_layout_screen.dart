import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class ColumnLayoutScreen extends StatefulWidget {
  const ColumnLayoutScreen({super.key});

  @override
  State<ColumnLayoutScreen> createState() => _ColumnLayoutScreenState();
}

class _ColumnLayoutScreenState extends State<ColumnLayoutScreen> {
  MainAxisAlignment _mainAlign = MainAxisAlignment.start;
  CrossAxisAlignment _crossAlign = CrossAxisAlignment.center;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column / Vertical Layout'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Interactive Column Alignment Playground
          DemoSectionCard(
            title: '1. Column Alignment Playground',
            subtitle: 'Mengatur susunan vertikal anak widget dengan MainAxisAlignment dan CrossAxisAlignment.',
            codeSnippet: 'Column(mainAxisAlignment: $_mainAlign, crossAxisAlignment: $_crossAlign)',
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Controls
                const Text('MainAxisAlignment (Vertikal):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildMainAlignChip(MainAxisAlignment.start, 'start'),
                      _buildMainAlignChip(MainAxisAlignment.center, 'center'),
                      _buildMainAlignChip(MainAxisAlignment.end, 'end'),
                      _buildMainAlignChip(MainAxisAlignment.spaceBetween, 'spaceBetween'),
                      _buildMainAlignChip(MainAxisAlignment.spaceEvenly, 'spaceEvenly'),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                const Text('CrossAxisAlignment (Horizontal):', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildCrossAlignChip(CrossAxisAlignment.start, 'start'),
                      _buildCrossAlignChip(CrossAxisAlignment.center, 'center'),
                      _buildCrossAlignChip(CrossAxisAlignment.end, 'end'),
                      _buildCrossAlignChip(CrossAxisAlignment.stretch, 'stretch'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                // Live Box Preview
                Container(
                  height: 220,
                  width: double.infinity,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerLow,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.outline),
                  ),
                  child: Column(
                    mainAxisAlignment: _mainAlign,
                    crossAxisAlignment: _crossAlign,
                    children: [
                      _buildBox('Item 1 (Panjang Teks)', AppColors.primary),
                      _buildBox('Item 2', AppColors.secondary),
                      _buildBox('Item 3 (Sedang)', AppColors.starRating),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // 2. Expanded & Spacer in Column
          DemoSectionCard(
            title: '2. Expanded & Spacer Widget',
            subtitle: 'Expanded mengisi sisa ruang yang tersedia, sedangkan Spacer memberi celah fleksibel.',
            codeSnippet: 'Column(children: [Text(), Spacer(), ElevatedButton()])',
            child: Container(
              height: 180,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.outline),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    color: AppColors.primaryContainer,
                    child: const Text('Bagian Atas (Header)', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(6),
                    color: Colors.white,
                    child: const Text('Spacer() mendorong elemen bawah ke dasar'),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Tombol di Bagian Bawah'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainAlignChip(MainAxisAlignment align, String name) {
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

  Widget _buildCrossAlignChip(CrossAxisAlignment align, String name) {
    final isSelected = _crossAlign == align;
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: ChoiceChip(
        label: Text(name, style: const TextStyle(fontSize: 11)),
        selected: isSelected,
        onSelected: (val) {
          if (val) setState(() => _crossAlign = align);
        },
      ),
    );
  }

  Widget _buildBox(String text, Color color) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
      ),
    );
  }
}
