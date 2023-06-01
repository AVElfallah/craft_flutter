import 'category_image.dart';

class CategoryModel {
  final int id;
  final String title;
  final String description;
  final List<CategoryImage> images;

  CategoryModel({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    final List<dynamic> imagesJson = json['image'];
    final List<CategoryImage> images = imagesJson
        .map((imageJson) => CategoryImage.fromJson(imageJson))
        .toList();

    return CategoryModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: images,
    );
  }
}
