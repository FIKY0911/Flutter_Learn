import 'package:flutter/material.dart';
import 'package:kasir_billiard/data/models/table_status.dart';

class StatusChip extends StatelessWidget{
  final TableStatus status;

  const StatusChip({
      super.key,
      required this.status,
  })

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.backgroundColor,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: status.foregroundColor.withValues(alpha: 0.2),
          width: 1.2,
        )
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Indikator titik status
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: status.foregroundColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6),
          // label teks status
          Text(
            status.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: status.foregroundColor,
              letterSpacing: 1.2,
            ),
          )
        ]
          ,
      ),
    );
  }
}