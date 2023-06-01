class ProductSize {
  final int? id;
  final String? size;

  ProductSize({
    this.id,
    this.size,
  });

  factory ProductSize.fromJson(Map<String, dynamic> json) {
    return ProductSize(
      id: json['id'],
      size: json['size'],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductSize &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          size == other.size;

  @override
  int get hashCode => id.hashCode ^ size.hashCode;
}
