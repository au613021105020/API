import 'package:apiprooductspage/api/get%20api/crud.dart';
import 'package:apiprooductspage/api/get%20api/weather.dart';
import 'package:flutter/material.dart';
import 'api/get api/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FakeStore Demo',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home:DataEntryApp(),

    );
  }
}
