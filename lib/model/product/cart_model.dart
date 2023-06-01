class CartModel {
  final String? key;
  final double? subTotal;
  final double? shipping;
  final double? total;
  final List<_Item>? products;

  CartModel({
    this.key,
    this.subTotal,
    this.shipping,
    this.total,
    this.products,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> productList = json['products'];
    final List<_Item> products =
        productList.map((item) => _Item.fromJson(item['data'])).toList();

    return CartModel(
      key: json['key'],
      subTotal: json['sub_total'].toDouble(),
      shipping: json['shipping'].toDouble(),
      total: json['total'].toDouble(),
      products: products,
    );
  }
}

class _Item {
  final int id;
  final String title;
  final String image;
  final int price;
  final int quantity;
  final int subTotal;

  _Item({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.quantity,
    required this.subTotal,
  });

  factory _Item.fromJson(Map<String, dynamic> json) {
    return _Item(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      price: json['price'],
      quantity: json['quantity'],
      subTotal: json['sub_total'],
    );
  }
}
