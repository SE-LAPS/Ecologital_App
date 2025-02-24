class Menu {
  final String menuId;
  final String name;
  final List<String> menuCategoryIds;

  Menu({
    required this.menuId,
    required this.name,
    required this.menuCategoryIds,
  });

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu(
      menuId: json['menuId'],
      name: json['name'],
      menuCategoryIds: List<String>.from(json['menuCategoryIds']),
    );
  }
}