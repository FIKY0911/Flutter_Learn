import 'package:flutter/material.dart';
import 'package:omni_pos/core/constants/app_colors.dart';

class StatusChip extends StatelessWidget{
  final String label;

  const StatusChip({
    super.key,
    this.label = '100% Offline Ready',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.stockGreenBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 3,
            backgroundColor: AppColors.stockGreenText,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.stockGreenText,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      )
    );
  }
}