import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_list/data/categories.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceriesList extends StatefulWidget {
  const GroceriesList({super.key});

  @override
  State<GroceriesList> createState() => _GroceriesListState();
}

class _GroceriesListState extends State<GroceriesList> {
  List<GroceryItem> _groceryItems = [];
  bool isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadGroceries();
  }

  void _loadGroceries() async {
    final url = Uri.https(
      'flutter-prep-3662e-default-rtdb.firebaseio.com',
      'shopping-list.json',
    );
    try {
      final response = await http.get(url);
      if (response.body == 'null') {
        setState(() {
          _error = 'No items added yet.';
        });
        return;
      }

      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<GroceryItem> loadedItems = [];
      for (final item in data.entries) {
        final category = categories.entries
            .firstWhere(
              (category) => category.value.title == item.value['category'],
            )
            .value;

        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );
      }

      setState(() {
        _groceryItems = loadedItems;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        _error = 'Something went wrong! Try again later.';
      });
    }
  }

  void _addItem() async {
    final GroceryItem newItem = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => const NewItem()));

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  void _showInfoMessage(String content) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(content)));
  }

  void _removeItem(GroceryItem groceryItem) {
    final url = Uri.https(
      'flutter-prep-3662e-default-rtdb.firebaseio.com',
      'shopping-list/${groceryItem.id}.json',
    );
    http.delete(url);
    setState(() {
      _groceryItems.remove(groceryItem);
    });
    _showInfoMessage('Item removed');
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (isLoading) {
      content = Center(child: CircularProgressIndicator());
    }

    if (_error != null) {
      content = Center(child: Text(_error!));
    }

    if (_groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) {
          final groceryItem = _groceryItems[index];
          return Dismissible(
            key: ValueKey(groceryItem.id),
            onDismissed: (_) {
              _removeItem(groceryItem);
            },
            child: ListTile(
              leading: Container(
                width: 40.0,
                height: 40.0,
                color: groceryItem.category.color,
              ),
              title: Text(groceryItem.name),
              subtitle: Text(groceryItem.category.title),
              trailing: Text(groceryItem.quantity.toString()),
            ),
          );
        },
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
