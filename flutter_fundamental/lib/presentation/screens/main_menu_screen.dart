import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../modules/basic_ui/text_label/text_label_screen.dart';
import '../../modules/basic_ui/image/image_screen.dart';
import '../../modules/basic_ui/button/button_screen.dart';
import '../../modules/basic_ui/text_field_input/text_field_input_screen.dart';
import '../../modules/basic_ui/card/card_screen.dart';
import '../../modules/basic_ui/list/list_screen.dart';
import '../../modules/basic_ui/navigation/basic_navigation_screen.dart';
import '../../modules/layout/column_vertical/column_layout_screen.dart';
import '../../modules/layout/row_horizontal/row_layout_screen.dart';
import '../../modules/layout/stack/stack_layout_screen.dart';
import '../../modules/layout/grid/grid_layout_screen.dart';
import '../../modules/layout/scrollable/scrollable_layout_screen.dart';
import '../../modules/navigation/push_back/push_back_screen.dart';
import '../../modules/navigation/bottom_nav/bottom_nav_screen.dart';
import '../../modules/navigation/drawer/drawer_nav_screen.dart';
import '../../modules/navigation/tab/tab_nav_screen.dart';
import 'home_screen.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Fundamental Guide'),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          // Banner Info
          Container(
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [AppColors.primary, AppColors.primaryLight],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(Icons.school_rounded, color: Colors.white, size: 28),
                    SizedBox(width: 10),
                    Text(
                      'Modul Pembelajaran Flutter',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Kompilasi materi dasar widget, tata letak (layout), dan sistem navigasi Flutter yang dikelompokkan secara modular.',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.95),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // GROUP 1: UI DASAR
          _buildCategoryHeader('1. UI Dasar (Basic Widgets)', Icons.widgets_rounded, AppColors.primary),
          _buildMenuTile(
            context,
            icon: Icons.text_fields_rounded,
            title: 'Text / Label',
            subtitle: 'Styling teks, typography, overflow ellipsis, & RichText',
            destination: const TextLabelScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.image_rounded,
            title: 'Image & Avatar',
            subtitle: 'Image.network, Image.asset, BoxFit, CircleAvatar',
            destination: const ImageScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.smart_button_rounded,
            title: 'Button',
            subtitle: 'ElevatedButton, OutlinedButton, TextButton, FAB, IconButton',
            destination: const ButtonScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.input_rounded,
            title: 'Text Field / Input',
            subtitle: 'TextField, TextFormField, validasi form, password toggle',
            destination: const TextFieldInputScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.credit_card_rounded,
            title: 'Card & Container',
            subtitle: 'Card elevation, shape border, gradient container box',
            destination: const CardScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.view_list_rounded,
            title: 'List & ListTile',
            subtitle: 'ListView.separated, horizontal scroll list, ListTile anatomy',
            destination: const ListScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.menu_book_rounded,
            title: 'Navigation Widgets',
            subtitle: 'AppBar actions, popups, modal bottom sheet dialog',
            destination: const BasicNavigationScreen(),
          ),

          const SizedBox(height: 24),

          // GROUP 2: LAYOUT
          _buildCategoryHeader('2. Layout Widgets', Icons.dashboard_customize_rounded, AppColors.secondary),
          _buildMenuTile(
            context,
            icon: Icons.view_agenda_rounded,
            title: 'Column / Vertical Layout',
            subtitle: 'MainAxisAlignment, CrossAxisAlignment, Spacer, Expanded',
            destination: const ColumnLayoutScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.view_column_rounded,
            title: 'Row / Horizontal Layout',
            subtitle: 'Horizontal alignment, Expanded flex ratio, pencegahan overflow',
            destination: const RowLayoutScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.layers_rounded,
            title: 'Stack & Overlay Layout',
            subtitle: 'Stack lapis, Positioned coordinates, status badge avatar',
            destination: const StackLayoutScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.grid_view_rounded,
            title: 'Grid Layout',
            subtitle: 'GridView.count tetap & GridView.builder dinamis',
            destination: const GridLayoutScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.swap_vert_rounded,
            title: 'Scrollable Layout',
            subtitle: 'SingleChildScrollView & CustomScrollView Slivers',
            destination: const ScrollableLayoutScreen(),
          ),

          const SizedBox(height: 24),

          // GROUP 3: NAVIGASI ANTAR HALAMAN
          _buildCategoryHeader('3. Navigasi Antar Halaman', Icons.alt_route_rounded, Colors.indigo),
          _buildMenuTile(
            context,
            icon: Icons.arrow_forward_rounded,
            title: 'Push & Back Navigation',
            subtitle: 'Navigator.push, Navigator.pop, passing & awaiting data',
            destination: const PushBackScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.dock_rounded,
            title: 'Bottom Navigation',
            subtitle: 'NavigationBar (M3) berpindah antar halaman/tab',
            destination: const BottomNavScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.menu_open_rounded,
            title: 'Drawer Navigation',
            subtitle: 'Side drawer navigation bar dengan user account header',
            destination: const DrawerNavScreen(),
          ),
          _buildMenuTile(
            context,
            icon: Icons.tab_rounded,
            title: 'Tab Navigation',
            subtitle: 'DefaultTabController, TabBar, & TabBarView',
            destination: const TabNavScreen(),
          ),

          const SizedBox(height: 24),

          // GROUP 4: REAL-WORLD CASE STUDY
          _buildCategoryHeader('4. Studi Kasus Aplikasi Penuh', Icons.storefront_rounded, AppColors.tertiary),
          _buildMenuTile(
            context,
            icon: Icons.fastfood_rounded,
            title: 'Katalog Warung Mas Rusdi',
            subtitle: 'Integrasi lengkap UI Dasar, Layout, & Navigasi dalam arsitektur Atomic Design',
            destination: const HomeScreen(),
            isFeatured: true,
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title, IconData icon, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 4),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 10),
          Text(
            title,
            style: AppTypography.titleMedium.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.onSurface,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Widget destination,
    bool isFeatured = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: isFeatured ? AppColors.primaryContainer.withValues(alpha: 0.3) : AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isFeatured ? AppColors.primary.withValues(alpha: 0.4) : AppColors.outline.withValues(alpha: 0.6),
          width: isFeatured ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: CircleAvatar(
          backgroundColor: isFeatured ? AppColors.primary : AppColors.surfaceContainerLow,
          child: Icon(icon, color: isFeatured ? Colors.white : AppColors.primary),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isFeatured ? AppColors.primaryDark : AppColors.onSurface,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTypography.bodySmall.copyWith(
            color: AppColors.textMuted,
            fontSize: 12,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 14,
          color: isFeatured ? AppColors.primary : AppColors.textLight,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => destination),
          );
        },
      ),
    );
  }
}
