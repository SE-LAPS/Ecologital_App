class Category {
  final String categoryId;
  final String name;
  final List<String> menuEntityIds;

  Category({
    required this.categoryId,
    required this.name,
    required this.menuEntityIds,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryId: json['categoryId'],
      name: json['name'],
      menuEntityIds: List<String>.from(json['menuEntityIds']),
    );
  }
}