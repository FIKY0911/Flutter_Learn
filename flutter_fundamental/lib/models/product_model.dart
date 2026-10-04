class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final String imageUrl;
  final int stock;
  final String description;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
    required this.stock,
    required this.description,
  });

  String get priceText => 'Rp ${price.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}';

  bool get isOutOfStock => stock <= 0;
}

class CartItemModel {
  final ProductModel product;
  int quantity;

  CartItemModel({
    required this.product,
    this.quantity = 1,
  });

  double get totalPrice => product.price * quantity;
}

final List<ProductModel> dummyKasirProducts = [
  const ProductModel(
    id: 'p1',
    name: 'Nasi Goreng Spesial',
    category: 'Makanan',
    price: 25000,
    imageUrl: 'https://images.unsplash.com/photo-1603133872878-684f208fb84b?auto=format&fit=crop&w=500&q=80',
    stock: 15,
    description: 'Nasi goreng dengan telor mata sapi, sosis, dan kerupuk renyah.',
  ),
  const ProductModel(
    id: 'p2',
    name: 'Mie Ayam Bakso',
    category: 'Makanan',
    price: 20000,
    imageUrl: 'https://images.unsplash.com/photo-1569718212165-3a8278d5f624?auto=format&fit=crop&w=500&q=80',
    stock: 8,
    description: 'Mie ayam kenyal khas Solo dengan potongan daging ayam & 2 bakso sapi.',
  ),
  const ProductModel(
    id: 'p3',
    name: 'Es Teh Manis Jumbo',
    category: 'Minuman',
    price: 5000,
    imageUrl: 'https://images.unsplash.com/photo-1556679343-c7306c1976bc?auto=format&fit=crop&w=500&q=80',
    stock: 50,
    description: 'Es teh manis segar dari teh pilihan dalam porsi jumbo.',
  ),
  const ProductModel(
    id: 'p4',
    name: 'Kopi Susu Gula Aren',
    category: 'Minuman',
    price: 18000,
    imageUrl: 'https://images.unsplash.com/photo-1517701604599-bb29b565090c?auto=format&fit=crop&w=500&q=80',
    stock: 0,
    description: 'Espresso racikan segar dengan susu uht & manisnya gula aren asli.',
  ),
  const ProductModel(
    id: 'p5',
    name: 'Ayam Goreng Lengkuas',
    category: 'Makanan',
    price: 28000,
    imageUrl: 'https://images.unsplash.com/photo-1626082927389-6cd097cdc6ec?auto=format&fit=crop&w=500&q=80',
    stock: 12,
    description: 'Ayam goreng empuk ditaburi renyahnya kremes bumbu lengkuas.',
  ),
  const ProductModel(
    id: 'p6',
    name: 'Es Jeruk Peras',
    category: 'Minuman',
    price: 8000,
    imageUrl: 'https://images.unsplash.com/photo-1613478223719-2ab802602423?auto=format&fit=crop&w=500&q=80',
    stock: 30,
    description: 'Perasan jeruk nipis manis dipadu es batu dingin menyegarkan.',
  ),
];
