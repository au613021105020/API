
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Imagepage extends StatefulWidget {
  final VoidCallback toggleTheme;
  Imagepage({required this.toggleTheme});

  @override
  _ImagepageState createState() => _ImagepageState();
}

class _ImagepageState extends State<Imagepage> {
  File? _image;

  void _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: source);
    if (picked != null) {
      setState(() => _image = File(picked.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (_image != null)
          Image.file(_image!, height: 200)
        else
          Container(height: 200, color: Colors.grey[300], child: Center(child: Text("No image"))),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.camera_alt),
              label: Text("Camera"),
              onPressed: () => _pickImage(ImageSource.camera),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.photo),
              label: Text("Gallery"),
              onPressed: () => _pickImage(ImageSource.gallery),
            ),
            IconButton(
              icon: Icon(Icons.brightness_6),
              onPressed: widget.toggleTheme,
              tooltip: "Toggle Theme",
            ),
          ],
        )
      ],
    );
  }
}