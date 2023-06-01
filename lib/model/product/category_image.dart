class CategoryImage {
  final int id;
  final String path;
  final String type;
  final String usage;
  final String attachmentableType;
  final int attachmentableId;
  final DateTime createdAt;
  final DateTime updatedAt;

  CategoryImage({
    required this.id,
    required this.path,
    required this.type,
    required this.usage,
    required this.attachmentableType,
    required this.attachmentableId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CategoryImage.fromJson(Map<String, dynamic> json) {
    return CategoryImage(
      id: json['id'],
      path: json['path'],
      type: json['type'],
      usage: json['usage'],
      attachmentableType: json['attachmentable_type'],
      attachmentableId: json['attachmentable_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }
}
