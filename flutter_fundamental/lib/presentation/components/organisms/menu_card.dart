import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../data/models/menu_model.dart';
import '../atoms/app_badge.dart';
import '../atoms/app_network_image.dart';
import '../molecules/price_tag.dart';
import '../molecules/rating_badge.dart';

class MenuCard extends StatelessWidget {
  final MenuModel item;
  final VoidCallback onTap;

  const MenuCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // ==========================================
    // 5. CARD: Container dengan Border, Radius, dan Shadow
    // ==========================================
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.35), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6E3C0A).withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        // ==========================================
        // 3. BUTTON: InkWell membuat seluruh card dapat ditekan (Clickable)
        // ==========================================
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Section: Image + Info
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ==========================================
                    // 2. IMAGE: Menampilkan gambar menu dari URL / Fallback Icon
                    // ==========================================
                    Stack(
                      children: [
                        AppNetworkImage(
                          imageUrl: item.imageUrl,
                          width: 100,
                          height: 100,
                          borderRadius: 12,
                          fallbackIcon: item.icon,
                        ),
                        Positioned(
                          top: 6,
                          left: 6,
                          child: AppBadge(
                            // 1. TEXT / LABEL: Badge Kategori di atas gambar
                            text: 'Kategori:\n${item.category}',
                            variant: BadgeVariant.tag,
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 12),
                    // Item Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Badges Row (Bestseller & Tersedia)
                          Wrap(
                            spacing: 6,
                            runSpacing: 4,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              if (item.badgeText != null)
                                AppBadge(
                                  text: item.badgeText!,
                                  icon: Icons.local_fire_department_rounded,
                                  variant: BadgeVariant.primary,
                                ),
                              if (item.isAvailable)
                                const AppBadge(
                                  text: AppStrings.availableStatus,
                                  icon: Icons.check_circle_outline_rounded,
                                  variant: BadgeVariant.success,
                                ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          // ==========================================
                          // 1. TEXT / LABEL: Judul / Nama Menu
                          // ==========================================
                          Text(
                            item.name,
                            style: AppTypography.titleLarge.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: AppColors.onSurface,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          // Rating & Reviews
                          RatingBadge(
                            rating: item.rating,
                            reviewCount: item.reviewCount,
                          ),
                          const SizedBox(height: 4),
                          // ==========================================
                          // 1. TEXT / LABEL: Deskripsi Singkat Menu
                          // ==========================================
                          Text(
                            item.description,
                            style: AppTypography.bodySmall.copyWith(
                              color: AppColors.onSurfaceVariant,
                              fontSize: 11,
                              height: 1.35,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Divider(height: 1, thickness: 0.8),
                const SizedBox(height: 10),
                // Bottom Row: Price & Detail Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 1. TEXT & 5. CARD: Label Harga
                    PriceTag(
                      price: item.price,
                      variant: PriceTagVariant.card,
                    ),
                    // ==========================================
                    // 3. BUTTON: Tombol Elevated Button untuk melihat Detail
                    // ==========================================
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        visualDensity: VisualDensity.compact,
                      ),
                      onPressed: onTap,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          // 1. TEXT / LABEL: Teks pada tombol
                          Text(
                            AppStrings.btnDetail,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              fontFamily: AppTypography.fontFamily,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.chevron_right_rounded, size: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
