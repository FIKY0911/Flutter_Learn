import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class ButtonScreen extends StatefulWidget {
  const ButtonScreen({super.key});

  @override
  State<ButtonScreen> createState() => _ButtonScreenState();
}

class _ButtonScreenState extends State<ButtonScreen> {
  int _counter = 0;
  String _lastClicked = 'Belum ada tombol ditekan';

  void _onButtonPressed(String name) {
    setState(() {
      _counter++;
      _lastClicked = '$name (Klik ke-$_counter)';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Button Widget'),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _onButtonPressed('Floating Action Button'),
        icon: const Icon(Icons.add),
        label: const Text('FAB Extended'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Status Box
          Container(
            padding: const EdgeInsets.all(14),
            margin: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.primaryContainer),
            ),
            child: Row(
              children: [
                const Icon(Icons.touch_app_rounded, color: AppColors.primary),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Status: $_lastClicked',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.onPrimaryContainer,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 1. Primary Buttons
          DemoSectionCard(
            title: '1. ElevatedButton & FilledButton',
            subtitle: 'Tombol utama untuk aksi prioritas tinggi (call-to-action).',
            codeSnippet: 'ElevatedButton(onPressed: () {}, child: Text("Simpan"))',
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ElevatedButton(
                  onPressed: () => _onButtonPressed('ElevatedButton Standar'),
                  child: const Text('ElevatedButton'),
                ),
                ElevatedButton.icon(
                  onPressed: () => _onButtonPressed('ElevatedButton Icon'),
                  icon: const Icon(Icons.shopping_bag_outlined),
                  label: const Text('Pesan Sekarang'),
                ),
                FilledButton(
                  onPressed: () => _onButtonPressed('FilledButton (M3)'),
                  style: FilledButton.styleFrom(backgroundColor: AppColors.secondary),
                  child: const Text('FilledButton'),
                ),
              ],
            ),
          ),

          // 2. Secondary & Outline Buttons
          DemoSectionCard(
            title: '2. OutlinedButton & TextButton',
            subtitle: 'Tombol sekunder bergaris tepi atau teks polos tanpa background.',
            codeSnippet: 'OutlinedButton(onPressed: () {}, child: Text("Batal"))',
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                OutlinedButton(
                  onPressed: () => _onButtonPressed('OutlinedButton'),
                  child: const Text('OutlinedButton'),
                ),
                OutlinedButton.icon(
                  onPressed: () => _onButtonPressed('OutlinedButton Icon'),
                  icon: const Icon(Icons.bookmark_border_rounded),
                  label: const Text('Simpan Draft'),
                ),
                TextButton(
                  onPressed: () => _onButtonPressed('TextButton'),
                  child: const Text('TextButton Link'),
                ),
              ],
            ),
          ),

          // 3. Icon Buttons
          DemoSectionCard(
            title: '3. IconButton & Custom Styled Buttons',
            subtitle: 'Tombol ringkas hanya berupa ikon dengan styling background opsional.',
            codeSnippet: 'IconButton(icon: Icon(Icons.favorite), onPressed: () {})',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => _onButtonPressed('IconButton Suka'),
                  icon: const Icon(Icons.favorite_rounded, color: AppColors.error),
                ),
                IconButton.filled(
                  onPressed: () => _onButtonPressed('IconButton Filled'),
                  icon: const Icon(Icons.share_rounded),
                  style: IconButton.styleFrom(
                    backgroundColor: AppColors.primaryContainer,
                    foregroundColor: AppColors.primary,
                  ),
                ),
                IconButton.outlined(
                  onPressed: () => _onButtonPressed('IconButton Outlined'),
                  icon: const Icon(Icons.refresh_rounded),
                ),
              ],
            ),
          ),
          const SizedBox(height: 60), // Spacing for FAB
        ],
      ),
    );
  }
}
