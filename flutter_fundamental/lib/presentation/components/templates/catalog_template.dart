import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CatalogTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget searchBar;
  final Widget promoBanner;
  final Widget categorySelector;
  final Widget sectionHeader;
  final Widget menuList;
  final Widget? footerNote;
  final Widget bottomNavBar;

  const CatalogTemplate({
    super.key,
    required this.appBar,
    required this.searchBar,
    required this.promoBanner,
    required this.categorySelector,
    required this.sectionHeader,
    required this.menuList,
    this.footerNote,
    required this.bottomNavBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: appBar,
      bottomNavigationBar: bottomNavBar,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              children: [
                searchBar,
                const SizedBox(height: 14),
                promoBanner,
                const SizedBox(height: 16),
                categorySelector,
                const SizedBox(height: 20),
                sectionHeader,
                const SizedBox(height: 14),
                menuList,
                if (footerNote != null) ...[
                  const SizedBox(height: 20),
                  footerNote!,
                  const SizedBox(height: 16),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
