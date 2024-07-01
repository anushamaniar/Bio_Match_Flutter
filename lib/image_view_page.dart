import 'dart:io';
import 'package:flutter/material.dart';

class ImageViewPage extends StatelessWidget {
  final String imagePath;
  const ImageViewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Captured Image'),
      ),
      body: Center(
        child: Image.file(File(imagePath)),
      ),
    );
  }
}
