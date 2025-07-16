// camera_screen.dart
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;

  Future<void> openCamera() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);
    if (picked != null) {
      setState(() {
        image = File(picked.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera")),
      body: Center(
        child: image == null
            ? Text("No image")
            : Image.file(image!, height: 300),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: openCamera,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}