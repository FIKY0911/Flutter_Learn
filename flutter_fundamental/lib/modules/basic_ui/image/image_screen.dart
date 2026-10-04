import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../common/demo_section_card.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const sampleImageUrl = 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?w=600&q=80';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image & Media Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // 1. Network Image with Loading & Error Builder
          DemoSectionCard(
            title: '1. Image.network',
            subtitle: 'Menampilkan gambar dari internet lengkap dengan loading indicator dan error fallback.',
            codeSnippet: 'Image.network(url, fit: BoxFit.cover)',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: Image.network(
                  sampleImageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    if (progress == null) return child;
                    return Container(
                      color: AppColors.surfaceContainer,
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: AppColors.errorContainer,
                      child: const Center(
                        child: Icon(Icons.broken_image_rounded, color: AppColors.error, size: 40),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // 2. Circular Avatar
          DemoSectionCard(
            title: '2. CircleAvatar & ClipOval',
            subtitle: 'Cocok digunakan untuk avatar pengguna atau icon berbentuk lingkaran.',
            codeSnippet: 'CircleAvatar(radius: 36, backgroundImage: NetworkImage(url))',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: NetworkImage(sampleImageUrl),
                ),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.primaryContainer,
                  child: const Icon(Icons.person_rounded, size: 36, color: AppColors.primary),
                ),
                CircleAvatar(
                  radius: 32,
                  backgroundColor: AppColors.secondaryContainer,
                  child: const Text('MR', style: TextStyle(color: AppColors.secondary, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ],
            ),
          ),

          // 3. BoxFit Comparison
          DemoSectionCard(
            title: '3. BoxFit Property (Cover, Contain, Fill)',
            subtitle: 'Mengontrol bagaimana gambar disesuaikan dengan dimensi wadahnya.',
            codeSnippet: 'BoxFit.cover | BoxFit.contain | BoxFit.fitWidth',
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.outline),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(sampleImageUrl, fit: BoxFit.cover),
                      ),
                      const SizedBox(height: 4),
                      const Text('BoxFit.cover', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.outline),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(sampleImageUrl, fit: BoxFit.contain),
                      ),
                      const SizedBox(height: 4),
                      const Text('BoxFit.contain', style: TextStyle(fontSize: 11)),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.outline),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Image.network(sampleImageUrl, fit: BoxFit.fill),
                      ),
                      const SizedBox(height: 4),
                      const Text('BoxFit.fill', style: TextStyle(fontSize: 11)),
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
