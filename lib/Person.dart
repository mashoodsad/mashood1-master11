import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Person extends StatefulWidget {
  const Person({
    Key? key,
  }) : super(key: key);

  @override
  State<Person> createState() => _PersonState();
}

class _PersonState extends State<Person> {
  ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        child: Center(
            child: Text(
          'profile',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        )),
      ),
      Stack(
        children:[ Positioned(
          child:  SizedBox(
            child: image == null
                ? Container(
              child: const SizedBox(
                  height: 90, width: 90, child: CircleAvatar()),
            )
                : Image.file(File(image!.path)),
          )
        ),
       SizedBox(
            height: 30,
            width: 30,
            child: ElevatedButton(
              onPressed: () async {
                image = await picker.pickImage(source: ImageSource.gallery);
                setState(() {
                  //update UI
                });
              },
              child: const Icon(Icons.person_add_alt_rounded),
              style: ElevatedButton.styleFrom(
                  shape: CircleBorder(), padding: EdgeInsets.all(0.0)),
            ),
          ),
        ] ),
    ]);
  }
}
