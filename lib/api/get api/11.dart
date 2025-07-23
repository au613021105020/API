import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class vgrg extends StatefulWidget {
  const vgrg({super.key});

  @override
  State<vgrg> createState() => _vgrgState();
}

class _vgrgState extends State<vgrg> {
  Map<String, dynamic> hello = {};

  Future<go> getData() async {
    try {
      var apiResponse = await http.get(
        Uri.parse("https://official-joke-api.appspot.com/random_joke"),
      );
      hello = jsonDecode(apiResponse.body);
      if (apiResponse.statusCode == 200) {
        return go.fromJson(hello);
      } else {
        throw Exception("error");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Joke API")),
      body: Center(
        child: FutureBuilder<go>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Type: ${hello["type"]}"),
                  Text("Setup: ${hello["setup"]}"),
                  Text("Punchline: ${hello["punchline"]}"),
                  Text("ID: ${hello["id"].toString()}"),
                ],
              );
            } else {
              return Text("No data");
            }
          },
        ),
      ),
    );
  }
}
class go {
  String? type;
  String? setup;
  String? punchline;
  int? id;

  go({this.type, this.setup, this.punchline, this.id});

  go.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    setup = json['setup'];
    punchline = json['punchline'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['setup'] = this.setup;
    data['punchline'] = this.punchline;
    data['id'] = this.id;
    return data;
  }
}