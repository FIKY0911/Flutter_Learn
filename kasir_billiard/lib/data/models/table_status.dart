import 'package:flutter/material.dart'

enum TableStatus {
  available(
    label: 'Tersedia',
    backgroundColor: Colors.green,
    foregroundColor: Colors.white,
  ),
  occupied(
    label: 'Kurang',
    backgroundColor: Colors.orange,
    foregroundColor: Colors.white,
  ),
  maintenance(
    label: 'Perawatan',
    backgroundColor: Colors.grey,
    foregroundColor: Colors.white,
  );

  final String label;
  final Color backgroundColor;
  final Color foregroundColor;

  const SeatStatus({
    required this.label,
    required this.backgroundColor,
    required this.foregroundColor,
  });
}
}