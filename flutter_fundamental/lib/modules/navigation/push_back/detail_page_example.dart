import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class DetailPageExample extends StatelessWidget {
  final String passedMessage;

  const DetailPageExample({
    super.key,
    required this.passedMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Detail (Pushed)'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer.withValues(alpha: 0.5),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryContainer),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Data Diterima dari Halaman Sebelumnya:',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColors.onPrimaryContainer),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    passedMessage,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Aksi Navigasi Kembali (Pop):',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                // Back with data
                Navigator.pop(context, 'Data Konfirmasi: DISETUJUI ✅');
              },
              icon: const Icon(Icons.check_circle_rounded),
              label: const Text('Kembali dengan Hasil "DISETUJUI"'),
              style: ElevatedButton.styleFrom(backgroundColor: AppColors.secondary),
            ),
            const SizedBox(height: 10),
            OutlinedButton.icon(
              onPressed: () {
                // Back with cancelled data
                Navigator.pop(context, 'Data Konfirmasi: DIBATALKAN ❌');
              },
              icon: const Icon(Icons.cancel_rounded),
              label: const Text('Kembali dengan Hasil "DIBATALKAN"'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // standard back
              },
              child: const Text('Kembali Tanpa Data (Standard Pop)'),
            ),
          ],
        ),
      ),
    );
  }
}
