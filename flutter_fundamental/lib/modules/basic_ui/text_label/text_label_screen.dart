import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../common/demo_section_card.dart';

class TextLabelScreen extends StatelessWidget {
  const TextLabelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text & Label Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Basic Text
          DemoSectionCard(
            title: '1. Standard Text Widget',
            subtitle: 'Widget dasar untuk menampilkan string teks sederhana pada Flutter.',
            codeSnippet: "Text('Halo Dunia! Belajar Flutter')",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Halo Dunia! Belajar Flutter'),
                const SizedBox(height: 8),
                Text(
                  'Teks dengan ukuran dan warna custom',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          // 2. Typography & Font Weight
          DemoSectionCard(
            title: '2. Typography & Weight',
            subtitle: 'Berbagai macam tingkatan ketebalan teks (FontWeight) dan ukuran font.',
            codeSnippet: "TextStyle(fontWeight: FontWeight.bold, fontSize: 20)",
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Display Large (Bold 24)', style: AppTypography.titleLarge),
                const SizedBox(height: 6),
                Text('Headline Medium (SemiBold 18)', style: AppTypography.titleMedium),
                const SizedBox(height: 6),
                Text('Body Regular (Regular 14)', style: AppTypography.bodyMedium),
                const SizedBox(height: 6),
                Text('Caption / Small text (12)', style: AppTypography.bodySmall),
              ],
            ),
          ),

          // 3. Text Overflow & MaxLines
          DemoSectionCard(
            title: '3. Text Overflow & MaxLines',
            subtitle: 'Menangani teks panjang yang melebihi batas container dengan ellipsis (...)',
            codeSnippet: "Text('...', maxLines: 2, overflow: TextOverflow.ellipsis)",
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerLow,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'Ini adalah contoh paragraf yang sangat panjang sekali yang digunakan untuk menguji properti maxLines dan TextOverflow.ellipsis pada widget Text Flutter agar tidak terjadi layout overflow.',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(height: 1.4),
              ),
            ),
          ),

          // 4. RichText & TextSpan
          DemoSectionCard(
            title: '4. RichText & TextSpan',
            subtitle: 'Menggabungkan beberapa format gaya teks yang berbeda dalam satu kesatuan paragraf.',
            codeSnippet: 'RichText(text: TextSpan(children: [...]))',
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: AppColors.onSurface, fontSize: 14, height: 1.5),
                children: [
                  const TextSpan(text: 'Sudah punya akun? '),
                  TextSpan(
                    text: 'Masuk Sekarang',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const TextSpan(text: ' atau hubungi '),
                  TextSpan(
                    text: 'Customer Support',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const TextSpan(text: ' untuk bantuan.'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
