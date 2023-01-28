import 'dart:async';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mashood/AddCart.dart';
import 'package:mashood/prt.dart';
import 'package:mashood/sqlhelpeer.dart';

import 'CartPage.dart';
class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DBProductManager dbProductManager=DBProductManager();
  late FToast fToast;
  @override
  void initState() {
    super.initState();
    fToast = FToast();
    fToast.init(context);
  }
  Future<void> _showToast() async {
    Widget toast = Container(
      height: 100,
      padding: const EdgeInsets.symmetric(
          horizontal: 124.0, vertical: 120.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text("adding to cart......"),
        ],
      ),
    );
    fToast.showToast(
      child: toast,
      toastDuration: Duration(seconds: 1),
      gravity: ToastGravity.CENTER,
    ); // Custom Toast Position
  }
  List<Product> plist = [
    Product(name: "dog food",
        category: "food",
        price: 666.0,
        offerprice: 555.0,
        status: true,
        url: "https://picsum.photos/200/300"),
    Product(name: "dog food",
        category: "food",
        price: 66566.0,
        offerprice: 5854.0,
        status: false,
        url: "https://picsum.photos/200/300"),
    Product(name: "dog food",
        category: "food",
        price: 666.0,
        offerprice: 555.0,
        status: true,
        url: "https://picsum.photos/200/300"),
    Product(name: "dog food",
        category: "food",
        price: 666.0,
        offerprice: 555.0,
        status: true,
        url: "https://picsum.photos/200/300"),
    Product(name: "dog food",
        category: "food",
        price: 666.0,
        offerprice: 555.0,
        status: true,
        url: "https://picsum.photos/200/300"),
    Product(name: "dog food",
        category: "food",
        price: 666.0,
        offerprice: 555.0,
        status: true,
        url: "https://picsum.photos/200/300")
  ];

  void _naviAddCart(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AddCart()));
  }
  void _navitoCart(BuildContext context,) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => CartPage(url: "https://picsum.photos/200/300",
          name: 'dog food', )));
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: ListView(
              children: [
                CarouselSlider(options: CarouselOptions(height: 200.0),
                  items: [
                    Container(
                      height: 200,
                      margin: const EdgeInsets.all(8.0),
                      child: Image.network(
                        "https://picsum.photos/200/300", fit: BoxFit.cover,),
                    ),
                    Container(
                      height: 200,
                      margin: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/ff.jpg", fit: BoxFit.cover,),
                    ),
                  ]
                      .map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 5.0),
                            decoration: const BoxDecoration(
                                color: Color(0x6C80766B)
                            ),
                            child: Container(
                              height: 100,
                              margin: const EdgeInsets.all(2.0),
                              child: i,
                            )
                        );
                      },
                    );
                  }).toList(),
                ),
                Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: SizedBox(height: 200,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        child: Container(
                            height: 200,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: plist.length,
                                itemBuilder: (BuildContext context,
                                    int index) {
                                  return
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: 120,
                                          width: 120,
                                          child: Container(
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  '${plist[index].url}'),),
                                          )
                                      ),
                                    );
                                })))),

                SizedBox(height: 300,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10
                      ),
                      itemCount: plist.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(onTap: () {
                          _navitoCart(context);
                        },
                          child: Container(
                            height: 216,
                            decoration: BoxDecoration(
                                border: Border.all(width: .5, color: Color(
                                    0xffa4a4a4)),
                                borderRadius: BorderRadius.circular(10.0)
                            ),

                            child: Column(
                              children: [
                                Container(
                                  height: 108,
                                  child: Stack(
                                      children: [
                                        SizedBox(
                                            height: 108,
                                            width: MediaQuery
                                                .of(context)
                                                .size
                                                .width,
                                            child: Image.network(
                        '${plist[index].url}',
                                              fit: BoxFit.cover,)),
                                        Positioned(
                                            top: 10,
                                            right: 10,
                                            child: Container(height: 16,
                                              width: 32,
                                              child: Text('4.0'),
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  border: Border.all(
                                                      width: .5, color: Color(
                                                      0xffa4a4a4)),
                                                  borderRadius: BorderRadius
                                                      .circular(8.0)
                                              ),
                                            ))
                                      ]
                                  ),
                                ),
                                Text(plist[index].name),
                                SizedBox(
                                  height: 18, child: Row(children: [
                                  Text(plist[index].category,
                                    style: TextStyle(fontSize: 12),),
                                  Text(plist[index].status
                                      ? "instock"
                                      : "out of Stock", style: TextStyle(
                                      fontSize: 8, color: Colors.green))
                                ],),),
                                SizedBox(
                                  height: 23, child: Row(children: [
                                  Text(plist[index].offerprice.toString(),
                                    style: TextStyle(fontSize: 12),),
                                  Expanded(child: Text(
                                      plist[index].price.toString(),
                                      style: TextStyle(fontSize: 8,
                                          color: Colors.green,
                                          decoration: TextDecoration
                                              .lineThrough))),
                                  ElevatedButton(onPressed: () async {
                                    dbProductManager.insertProduct(Product2(name:plist[index].name ,
                                        category: plist[index].category,
                                        price: plist[index].price.toString()
                                        , offerprice: plist[index].offerprice.toString(),
                                        status: plist[index].status.toString(), url: plist[index].url));
                                    _showToast();

                                    Timer(
                                        const Duration(seconds: 1),
                                            (){
                                              _naviAddCart(context);
                                            });


                                  },
                                      child: Text("Add Cart",
                                        style: TextStyle(fontSize: 12),))
                                ],),)

                              ],
                            ),),
                        );
                      }
                  ),
                  // Grio.builder(itemCount: plist.length, itemBuilder: (BuildContext context, int index) {
                  //   return
                  //
                  //   );
                  // },
                  // )
                )
              ]),
        ),
      ),
      //bottomNavigationBar: const DashBoard(),

    );
  }
}








