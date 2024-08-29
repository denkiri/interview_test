import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/item_model.dart';
void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ItemListProvider(),
      child: const ItemListApp(),
    ),
  );
}
class ItemListApp extends StatelessWidget {
  const ItemListApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      home: ItemListPage(),
    );
  }
}
class ItemListPage extends StatelessWidget {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  ItemListPage({super.key});
  void showAddItemDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          title: const Text('Add New Item'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                final String title = _titleController.text;
                final String description = _descriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  Provider.of<ItemListProvider>(context, listen: false)
                      .addItem(title, description);
                  _titleController.clear();
                  _descriptionController.clear();
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Item List',
          style: TextStyle(color: Colors.white),  // Set the text color to white
        ),
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.blueAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<ItemListProvider>(
          builder: (context, itemListProvider, child) {
            return ListView.builder(
              itemCount: itemListProvider.items.length,
              itemBuilder: (context, index) {
                final item = itemListProvider.items[index];
                return Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 15,
                    ),
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    subtitle: Text(
                      item.description,
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.redAccent),
                      onPressed: () {
                        itemListProvider.deleteItem(index);
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          size: 30,
          color: Colors.white,
        ),
        onPressed: () => showAddItemDialog(context),
      ),

    );
  }
}
