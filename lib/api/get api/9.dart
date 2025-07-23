import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class vvvv extends StatefulWidget {
  const vvvv({super.key});

  @override
  State<vvvv> createState() => _vvvvState();
}

class _vvvvState extends State<vvvv> {
  Map<String, dynamic> hello = {};

  Future<go> getData() async {
    try {
      var apiResponse = await http.get(
          Uri.parse("https://api.ipify.org/?format=json")); // ✅ correct API
      hello = jsonDecode(apiResponse.body);
      print(hello);
      if (apiResponse.statusCode == 200) {
        return go.fromJson(hello);
      } else {
        throw Exception("error");
      }
    } catch (e) {
      print(e);
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IP Info API Task"),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else if (snapshot.hasData) {
            return Column(
              children: [
                Text("IP: ${hello["ip"]}"),

              ],
            );
          } else {
            return Text("No data");
          }
        },
      ),
    );
  }
}
class go {
  String? ip;

  go({this.ip});

  go.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this.ip;
    return data;
  }
}