import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_strings.dart';
import '../../core/constants/app_typography.dart';
import '../../data/models/menu_model.dart';
import '../components/atoms/app_badge.dart';
import '../components/atoms/app_status_dot.dart';
import '../components/molecules/info_stat_card.dart';
import '../components/molecules/price_tag.dart';
import '../components/organisms/composition_box.dart';
import '../components/organisms/detail_bottom_bar.dart';
import '../components/organisms/detail_hero_banner.dart';
import '../components/organisms/note_input_box.dart';
import '../components/templates/detail_template.dart';

class DetailMenuScreen extends StatefulWidget {
  final MenuModel item;

  const DetailMenuScreen({
    super.key,
    required this.item,
  });

  @override
  State<DetailMenuScreen> createState() => _DetailMenuScreenState();
}

class _DetailMenuScreenState extends State<DetailMenuScreen> {
  int _quantity = 1;
  bool _isFavorite = false;
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void _increment() {
    setState(() {
      _quantity++;
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
      });
    }
  }

  void _handleOrder() {
    final messenger = ScaffoldMessenger.of(context);
    messenger.hideCurrentSnackBar();
    messenger.showSnackBar(
      SnackBar(
        content: Row(
          children: [
            const Icon(
              Icons.check_circle_rounded,
              color: AppColors.secondaryLight,
              size: 20,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                '${widget.item.name} ($_quantity) ditambahkan ke pesanan!',
                style: const TextStyle(
                  fontFamily: AppTypography.fontFamily,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        action: SnackBarAction(
          label: AppStrings.viewOrder,
          textColor: AppColors.primaryContainer,
          onPressed: () {},
        ),
        duration: const Duration(seconds: 3),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color(0xFF1E293B),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    final int totalPrice = item.price * _quantity;

    return DetailTemplate(
      // ==========================================
      // 7. NAVIGATION & 3. BUTTON: AppBar dengan tombol Back (Pop Navigation)
      // ==========================================
      appBar: AppBar(
        leading: IconButton(
          // 3. BUTTON: Tombol kembali
          icon: const Icon(Icons.arrow_back_rounded),
          // 7. NAVIGATION: Navigator.pop untuk kembali ke halaman sebelumnya
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          children: [
            // 1. TEXT / LABEL: Judul AppBar
            Text(
              AppStrings.detailTitle,
              style: AppTypography.titleLarge.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            // 1. TEXT / LABEL: Subjudul AppBar
            Text(
              AppStrings.appName,
              style: AppTypography.bodySmall.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 11,
              ),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          // 3. BUTTON: Tombol Favorit
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
              color: _isFavorite ? AppColors.primary : AppColors.onSurface,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  // 1. TEXT / LABEL: Feedback SnackBar
                  content: Text(
                    _isFavorite
                        ? '${item.name} ditambahkan ke Favorit'
                        : '${item.name} dihapus dari Favorit',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          // 3. BUTTON: Tombol Share
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  // 1. TEXT / LABEL: Feedback SnackBar
                  content: Text('Tautan menu ${item.name} disalin ke clipboard'),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
          ),
          const SizedBox(width: 4),
        ],
      ),
      // ==========================================
      // 2. IMAGE & 5. CARD: Detail Hero Banner (Foto Menu Besar + Rating)
      // ==========================================
      heroBanner: DetailHeroBanner(item: item),
      // ==========================================
      // 1. TEXT / LABEL & 5. CARD (Price Tag): Nama Menu, Badge, dan Harga
      // ==========================================
      titleAndPrice: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. TEXT / LABEL: Title dan Badge Status
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  item.name,
                  style: AppTypography.headlineLarge.copyWith(
                    fontWeight: FontWeight.w800,
                    fontSize: 22,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              if (item.badgeText != null)
                AppBadge(
                  text: item.badgeText!,
                  variant: BadgeVariant.success,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                )
              else
                const AppBadge(
                  text: AppStrings.popularBadge,
                  variant: BadgeVariant.success,
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                ),
            ],
          ),
          const SizedBox(height: 6),
          // 1. TEXT / LABEL: Metadata Kode Menu & Ketersediaan
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AppStatusDot(color: AppColors.secondary, size: 6),
                  const SizedBox(width: 6),
                  Text(
                    'Kode Menu: ${item.id}',
                    style: AppTypography.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const Text('•', style: TextStyle(color: AppColors.textLight)),
              Text(
                AppStrings.availableReadyToCook,
                style: AppTypography.bodySmall.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // 1. TEXT & 5. CARD: Tampilan Harga & Diskon
          PriceTag(
            price: item.price,
            originalPrice: item.originalPrice,
            variant: PriceTagVariant.detail,
          ),
        ],
      ),
      // ==========================================
      // 5. CARD & 6. LIST (ROW): Statistik Info Menu (Waktu Masak, Porsi, Kepedasan)
      // ==========================================
      infoStatsRow: Row(
        children: [
          Expanded(
            child: InfoStatCard(
              icon: Icons.timer_outlined,
              label: AppStrings.cookingTime,
              value: item.cookingTime,
              iconBgColor: const Color(0xFFFFECE5),
              iconColor: AppColors.primary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InfoStatCard(
              icon: Icons.soup_kitchen_outlined,
              label: AppStrings.servingPortion,
              value: item.portion,
              iconBgColor: const Color(0xFFE8F5E9),
              iconColor: AppColors.secondary,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: InfoStatCard(
              icon: Icons.local_fire_department_outlined,
              label: AppStrings.spiceLevel,
              value: item.spiceLevel,
              iconBgColor: const Color(0xFFFFECE5),
              iconColor: AppColors.primaryDark,
            ),
          ),
        ],
      ),
      // ==========================================
      // 1. TEXT / LABEL: Deskripsi Lengkap Menu
      // ==========================================
      descriptionSection: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.menu_book_rounded,
                size: 20,
                color: AppColors.primary,
              ),
              const SizedBox(width: 8),
              Text(
                AppStrings.menuDescription,
                style: AppTypography.titleMedium.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            item.description,
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.onSurfaceVariant,
              height: 1.55,
              fontSize: 13.5,
            ),
          ),
        ],
      ),
      // ==========================================
      // 5. CARD & 1. TEXT: Komposisi & Bahan Menu
      // ==========================================
      compositionSection: CompositionBox(compositions: item.composition),
      // ==========================================
      // 4. TEXT FIELD / INPUT: Catatan Khusus Pesanan (TextField)
      // ==========================================
      noteInputSection: NoteInputBox(
        controller: _noteController,
      ),
      // ==========================================
      // 3. BUTTON: Tombol Counter Jumlah & Tombol Pesan Sekarang
      // ==========================================
      bottomActionBar: DetailBottomBar(
        quantity: _quantity,
        totalPrice: totalPrice,
        onIncrement: _increment,
        onDecrement: _decrement,
        onOrderNow: _handleOrder,
      ),
    );
  }
}
