import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class qwer extends StatefulWidget {
  const qwer({super.key});

  @override
  State<qwer> createState() => _qwerState();
}

class _qwerState extends State<qwer> {

  int counter = 0;

  inc() async
  {

    final SharedPreferences prefs = await SharedPreferences.getInstance();


    await prefs.setInt('qwerty', counter);

    setState(() {
      counter++;
    });
  }


  load() async
  {

    final SharedPreferences prefs = await SharedPreferences.getInstance();


    counter = await prefs.getInt('qwerty',)!;

    setState(() {

    });
  }


  @override
  void initState() {
   load();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("$counter",style: TextStyle(fontSize: 35),)),
          OutlinedButton(onPressed: inc, child: Text("Add")),



        ],
      ),
    );
  }
}
