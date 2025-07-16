import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class share extends StatefulWidget {
  @override
  State<share> createState() => _shareState();
}

class _shareState extends State<share> {
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
    loadTheme();
  }

  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = prefs.getBool('isDarkMode') ?? false;
    });
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isDarkMode = !isDarkMode;
      prefs.setBool('isDarkMode', isDarkMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter with Theme',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: QwerScreen(
        isDark: isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}

class QwerScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const QwerScreen({
    super.key,
    required this.isDark,
    required this.toggleTheme,
  });

  @override
  State<QwerScreen> createState() => _QwerScreenState();
}

class _QwerScreenState extends State<QwerScreen> {
  int counter = 0;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> inc() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter++;
    });
    await prefs.setInt('qwerty', counter);
  }

  Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = 0;
    });
    await prefs.remove('qwerty');
  }

  Future<void> load() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = prefs.getInt('qwerty') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$counter",
              style: TextStyle(fontSize: 35),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: inc,
              child: Text("Add"),
            ),
            SizedBox(height: 10),
            OutlinedButton(
              onPressed: reset,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text("Reset/Delete"),
            ),
          ],
        ),
      ),
    );
  }
}