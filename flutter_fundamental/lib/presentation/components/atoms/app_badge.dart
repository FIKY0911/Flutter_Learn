import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_typography.dart';

enum BadgeVariant {
  primary,
  success,
  secondary,
  tag,
  dark,
}

class AppBadge extends StatelessWidget {
  final String text;
  final IconData? icon;
  final BadgeVariant variant;
  final EdgeInsetsGeometry padding;

  const AppBadge({
    super.key,
    required this.text,
    this.icon,
    this.variant = BadgeVariant.primary,
    this.padding = const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
  });

  @override
  Widget build(BuildContext context) {
    Color bgColor;
    Color textColor;
    Color? borderColor;

    switch (variant) {
      case BadgeVariant.primary:
        bgColor = AppColors.primary;
        textColor = Colors.white;
        break;
      case BadgeVariant.success:
        bgColor = AppColors.secondaryContainer;
        textColor = AppColors.secondary;
        borderColor = AppColors.secondaryLight.withValues(alpha: 0.3);
        break;
      case BadgeVariant.secondary:
        bgColor = AppColors.secondary;
        textColor = Colors.white;
        break;
      case BadgeVariant.tag:
        bgColor = AppColors.primaryLight.withValues(alpha: 0.9);
        textColor = Colors.white;
        break;
      case BadgeVariant.dark:
        bgColor = Colors.black.withValues(alpha: 0.65);
        textColor = Colors.white;
        break;
    }

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(6),
        border: borderColor != null ? Border.all(color: borderColor, width: 0.8) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 12, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            text,
            style: AppTypography.labelSmall.copyWith(
              color: textColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
