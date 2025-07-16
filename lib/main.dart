import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/task%203.dart';
import 'package:untitled1/tasks%203.dart';

import 'package:untitled1/theme%20controll.dart';
import 'package:untitled1/we.dart';
import 'package:untitled1/widget.dart';

import 'Splashscreen.dart';
import 'home page.dart';
import 'list.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Flutter Theme Demo',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.currentTheme,
      home:  Splash()
    );
  }
}
