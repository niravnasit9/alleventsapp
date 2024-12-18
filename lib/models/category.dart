class Category {
  final String name;
  final String description;
  final String imageUrl;

  Category({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
    );
  }
}
