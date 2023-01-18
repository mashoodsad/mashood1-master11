import 'package:flutter/material.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
        child:const Align(
            alignment: Alignment.topCenter,
            child: Text('Cart')))
    ,
    );
  }
}
