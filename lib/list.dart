import 'package:flutter/material.dart';



class ItemListScreen extends StatefulWidget {
  const ItemListScreen({super.key});

  @override
  State<ItemListScreen> createState() => _ItemListScreenState();
}

class _ItemListScreenState extends State<ItemListScreen> {
  final TextEditingController _controller = TextEditingController();
  List<String> items = ['Apple', 'Banana', 'Orange'];
  int? editingIndex;

  void _addOrUpdateItem() {
    String text = _controller.text.trim();
    if (text.isEmpty) return;

    setState(() {
      if (editingIndex == null) {
        // Add new
        items.add(text);
      } else {
        // Update existing
        items[editingIndex!] = text;
        editingIndex = null;
      }
      _controller.clear();
    });
  }

  void _editItem(int index) {
    setState(() {
      _controller.text = items[index];
      editingIndex = index;
    });
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
      if (editingIndex == index) {
        _controller.clear();
        editingIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit/Delete List')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: editingIndex == null ? 'Add Item' : 'Edit Item',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: _addOrUpdateItem,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) => ListTile(
                  title: Text(items[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit, color: Colors.blue),
                        onPressed: () => _editItem(index),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteItem(index),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
