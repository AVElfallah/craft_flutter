class ReviewModel {
  String? name;
  String? review;
  double? rate;
  String? productId;
  DateTime? createdAt;

  ReviewModel({
    this.name,
    this.review,
    this.rate,
    this.productId,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    var r = json['rate'].toDouble();
    return ReviewModel(
      name: json['name'] as String,
      review: json['review'] as String,
      rate: r,
      productId: json['product_id'].toString(),
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'review': review,
      'rate': rate,
      'product_id': productId ?? '',
      'created_at': (createdAt ?? DateTime.now()).toIso8601String(),
    };
  }
}
