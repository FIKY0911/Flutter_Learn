import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_typography.dart';
import '../../data/dummy/dummy_menu.dart';
import '../../data/models/menu_model.dart';
import '../components/molecules/category_chip.dart';
import '../components/molecules/search_bar_input.dart';
import '../components/molecules/section_header.dart';
import '../components/organisms/bottom_nav_bar.dart';
import '../components/organisms/menu_card.dart';
import '../components/organisms/promo_banner.dart';
import '../components/organisms/warung_app_bar.dart';
import '../components/templates/catalog_template.dart';
import 'detail_menu_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ==========================================
  // 4. TEXT FIELD / INPUT: Controller untuk input pencarian
  // ==========================================
  final TextEditingController _searchController = TextEditingController();
  String _selectedCategory = AppStrings.categoryAll;
  String _searchQuery = '';
  int _navIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<MenuModel> get _filteredMenuList {
    return dummyMenuList.where((item) {
      final matchesCategory = _selectedCategory == AppStrings.categoryAll ||
          item.category.toLowerCase() == _selectedCategory.toLowerCase();

      final matchesQuery = _searchQuery.isEmpty ||
          item.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.description.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.category.toLowerCase().contains(_searchQuery.toLowerCase());

      return matchesCategory && matchesQuery;
    }).toList();
  }

  int _getCategoryCount(String category) {
    if (category == AppStrings.categoryAll) {
      return dummyMenuList.length;
    }
    return dummyMenuList.where((item) => item.category.toLowerCase() == category.toLowerCase()).length;
  }

  // ==========================================
  // 7. NAVIGATION: Berpindah halaman ke DetailMenuScreen
  // ==========================================
  void _navigateToDetail(MenuModel item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailMenuScreen(item: item),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredList = _filteredMenuList;

    return CatalogTemplate(
      appBar: WarungAppBar(
        onProfileTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              // 1. TEXT / LABEL: Menampilkan pesan teks pada SnackBar
              content: Text('Profil Pengguna Warung Mas Rusdi'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
      // ==========================================
      // 4. TEXT FIELD / INPUT: Widget Input Pencarian Menu
      // ==========================================
      searchBar: SearchBarInput(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
        onClear: () {
          setState(() {
            _searchQuery = '';
          });
        },
      ),
      // ==========================================
      // 2. IMAGE & 5. CARD: Banner Promo (Berisi background image & teks)
      // ==========================================
      promoBanner: const PromoBanner(),
      // ==========================================
      // 6. LIST (HORIZONTAL) & 3. BUTTON: Daftar Kategori Menu yang dapat di-klik
      // ==========================================
      categorySelector: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          children: [
            CategoryChip(
              label: AppStrings.categoryAll,
              icon: Icons.storefront_rounded,
              count: _getCategoryCount(AppStrings.categoryAll),
              isSelected: _selectedCategory == AppStrings.categoryAll,
              onTap: () {
                setState(() {
                  _selectedCategory = AppStrings.categoryAll;
                });
              },
            ),
            const SizedBox(width: 8),
            CategoryChip(
              label: AppStrings.categoryFood,
              icon: Icons.soup_kitchen_rounded,
              count: _getCategoryCount(AppStrings.categoryFood),
              isSelected: _selectedCategory == AppStrings.categoryFood,
              onTap: () {
                setState(() {
                  _selectedCategory = AppStrings.categoryFood;
                });
              },
            ),
            const SizedBox(width: 8),
            CategoryChip(
              label: AppStrings.categoryDrink,
              icon: Icons.local_cafe_rounded,
              count: _getCategoryCount(AppStrings.categoryDrink),
              isSelected: _selectedCategory == AppStrings.categoryDrink,
              onTap: () {
                setState(() {
                  _selectedCategory = AppStrings.categoryDrink;
                });
              },
            ),
            const SizedBox(width: 8),
            CategoryChip(
              label: AppStrings.categorySnack,
              icon: Icons.cookie_rounded,
              count: _getCategoryCount(AppStrings.categorySnack),
              isSelected: _selectedCategory == AppStrings.categorySnack,
              onTap: () {
                setState(() {
                  _selectedCategory = AppStrings.categorySnack;
                });
              },
            ),
          ],
        ),
      ),
      // ==========================================
      // 1. TEXT / LABEL: Judul & Subjudul Section Katalog
      // ==========================================
      sectionHeader: SectionHeader(
        title: AppStrings.catalogSectionTitle,
        subtitle: AppStrings.catalogSectionSubtitle,
        badgeText: '${filteredList.length} Menu Tersedia',
      ),
      // ==========================================
      // 6. LIST (VERTICAL) & 5. CARD: Daftar Menu menggunakan ListView
      // ==========================================
      menuList: filteredList.isEmpty
          ? Container(
              padding: const EdgeInsets.symmetric(vertical: 40),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Icon(
                    Icons.search_off_rounded,
                    size: 56,
                    color: AppColors.textMuted.withValues(alpha: 0.5),
                  ),
                  const SizedBox(height: 12),
                  // 1. TEXT / LABEL: Teks status ketika menu kosong
                  Text(
                    'Menu tidak ditemukan',
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 4),
                  // 1. TEXT / LABEL: Panduan pencarian
                  Text(
                    'Coba gunakan kata kunci pencarian yang lain.',
                    style: AppTypography.bodySmall,
                  ),
                ],
              ),
            )
          : ListView.separated(
              // 6. LIST: ListView.separated untuk me-render list item yang efisien
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredList.length,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = filteredList[index];
                // 5. CARD: MenuCard menampilkan card untuk setiap item menu
                return MenuCard(
                  item: item,
                  // 7. NAVIGATION: Memanggil fungsi navigasi saat card ditekan
                  onTap: () => _navigateToDetail(item),
                );
              },
            ),
      footerNote: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.verified_rounded,
            size: 16,
            color: AppColors.secondary,
          ),
          const SizedBox(width: 6),
          Flexible(
            // 1. TEXT / LABEL: Label keterangan Halal
            child: Text(
              AppStrings.halalBadge,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.secondary,
                fontWeight: FontWeight.w600,
                fontSize: 11.5,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      // ==========================================
      // 7. NAVIGATION: Bottom Navigation Bar
      // ==========================================
      bottomNavBar: BottomNavBar(
        currentIndex: _navIndex,
        onTap: (index) {
          setState(() {
            _navIndex = index;
          });
        },
      ),
    );
  }
}
