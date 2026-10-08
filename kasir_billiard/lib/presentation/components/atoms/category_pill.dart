import 'package:flutter/material.dart';

class CategoryPill extends StatelessWidget{
  final String title;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryPill({
    super.key,
    required this.title,
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // 1. Definisikan palet warna dinamis agar kode tetap bersih (clean code)
    final Color backgorundColor = isSelected ? Colors.indigo : Colors.white;
    final Color contentColor = isSelected ? Colors.white : Colors.black87;
    final Color badgeBackgroundColor = isSelected ? Colors.white.withValues(alpha: 0.25) : Colors.grey.shade100;
    final Color borderColor = isSelected ? Colors.indigo : Colors.grey.shade300;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(4),
        onTap: onTap,
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
              color: backgorundColor,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: borderColor, width: 1.2)
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: contentColor,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: badgeBackgroundColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    '$count',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: contentColor,
                    ),
                  ),
                )
              ],
            ),
        ),
      )
    );
  }
}

