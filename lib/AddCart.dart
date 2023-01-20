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
      body: Container(
        child: Card(
         child: SizedBox(
           height: 100,
           width: MediaQuery.of(context).size.width,
           child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: SizedBox(
                      width:70,child: Image.asset("assets/images/ff.jpg")),
                ),
                Container(
                  width: MediaQuery.of(context).size.width-110,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    fit: StackFit.expand,
                    children:
                        [
                        const Positioned(
                            top: 10,
                            left: 10,
                            child: SizedBox(width:200,child: Text("dog food",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),))),
                        Positioned(
                          bottom: 10,
                          left: 10,
                          child: Container(height: 17,
                            width: 55,
                            child: Center(child: Text('1.0 kg')),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(
                                    width: .5, color: Color(
                                    0xffa4a4a4)),
                                borderRadius: BorderRadius
                                    .circular(8.0)
                            ),
                          ),
                        ),
                          Positioned(
                            top: 10,
                              right: 10,
                              child: SizedBox(
                                  width:24,child: IconButton(onPressed: (){}, icon:const Icon(Icons.delete) )))
                      ],
                    ),
                  ),
               ],
            ),
         ),
        ),
        ),
    );
  }
}
