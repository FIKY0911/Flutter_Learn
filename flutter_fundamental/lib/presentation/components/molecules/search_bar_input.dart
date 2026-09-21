import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';

class SearchBarInput extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final String hintText;

  const SearchBarInput({
    super.key,
    this.controller,
    this.onChanged,
    this.onClear,
    this.hintText = AppStrings.searchHint,
  });

  @override
  Widget build(BuildContext context) {
    // ==========================================
    // 5. CARD: Wadah input search bar dengan rounded border & shadow
    // ==========================================
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: AppColors.outline.withValues(alpha: 0.4), width: 1),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6E3C0A).withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // ==========================================
      // 4. TEXT FIELD / INPUT: Widget TextField untuk mengetik input teks pencarian
      // ==========================================
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTypography.bodyLarge,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          isDense: true,
          // 1. TEXT / LABEL: Placeholder / Hint Text
          hintText: hintText,
          hintStyle: AppTypography.bodyMedium.copyWith(color: AppColors.textMuted),
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: AppColors.onSurfaceVariant,
            size: 22,
          ),
          // 3. BUTTON: Tombol Icon X untuk menghapus isi teks input
          suffixIcon: (controller != null && controller!.text.isNotEmpty)
              ? IconButton(
                  icon: const Icon(Icons.clear_rounded, size: 18, color: AppColors.textMuted),
                  onPressed: () {
                    controller!.clear();
                    onClear?.call();
                    onChanged?.call('');
                  },
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
