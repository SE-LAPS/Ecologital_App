class MenuItem {
  final String menuItemId;
  final String name;
  final double price;
  final String description;
  final bool isDealProduct;
  final List<ModifierGroupRule> modifierGroupRules;

  MenuItem({
    required this.menuItemId,
    required this.name,
    required this.price,
    required this.description,
    required this.isDealProduct,
    required this.modifierGroupRules,
  });

  factory MenuItem.fromJson(Map<String, dynamic> json) {
    return MenuItem(
      menuItemId: json['menuItemId'],
      name: json['name'],
      price: json['price'].toDouble(),
      description: json['description'],
      isDealProduct: json['metadata']['isDealProduct'] ?? false,
      modifierGroupRules: (json['modifierGroupRules'] as List?)
          ?.map((rule) => ModifierGroupRule.fromJson(rule))
          .toList() ?? [],
    );
  }
}