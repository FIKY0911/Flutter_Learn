import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AppIconBox extends StatelessWidget {
  final IconData icon;
  final double size;
  final double iconSize;
  final Color? backgroundColor;
  final Color? iconColor;
  final double borderRadius;

  const AppIconBox({
    super.key,
    required this.icon,
    this.size = 40,
    this.iconSize = 20,
    this.backgroundColor,
    this.iconColor,
    this.borderRadius = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primaryContainer.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Center(
        child: Icon(
          icon,
          size: iconSize,
          color: iconColor ?? AppColors.primary,
        ),
      ),
    );
  }
}
