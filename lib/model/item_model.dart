import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
class Item {
  final String title;
  final String description;
  Item({required this.title, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
    };
  }
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      title: map['title'],
      description: map['description'],
    );
  }
}

class ItemListProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  ItemListProvider() {
    _loadItemsFromPreferences();
  }

  void addItem(String title, String description) {
    _items.add(Item(title: title, description: description));
    _saveItemsToPreferences();
    notifyListeners();
  }

  void deleteItem(int index) {
    _items.removeAt(index);
    _saveItemsToPreferences();
    notifyListeners();
  }

  Future<void> _loadItemsFromPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? itemsString = prefs.getString('items');
    if (itemsString != null) {
      List<dynamic> jsonList = json.decode(itemsString);
      _items.addAll(jsonList.map((jsonItem) => Item.fromMap(jsonItem)).toList());
      print('Loaded items: $_items'); // Debugging statement
      notifyListeners();
    } else {
      print('No items found in SharedPreferences.'); // Debugging statement
    }
  }

  Future<void> _saveItemsToPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Map<String, dynamic>> jsonList = _items.map((item) => item.toMap()).toList();
    bool success = await prefs.setString('items', json.encode(jsonList));
    print('Saved items: $jsonList, success: $success'); // Debugging statement
  }
}
