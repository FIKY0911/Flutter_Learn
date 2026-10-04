import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_typography.dart';

class WarungAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProfileTap;

  const WarungAppBar({
    super.key,
    this.onProfileTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Logo / Brand Icon
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.outline.withValues(alpha: 0.5), width: 1),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.04),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ],
              ),
              child: const Center(
                child: Icon(
                  Icons.restaurant_menu_rounded,
                  color: AppColors.primary,
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Brand Title & Tagline
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppStrings.appName,
                    style: AppTypography.titleLarge.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: AppColors.onSurface,
                    ),
                  ),
                  Text(
                    AppStrings.appTagline,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.primaryLight,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
            // Profile Icon
            Material(
              color: AppColors.primaryLight,
              shape: const CircleBorder(),
              child: InkWell(
                onTap: onProfileTap,
                customBorder: const CircleBorder(),
                child: const SizedBox(
                  width: 38,
                  height: 38,
                  child: Icon(
                    Icons.person_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
