import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DataEntryApp extends StatefulWidget {
  const DataEntryApp({super.key});

  @override
  State<DataEntryApp> createState() => _DataEntryAppState();
}

class _DataEntryAppState extends State<DataEntryApp> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _emailController = TextEditingController();
  final _cityController = TextEditingController();
  final _mobileController = TextEditingController();

  List<Map<String, String>> entries = [];
  int? editingIndex;
  bool allowDelete = true;

  @override
  void initState() {
    super.initState();
    _loadEntries();
  }

  Future<void> _loadEntries() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString('entries');
    if (data != null) {
      final decoded = json.decode(data) as List;
      setState(() {
        entries = decoded.map((e) => Map<String, String>.from(e)).toList();
        allowDelete = false;
      });
    }
  }

  Future<void> _saveEntries() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('entries', json.encode(entries));
  }

  Future<void> _postDataToApi(Map<String, String> entry) async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(entry),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Data sent to server successfully.")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Server error: ${response.statusCode}")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("API error: $e")),
      );
    }
  }

  void _saveEntry() async {
    if (_formKey.currentState!.validate()) {
      final newEntry = {
        'name': _nameController.text,
        'age': _ageController.text,
        'email': _emailController.text,
        'city': _cityController.text,
        'mobile': _mobileController.text,
      };

      setState(() {
        if (editingIndex == null) {
          entries.add(newEntry);
        } else {
          entries[editingIndex!] = newEntry;
          editingIndex = null;
        }
        allowDelete = true;
        _clearFields();
      });

      await _saveEntries();
      await _postDataToApi(newEntry);
    }
  }

  void _editEntry(int index) {
    final entry = entries[index];
    _nameController.text = entry['name']!;
    _ageController.text = entry['age']!;
    _emailController.text = entry['email']!;
    _cityController.text = entry['city']!;
    _mobileController.text = entry['mobile']!;
    setState(() {
      editingIndex = index;
    });
  }

  void _deleteEntry(int index) async {
    if (!allowDelete) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("You cannot delete after restart.")),
      );
      return;
    }

    setState(() {
      entries.removeAt(index);
      if (editingIndex == index) {
        editingIndex = null;
        _clearFields();
      }
    });
    await _saveEntries();
  }

  void _clearFields() {
    _nameController.clear();
    _ageController.clear();
    _emailController.clear();
    _cityController.clear();
    _mobileController.clear();
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        validator: (val) => val == null || val.isEmpty ? 'Enter $label' : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Entry with API'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  _buildTextField(controller: _nameController, label: 'Name'),
                  _buildTextField(
                    controller: _ageController,
                    label: 'Age',
                    keyboardType: TextInputType.number,
                  ),
                  _buildTextField(controller: _emailController, label: 'Email'),
                  _buildTextField(controller: _cityController, label: 'City'),
                  _buildTextField(
                    controller: _mobileController,
                    label: 'Mobile',
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _saveEntry,
                    child: Text(editingIndex == null ? 'Save & Send' : 'Update & Send'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Saved Entries", style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Expanded(
              child: entries.isEmpty
                  ? const Center(child: Text('No service saved yet.'))
                  : ListView.builder(
                itemCount: entries.length,
                itemBuilder: (context, index) {
                  final e = entries[index];
                  return Card(
                    child: ListTile(
                      title: Text(e['name'] ?? ''),
                      subtitle: Text(
                        'Age: ${e['age']}, Email: ${e['email']}\nCity: ${e['city']}, Mobile: ${e['mobile']}',
                      ),
                      isThreeLine: true,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => _editEntry(index),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: allowDelete ? Colors.red : Colors.grey,
                            ),
                            onPressed: () => _deleteEntry(index),
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
      ),
    );
  }
}
