class ProductColor {
  final int? id;
  final String? color;

  ProductColor({
    this.id,
    this.color,
  });

  factory ProductColor.fromJson(Map<String, dynamic> json) {
    return ProductColor(
      id: json['id'],
      color: json['color'],
    );
  }
}
