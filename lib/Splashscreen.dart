import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled1/login.dart';
import 'package:untitled1/theme%20controll.dart';

import 'main.dart';


class Splash extends StatelessWidget {
  get themeMode => null;


  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);


    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Login()));
    });

    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Text(
          "Google Account",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
    );
  }
}