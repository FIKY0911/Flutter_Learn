import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';
import '../../../data/models/menu_model.dart';
import '../atoms/app_network_image.dart';

class DetailHeroBanner extends StatelessWidget {
  final MenuModel item;

  const DetailHeroBanner({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.4), width: 1),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          // Sub-header text on top of image
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 4),
            child: Text(
              'Detail Menu - ${item.name}',
              style: AppTypography.labelSmall.copyWith(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ),
          // Food Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AppNetworkImage(
              imageUrl: item.imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              fallbackIcon: item.icon,
            ),
          ),
        ],
      ),
    );
  }
}
