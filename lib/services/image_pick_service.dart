import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePick extends ChangeNotifier{
  Future getImage(ImageSource imgSource, BuildContext context) async {
    final img = await ImagePicker().pickImage(source: imgSource);
    if (img != null) {
      final image = File(img.path);

      //Process the image using ml model
    }
  }
}