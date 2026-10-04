import 'package:flutter/material.dart';
import 'package:omni_pos/data/models/product_model.dart';
import 'product_card.dart';

class ProductGrid extends StatelessWidget {
  final List<ProductModel> products;
  final Function(ProductModel) onAdd;
  final Function(ProductModel) onRemove;
  final Function(ProductModel) onProductTap;

  const ProductGrid({
    super.key,
    required this.products,
    required this.onAdd,
    required this.onRemove,
    required this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 130), // Ruang bawah agar floating cart tidak menutupi item terakhir
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.68,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        delegate: SliverChildBuilderDelegate(
              (context, index) {
            final product = products[index];
            return ProductCard(
              product: product,
              onAdd: () => onAdd(product),
              onRemove: () => onRemove(product),
              onTap: () => onProductTap(product),
            );
          },
          childCount: products.length,
        ),
      ),
    );
  }
}