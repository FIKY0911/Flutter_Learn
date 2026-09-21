import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';

class NoteInputBox extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const NoteInputBox({
    super.key,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.edit_note_rounded,
                  size: 20,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 6),
                Text(
                  AppStrings.orderNoteTitle,
                  style: AppTypography.titleMedium.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Text(
              AppStrings.optional,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.textMuted,
                fontSize: 11,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          AppStrings.orderNoteSubtitle,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textMuted,
            fontSize: 11.5,
          ),
        ),
        const SizedBox(height: 10),
        // Input text container
        Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceContainerLow,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.outline.withValues(alpha: 0.35), width: 1),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            maxLines: 3,
            minLines: 2,
            style: AppTypography.bodyMedium,
            decoration: const InputDecoration(
              isDense: true,
              hintText: AppStrings.orderNoteHint,
              hintStyle: TextStyle(
                fontFamily: AppTypography.fontFamily,
                color: AppColors.textLight,
                fontSize: 12,
                height: 1.4,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
