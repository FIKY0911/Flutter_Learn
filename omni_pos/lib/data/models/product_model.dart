enum StockStatus {
  available,
  low,
  empty
}

class ProductModel {
  final int id;
  final String name;
  final String category;
  final String priceText;
  final String stockText;
  final StockStatus stockStatus;
  final String imageUrl;
  final int selectQty;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.priceText,
    required this.stockText,
    required this.stockStatus,
    required this.imageUrl,
    this.selectQty = 0,
  });

  /// Mengambil harga dalam bentuk angka integer untuk kalkulasi total
  int get price =>
      int.tryParse(priceText.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

  ProductModel copyWith({
    int? id,
    String? name,
    String? category,
    String? priceText,
    String? stockText,
    StockStatus? stockStatus,
    String? imageUrl,
    int? selectQty,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      priceText: priceText ?? this.priceText,
      stockText: stockText ?? this.stockText,
      stockStatus: stockStatus ?? this.stockStatus,
      imageUrl: imageUrl ?? this.imageUrl,
      selectQty: selectQty ?? this.selectQty,
    );
  }
}

