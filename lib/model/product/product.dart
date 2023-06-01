import 'package:flutter/foundation.dart';
import 'package:hyah_karima/model/product/product_size.dart';

import 'color.dart';

class Product {
  final int? id;
  final String? title;
  final String? category;
  final String? categoryId;
  final String? description;
  final double? originalPrice;
  final double? sellingPrice;
  final double? rate;
  final int? reviews;
  final String? image;
  final List<ProductColor>? colors;
  final List<ProductSize>? sizes;

  Product({
    this.id,
    this.title,
    this.category,
    this.categoryId,
    this.originalPrice,
    this.sellingPrice,
    this.rate,
    this.image,
    this.reviews,
    this.colors,
    this.sizes,
    this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    List<ProductColor> colors = [];
    for (var color in json['colors']) {
      colors.add(ProductColor.fromJson(color));
    }

    List<ProductSize> sizes = [];
    for (var size in json['sizes']) {
      sizes.add(ProductSize.fromJson(size));
    }

    return Product(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      categoryId: json['category_id'].toString(),
      originalPrice: json['original_price'].toDouble(),
      sellingPrice: json['selling_price'].toDouble(),
      rate: json['rate']?.toDouble(),
      image: json['image'],
      reviews: int.tryParse(json['reviews'].toString()) ?? 0,
      description: json['description'],
      colors: colors,
      sizes: sizes,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          description == other.description &&
          title == other.title &&
          category == other.category &&
          categoryId == other.categoryId &&
          originalPrice == other.originalPrice &&
          sellingPrice == other.sellingPrice &&
          rate == other.rate &&
          image == other.image &&
          reviews == other.reviews &&
          listEquals(colors, other.colors) &&
          listEquals(sizes, other.sizes);

  @override
  int get hashCode =>
      id.hashCode ^
      title.hashCode ^
      description.hashCode ^
      category.hashCode ^
      categoryId.hashCode ^
      originalPrice.hashCode ^
      sellingPrice.hashCode ^
      reviews.hashCode ^
      rate.hashCode ^
      image.hashCode ^
      colors.hashCode ^
      sizes.hashCode;
}
