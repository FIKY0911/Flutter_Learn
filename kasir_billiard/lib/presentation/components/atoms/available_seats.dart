import 'package:flutter/material.dart';
import 'package:kasir_billiard/data/models/biliard_seat_model.dart';

class AvailableSeats extends StatelessWidget{
  final String seatsText;
  final SeatStatus seatStatus;

  const AvailableSeats({
    super.key,
    required this.seatsText,
    required this.seatStatus,
  });

  @override
  Widget build(BuildContext context) {
    if(seatStatus == SeatStatus.empty){
     return const SizedBox.shrink();
    }

    final bool isLow = seatStatus == SeatStatus.low;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: isLow ? Colors.red : Colors.green,
        borderRadius: BorderRadius.circular(4),
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
            const SizedBox(width: 6),
          ],
          Text(
            seatsText,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            )
          )
        ]
      )
    );
  }
}