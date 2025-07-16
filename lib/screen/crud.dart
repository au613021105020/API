import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class Crud extends StatefulWidget {
  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  bool isDark = false;

  String name = '';
  String phone = '';
  String email = '';

  String place = '';

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final placeController = TextEditingController();

  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDark = prefs.getBool('isDark') ?? false;
      name = prefs.getString('name') ?? '';
      phone = prefs.getString('phone') ?? '';
      email = prefs.getString('email') ?? '';

      place = prefs.getString(' place') ?? '';
    });
  }

  Future<void> saveData() async {
    if (nameController.text.isEmpty ||
        phoneController.text.isEmpty ||
        emailController.text.isEmpty ||

        placeController.text.isEmpty ){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', nameController.text.trim());
    await prefs.setString('phone', phoneController.text.trim());
    await prefs.setString('email', emailController.text.trim());

    await prefs.setString(' place', placeController.text.trim());

    setState(() {
      name = nameController.text.trim();
      phone = phoneController.text.trim();
      email = emailController.text.trim();

      place = placeController.text.trim();
      isEditing = false;
    });

    nameController.clear();
    phoneController.clear();
    emailController.clear();

    placeController.clear();
  }

  Future<void> deleteData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('name');
    await prefs.remove('phone');
    await prefs.remove('email');

    await prefs.remove(' place');

    setState(() {
      name = '';
      phone = '';
      email = '';

      place = '';
      isEditing = false;
    });

    nameController.clear();
    phoneController.clear();
    emailController.clear();

    placeController.clear();
  }

  Future<void> toggleTheme(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', value);
    setState(() {
      isDark = value;
    });
  }

  void startEditing() {
    nameController.text = name;
    phoneController.text = phone;
    emailController.text = email ;
    placeController.text = place ;
    setState(() {
      isEditing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDark ? ThemeData.dark() : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Info Crud'),
          actions: [
            Switch(
              value: isDark,
              onChanged: toggleTheme,
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.phone),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: 8),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.email),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),

                SizedBox(height: 8),
                TextField(
                  controller: placeController,
                  decoration: InputDecoration(
                    labelText: 'place',
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.place),
                  ),
                  keyboardType: TextInputType.name,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: saveData,
                  child: Text(isEditing ? 'Update' : 'Save'),
                ),
                SizedBox(height: 20),
                if (name.isNotEmpty && phone.isNotEmpty && email.isNotEmpty)
                  Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(name),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Phone: $phone'),
                          Text('Email: $email'),

                          Text( ' place: $place'),
                        ],
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.orange),
                            onPressed: startEditing,
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: deleteData,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
