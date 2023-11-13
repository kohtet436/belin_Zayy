class CartModel {
  final String? id;
  final String? productId;
  int _quantity;

  CartModel({
    this.id,
    this.productId,
    quantity,
  }) : _quantity = quantity;
  int get quantity => _quantity;
  set quantity(val) {
    _quantity = val;
  }
  // CartModel cartModelInfo(Map<String, dynamic> data)=>CartModel(id:data['id'],productId: data['productId'],quantity: data['quantity']);
}
