class ProductModel {
  final String id, title, imageUrl, productCategoryName;
  final double price, salePrice;
  final bool isOnSale, isPiece;

  ProductModel(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.productCategoryName,
      required this.price,
      required this.salePrice,
      required this.isOnSale,
      required this.isPiece});
  factory ProductModel.fromJson(
      {required String doc, required Map<String, dynamic> json}) {
    return ProductModel(
        id: json['id'],
        title: json['title'],
        imageUrl: json['imageUrl'],
        productCategoryName: json['productCategoryName'],
        price: double.tryParse(json['price'].toString()) ?? 0.0,
        salePrice: json['salePrice'],
        isOnSale: json['isOnSale'] as bool,
        isPiece: json['isPiece']);
  }
}
