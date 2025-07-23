import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final TextEditingController _cityController = TextEditingController();
  Map<String, dynamic> weather = {};
  bool isLoading = false;

  Future<void> fetchWeather() async {
    final city = _cityController.text.trim();
    if (city.isEmpty) return;

    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=94d0003c9da942cd5cb1d42ce5e075d3");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      setState(() {
        weather = jsonDecode(response.body);
        isLoading = false;
      });
      _cityController.clear();
    } else {
      setState(() {
        weather = {};
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("City not found")),
      );
    }
  }

  String getTemp() {
    try {
      final tempK = weather["main"]["temp"];
      final tempC = double.parse(tempK.toString()) - 273.15;
      return "${tempC.toStringAsFixed(2)} °C";
    } catch (e) {
      return "null";
    }
  }

  String getHumidity() {
    try {
      return "${weather["main"]["humidity"]} %";
    } catch (e) {
      return "null";
    }
  }

  String getPressure() {
    try {
      return "${weather["main"]["pressure"]} hPa";
    } catch (e) {
      return "null";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent[100],
      appBar: AppBar(
        title: const Text("Weather API"),
        backgroundColor: Colors.indigo,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/img_1.png",
              fit: BoxFit.cover,
              color: Colors.white30,
              colorBlendMode: BlendMode.dstATop,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _cityController,
                  decoration: const InputDecoration(
                    hintText: "Enter city name",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: fetchWeather,
                  child: const Text("GET WEATHER"),
                ),
                const SizedBox(height: 20),
                if (isLoading)
                  const CircularProgressIndicator()
                else if (weather.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("City: ${weather["name"]}",
                          style: const TextStyle(fontSize: 24)),
                      const SizedBox(height: 10),
                      Text("Temperature: ${getTemp()}",
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text("Humidity: ${getHumidity()}",
                          style: const TextStyle(fontSize: 20)),
                      const SizedBox(height: 10),
                      Text("Pressure: ${getPressure()}",
                          style: const TextStyle(fontSize: 20)),
                    ],
                  )
                else
                  const Text("No data available"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



