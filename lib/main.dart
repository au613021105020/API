import 'package:flutter/material.dart';

import 'api/get api/10.dart';
import 'api/get api/11.dart';
import 'api/get api/9.dart';
import 'api/get api/home.dart';
import 'api/get api/next.dart';
import 'api/get api/screen.dart';
import 'api/get api/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home:DataEntryApp  (),

    );
  }
}
