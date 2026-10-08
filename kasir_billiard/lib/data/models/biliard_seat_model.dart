enum SeatStatus {
  available,
  low,
  empty
}

class BilliardModel{
  final int id;
  final String name;
  final String category;
  final String priceText;
  final String seatsText;
  final SeatStatus seatStatus;
  final String imageUrl;
  final int selectQty;

const BilliardModel({
  required this.id,
  required this.name,
  required this.category,
  required this.priceText,
  required this.seatsText,
  required this.seatStatus,
  required this.imageUrl,
  this.selectQty = 0,
});

//Mengambil harga dalam bentuk angka integer untuk kalkulasi total
int get price => int.tryParse(priceText.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

BilliardModel copyWith({
    int? id,
    String? name,
    String? category,
    String? priceText,
    String? seatsText,
    SeatStatus? seatStatus,
    String? imageUrl,
    int? selectQty,
  }) {
  return BilliardModel(
    id: id??this.id,
    name: name??this.name,
    category: category??this.category,
    priceText: priceText??this.priceText,
    seatsText: seatsText??this.seatsText,
    seatStatus: seatStatus??this.seatStatus,
    imageUrl: imageUrl??this.imageUrl,
    selectQty: selectQty??this.selectQty,
  );
  }
}