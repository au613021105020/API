
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/theme%20controll.dart';

import 'crud.dart';
import 'main.dart';



class Home extends StatefulWidget {
  static _HomeState? of(BuildContext context) =>
      context.findAncestorStateOfType<_HomeState>();

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void refreshTheme() => setState(() {});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),

      home: HomePage(),
    );
  }
}

// 🏠 Home Page with Bottom Navigation
class HomePage extends StatefulWidget {



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  final List<Widget> pages = [
    ListPage(),
    Crud(),

  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'List',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Image',
          ),
        ],
      ),
    );
  }
}

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final List<Map<String, String>> entries = [];

  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  int? editingIndex;

  void addOrUpdateEntry() {
    final name = nameCtrl.text.trim();
    final phone = phoneCtrl.text.trim();

    if (name.isEmpty || phone.isEmpty) return;

    final newEntry = {'name': name, 'phone': phone};

    setState(() {
      if (editingIndex == null) {
        entries.add(newEntry); // Add new
      } else {
        entries[editingIndex!] = newEntry; // Update existing
      }
      nameCtrl.clear();
      phoneCtrl.clear();
      editingIndex = null;
    });
  }

  void editEntry(int index) {
    final item = entries[index];
    setState(() {
      nameCtrl.text = item['name']!;
      phoneCtrl.text = item['phone']!;
      editingIndex = index;
    });
  }

  void deleteEntry(int index) {
    setState(() {
      entries.removeAt(index);
      if (editingIndex == index) {
        nameCtrl.clear();
        phoneCtrl.clear();
        editingIndex = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text("User List")),
      body: Column(
        children: [
          // 🧾 Input Form (Always Visible)
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: InputDecoration(labelText: "Name"),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: phoneCtrl,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: "Phone"),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: addOrUpdateEntry,
                  child: Text(editingIndex == null ? "Add" : "Save"),
                ),
              ],
            ),
          ),

          Divider(),

          Expanded(
            child: entries.isEmpty
                ? Center(child: Text("📝 No users. Add some above!"))
                : ListView.builder(
              itemCount: entries.length,
              itemBuilder: (_, index) {
                final item = entries[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  child: ListTile(
                    title: Text(item['name'] ?? ''),
                    subtitle: Text("📞 ${item['phone']}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit, color: Colors.blue),
                          onPressed: () => editEntry(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () => deleteEntry(index),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
