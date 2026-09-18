import 'package:flutter/material.dart';
import 'package:omni_pos/core/constants/app_colors.dart';

class QtyCounter extends StatelessWidget {
  final int quantity;
  final bool isOutOfStock;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const QtyCounter({
    super.key,
    required this.quantity,
    required this.isOutOfStock,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutOfStock) {
      return Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(Icons.block, size: 14, color: Colors.grey.shade400),
      );
    }

    if (quantity >= 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: onRemove,
              child: Icon(Icons.remove, size: 14, color: Colors.grey.shade700),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '$quantity',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
              ),
            ),
            InkWell(
              onTap: onAdd,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, size: 12, color: Colors.white),
              ),
            ),
          ],
        ),
      );
    }

    return InkWell(
      onTap: onAdd,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: const BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 16),
      ),
    );
  }
}