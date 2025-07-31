import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class goo extends StatefulWidget {
  const goo({super.key});

  @override
  State<goo> createState() => _gooState();
}

class _gooState extends State<goo> {
  Map<String,dynamic> hello ={};
  Future<Manu> getData() async{
    try{
      var apiResponse = await http.get(
        Uri.parse("https://api.genderize.io/?name=luc"));
            hello = jsonDecode(apiResponse.body);
         print(hello);
         if (apiResponse.statusCode == 200){
           print (apiResponse.statusCode);
           return Manu.fromJson(hello);
         }
         else {
           throw Exception("error");
         }
         }
         catch (e) {
           print(e);
           throw Exception(e);
         }


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Api Task"),
      ),
       body: FutureBuilder(future: getData(), builder: (context,snapshot){
         if (snapshot.connectionState == ConnectionState.waiting){
           return CircularProgressIndicator();
         }
         else if (snapshot.hasError){
           return Text(" Error: ${snapshot.error}");

         } else if (snapshot.hasData){
           return Column(
             children: [
               Text(hello["count"].toString()),
               Text( hello["name"]),
               Text(  hello ["gender"]),
               Text( hello ["probability"].toString() ),
             ],
           );
         }
         else{
           return Text(" no serivice");
         }

       }),
    );
  }
}
class Manu {
  int? count;
  String? name;
  String? gender;
  double? probability;

  Manu({this.count, this.name, this.gender, this.probability});

  Manu.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    name = json['name'];
    gender = json['gender'];
    probability = json['probability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['probability'] = this.probability;
    return data;
  }
}
