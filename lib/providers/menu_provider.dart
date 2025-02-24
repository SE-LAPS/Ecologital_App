import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';

class MenuProvider with ChangeNotifier {
  List<Menu> _menus = [];
  List<Category> _categories = [];
  List<MenuItem> _menuItems = [];
  List<Modifier> _modifiers = [];

  List<Menu> get menus => _menus;
  List<Category> get categories => _categories;
  List<MenuItem> get menuItems => _menuItems;
  List<Modifier> get modifiers => _modifiers;

  Future<void> loadData() async {
    final String jsonString = await rootBundle.loadString('assets/menu_data.json');
    final data = json.decode(jsonString);

    _menus = (data['menus'] as List).map((menu) => Menu.fromJson(menu)).toList();
    _categories = (data['categories'] as List).map((category) => Category.fromJson(category)).toList();
    _menuItems = (data['menuItems'] as List).map((item) => MenuItem.fromJson(item)).toList();
    _modifiers = (data['modifiers'] as List).map((modifier) => Modifier.fromJson(modifier)).toList();

    notifyListeners();
  }

  List<Category> getCategoriesForMenu(String menuId) {
    final menu = _menus.firstWhere((menu) => menu.menuId == menuId);
    return _categories.where((category) => 
      menu.menuCategoryIds.contains(category.categoryId)).toList();
  }

  List<MenuItem> getMenuItemsForCategory(String categoryId) {
    final category = _categories.firstWhere((category) => category.categoryId == categoryId);
    return _menuItems.where((item) => 
      category.menuEntityIds.contains(item.menuItemId)).toList();
  }

  List<Modifier> getModifiersForMenuItem(MenuItem menuItem) {
    List<Modifier> itemModifiers = [];
    for (var rule in menuItem.modifierGroupRules) {
      itemModifiers.addAll(_modifiers.where((modifier) => 
        modifier.modifierId == rule.id).toList());
    }
    return itemModifiers;
  }
}