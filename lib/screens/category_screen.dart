import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/menu_provider.dart';
import 'menu_item_screen.dart';

class CategoryScreen extends StatelessWidget {
  final String menuId;

  const CategoryScreen({Key? key, required this.menuId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: Consumer<MenuProvider>(
        builder: (context, menuProvider, child) {
          final categories = menuProvider.getCategoriesForMenu(menuId);
          
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return ListTile(
                title: Text(category.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MenuItemScreen(
                        categoryId: category.categoryId,
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}