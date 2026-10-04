import 'package:flutter/material.dart';
import 'package:omni_pos/core/constants/app_colors.dart';
import 'package:omni_pos/data/models/product_model.dart';

class StockBadge extends StatelessWidget{
  final String stockText;
  final StockStatus stockStatus;

  const StockBadge({
    super.key,
    required this.stockText,
    required this.stockStatus,
  });

  @override
  Widget build(BuildContext context) {
    if(stockStatus == StockStatus.empty){
      return const SizedBox.shrink();
    }

    final bool isLow = stockStatus == StockStatus.low;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isLow ? AppColors.primaryLight : AppColors.stockGreen,
        borderRadius: BorderRadius.circular(12),
        border: isLow ? Border.all(color: Colors.orange.shade200) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if(!isLow)...[
            const CircleAvatar(
              radius: 3,
              backgroundColor: Colors.white,
            ),
            const SizedBox(width: 4),
          ],
          Text(
            stockText,
            style: TextStyle(
              color: isLow ? AppColors.stockLow : Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      )
    );
  }
}