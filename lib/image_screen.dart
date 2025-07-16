import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'home page.dart';



class ImagePage extends StatefulWidget {
  @override
  State<ImagePage> createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {
  File? imageFile;

  Future<void> pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);
    if (picked != null) {
      setState(() => imageFile = File(picked.path));
    }
  }

  void toggleTheme() {


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Page"),

      ),
      body: Center(
        child: imageFile == null
            ? Text("No image selected")
            : Image.file(imageFile!, width: 300, height: 300),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "cam",
            onPressed: () => pickImage(ImageSource.camera),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            heroTag: "gallery",
            onPressed: () => pickImage(ImageSource.gallery),
            child: Icon(Icons.photo),
          ),
        ],
      ),
    );
  }
}