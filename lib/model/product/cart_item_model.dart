class CartItemModel {
  final int? productId;
  final int? productColorId;
  final int? productSizeId;
  final int? quantity;
  final int? clientId;
  final double? price;
  final double? subTotal;

  CartItemModel({
    this.productId,
    this.productColorId,
    this.productSizeId,
    this.quantity,
    this.clientId,
    this.price,
    this.subTotal,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'] ?? 0,
      productColorId: json['product_color_id'] ?? 0,
      productSizeId: json['product_size_id'] ?? 0,
      quantity: json['quantity'] ?? 0,
      clientId: json['client_id'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      subTotal: (json['sub_total'] ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'product_color_id': productColorId,
      'product_size_id': productSizeId,
      'quantity': quantity,
      'client_id': clientId,
      'price': price,
      'sub_total': subTotal,
    };
  }
}
