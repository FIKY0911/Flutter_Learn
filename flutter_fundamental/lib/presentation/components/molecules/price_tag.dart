import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';
import '../../../core/utils/currency_formatter.dart';

enum PriceTagVariant { card, detail }

class PriceTag extends StatelessWidget {
  final int price;
  final int? originalPrice;
  final PriceTagVariant variant;

  const PriceTag({
    super.key,
    required this.price,
    this.originalPrice,
    this.variant = PriceTagVariant.card,
  });

  @override
  Widget build(BuildContext context) {
    final String formattedPrice = CurrencyFormatter.formatRupiah(price);

    if (variant == PriceTagVariant.card) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            AppStrings.unitPrice,
            style: AppTypography.bodySmall.copyWith(
              color: AppColors.textMuted,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 1),
          Text(
            formattedPrice,
            style: AppTypography.priceMedium.copyWith(
              color: AppColors.secondary,
              fontSize: 16,
            ),
          ),
        ],
      );
    }

    // Detail Screen Variant
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          formattedPrice,
          style: AppTypography.displayLarge.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
            fontSize: 26,
          ),
        ),
        if (originalPrice != null && originalPrice! > price) ...[
          const SizedBox(width: 10),
          Text(
            CurrencyFormatter.formatRupiah(originalPrice!),
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textLight,
              decoration: TextDecoration.lineThrough,
              fontSize: 14,
            ),
          ),
        ],
      ],
    );
  }
}
