import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Userimage extends StatefulWidget {
  const Userimage({Key? key, required this.onpickimage}) : super(key: key);
  final Function(File filepickimage) onpickimage;

  @override
  State<Userimage> createState() => _UserimageState();
}

class _UserimageState extends State<Userimage> {
  File? pickimagefile;

  void pickimage() async {
    final XFile? pickedimage = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 150, imageQuality: 60);
    if (pickedimage == null) {
      return;
    }
    setState(() {
      pickimagefile = File(pickedimage.path);
    });
    widget.onpickimage(pickimagefile!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Color(0xff14222e).withOpacity(0.7),
          child: CircleAvatar(
            backgroundColor: Color(0xff14222e),
            radius: 25,
            child: Image.asset("assets/image/avatar.png"),
          ),
          foregroundImage:
              pickimagefile == null ? null : FileImage(pickimagefile!),
        ),
        TextButton.icon(
            onPressed: pickimage,
            icon: Icon(Icons.image),
            label: Text("Add image"))
      ],
    );
  }
}
