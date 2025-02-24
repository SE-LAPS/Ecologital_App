import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/menu_provider.dart';
import 'modifier_screen.dart';

class MenuItemScreen extends StatelessWidget {
  final String categoryId;

  const MenuItemScreen({Key? key, required this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Items'),
      ),
      body: Consumer<MenuProvider>(
        builder: (context, menuProvider, child) {
          final menuItems = menuProvider.getMenuItemsForCategory(categoryId);
          
          return ListView.builder(
            itemCount: menuItems.length,
            itemBuilder: (context, index) {
              final menuItem = menuItems[index];
              return ListTile(
                title: Text(menuItem.name),
                subtitle: Text(menuItem.description),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (menuItem.isDealProduct)
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Deal',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    const SizedBox(width: 8),
                    Text('\$${menuItem.price.toStringAsFixed(2)}'),
                  ],
                ),
                onTap: () {
                  if (menuItem.modifierGroupRules.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ModifierScreen(menuItem: menuItem),
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}