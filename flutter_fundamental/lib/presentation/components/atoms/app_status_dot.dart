import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class AppStatusDot extends StatelessWidget {
  final Color color;
  final double size;

  const AppStatusDot({
    super.key,
    this.color = AppColors.secondary,
    this.size = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
