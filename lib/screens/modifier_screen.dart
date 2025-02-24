import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/menu_provider.dart';
import '../models/menu_item.dart';

class ModifierScreen extends StatefulWidget {
  final MenuItem menuItem;

  const ModifierScreen({Key? key, required this.menuItem}) : super(key: key);

  @override
  _ModifierScreenState createState() => _ModifierScreenState();
}

class _ModifierScreenState extends State<ModifierScreen> {
  Map<String, int> selectedModifiers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifiers for ${widget.menuItem.name}'),
      ),
      body: Consumer<MenuProvider>(
        builder: (context, menuProvider, child) {
          final modifiers = menuProvider.getModifiersForMenuItem(widget.menuItem);
          
          return ListView.builder(
            itemCount: modifiers.length,
            itemBuilder: (context, index) {
              final modifier = modifiers[index];
              final quantity = selectedModifiers[modifier.modifierId] ?? 0;
              
              return ListTile(
                title: Text(modifier.name),
                subtitle: Text('\$${modifier.price.toStringAsFixed(2)}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: quantity > 0
                          ? () {
                              setState(() {
                                selectedModifiers[modifier.modifierId] = quantity - 1;
                              });
                            }
                          : null,
                    ),
                    Text('$quantity'),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: quantity < modifier.maxQuantity
                          ? () {
                              setState(() {
                                selectedModifiers[modifier.modifierId] = quantity + 1;
                              });
                            }
                          : null,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}