{\rtf1}class ModifierGroupRule {
  final String id;
  final int minQuantity;
  final int maxQuantity;

  ModifierGroupRule({
    required this.id,
    required this.minQuantity,
    required this.maxQuantity,
  });

  factory ModifierGroupRule.fromJson(Map<String, dynamic> json) {
    return ModifierGroupRule(
      id: json['id'],
      minQuantity: json['minQuantity'],
      maxQuantity: json['maxQuantity'],
    );
  }
}

class Modifier {
  final String modifierId;
  final String name;
  final double price;
  final int maxQuantity;

  Modifier({
    required this.modifierId,
    required this.name,
    required this.price,
    required this.maxQuantity,
  });

  factory Modifier.fromJson(Map<String, dynamic> json) {
    return Modifier(
      modifierId: json['modifierId'],
      name: json['name'],
      price: json['priceInfo']['price'].toDouble(),
      maxQuantity: json['quantityInfo']['maxQuantity'],
    );
  }
}