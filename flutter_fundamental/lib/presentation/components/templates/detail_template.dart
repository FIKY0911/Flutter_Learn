import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class DetailTemplate extends StatelessWidget {
  final PreferredSizeWidget appBar;
  final Widget heroBanner;
  final Widget titleAndPrice;
  final Widget infoStatsRow;
  final Widget descriptionSection;
  final Widget compositionSection;
  final Widget noteInputSection;
  final Widget bottomActionBar;

  const DetailTemplate({
    super.key,
    required this.appBar,
    required this.heroBanner,
    required this.titleAndPrice,
    required this.infoStatsRow,
    required this.descriptionSection,
    required this.compositionSection,
    required this.noteInputSection,
    required this.bottomActionBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: appBar,
      bottomNavigationBar: bottomActionBar,
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  heroBanner,
                  const SizedBox(height: 18),
                  titleAndPrice,
                  const SizedBox(height: 18),
                  infoStatsRow,
                  const SizedBox(height: 20),
                  descriptionSection,
                  const SizedBox(height: 18),
                  compositionSection,
                  const SizedBox(height: 20),
                  noteInputSection,
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
