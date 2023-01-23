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
      const SizedBox(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'profile',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
          ),
        ),
      ),
      Row(
        children: [
          Stack(
            children:[ Positioned(
              child:  Padding(
                padding: const EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: SizedBox(
                    child: image == null
                        ? Container(
                      child: const SizedBox(
                          height: 90, width: 90, child: CircleAvatar()),
                    )
                        : Image.file(File(image!.path)),
                  ),
                ),
              )
            ),
           Padding(
             padding: const EdgeInsets.only(left: 65,top: 80),
             child: SizedBox(
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
           ),
            ] ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text("John xxxxxx",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text("joined 01/01/2022"),
              )
            ],
          )
        ],
      ),
    ]);
  }
}
