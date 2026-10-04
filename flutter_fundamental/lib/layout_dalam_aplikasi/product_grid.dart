import 'package:flutter/material.dart';
import '../komponen_dasar/product_card.dart';
import '../models/product_model.dart';

/// ============================================================================
/// 2. LAYOUT DALAM APLIKASI MOBILE - Grid
/// Penjelasan: Menyusun daftar menu produk dalam format grid 2 kolom.
/// Lokasi Code & Contoh:
/// • product_grid.dart:26-35 (SliverGrid.builder)
/// ============================================================================
class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onProductTap;
  final Function(ProductModel) onAddToCart;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onProductTap,
    required this.onAddToCart,
  });

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) {
      return const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Center(
            child: Text('Tidak ada produk yang ditemukan.'),
          ),
        ),
      );
    }

    /// ========================================================================
    /// 2. LAYOUT DALAM APLIKASI - Grid
    /// Menyusun daftar menu produk dalam format grid 2 kolom.
    /// Lokasi Code & Contoh: product_grid.dart:26-35 (SliverGrid.builder)
    /// ========================================================================
    return SliverGrid.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.72,
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
      ),
      itemBuilder: (context, index) {
        final product = products[index];
        return ProductCard(
          product: product,
          onTap: () => onProductTap(product),
          onAddToCart: () => onAddToCart(product),
        );
      },
    );
  }
}
