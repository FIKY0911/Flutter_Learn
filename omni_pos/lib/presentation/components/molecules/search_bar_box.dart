import 'package:flutter/material.dart';
import 'package:omni_pos/core/constants/app_colors.dart';

class SearchBarBox extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const SearchBarBox({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.borderLight),
        ),
        child: Row(
          children: [
            const Icon(Icons.search, color: Colors.grey),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                decoration: const InputDecoration(
                  hintText: 'Cari menu, SKU, atau kode...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.mic_none_outlined, size: 20),
              color: AppColors.textMuted,
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.qr_code_scanner, size: 20),
              color: AppColors.primary,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}