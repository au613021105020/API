import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apitools extends StatefulWidget {
  const Apitools({super.key});

  @override
  State<Apitools> createState() => _ApitoolsState();
}

class _ApitoolsState extends State<Apitools> {
   Map <String,dynamic> Fodata={};
   Future<joo>  getData() async {
     try{
       var apiResponse = await http.get(
         Uri.parse("https://dog.ceo/api/breeds/image/random"));

             Fodata = jsonDecode(apiResponse.body);
          print(Fodata);
          if (apiResponse.statusCode == 200){
            print(apiResponse.statusCode);
            return joo.fromJson(Fodata);
          }
          else {
            throw Exception("Something went Wrong");
          }
          }
          catch (e){
            print(e);
            throw Exception(e);
          }
          }
       
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
        
      ),
       body: FutureBuilder(future: getData(), builder: (context,snapshort){
         if (snapshort.connectionState==ConnectionState.waiting){
           return CircularProgressIndicator();
         }
         else if (snapshort.hasError){
           return Text("Error:${snapshort}");
         }
         else if (snapshort.hasData){
           return Column(
             children: [
               Container(
                 height:200 ,
                 width: 200,
                 decoration: BoxDecoration(
                   image: DecorationImage(image:NetworkImage(Fodata["message"]))
                 ),
               ),
               Text(Fodata["status"].toString()),
             ],
           );
         }
         else{
           return Text("No data found");
         }
       }),
    );
  }
}
class joo {
  String? message;
  String? status;

  joo({this.message, this.status});

  joo.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}