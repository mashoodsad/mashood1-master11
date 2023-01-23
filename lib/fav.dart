
import 'package:flutter/material.dart';
import 'AddCart.dart';

class Fav extends StatefulWidget {
  const Fav({Key? key}) : super(key: key);

  @override
  State<Fav> createState() => _FavState();
}

class _FavState extends State<Fav> {

  List<WPrt>Wishlist = [
    WPrt(
      name: "Dog food",
      url: 'assets/images/ff.jpg',
      subname: "Dog care",
      price: 999,
    ),
    WPrt(
      name: "Cat food",
      url: 'assets/images/ff.jpg',
      subname: "Cat care",
      price: 959,),
  ];

  void _naviAddCart(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AddCart()));
  }
    @override
    build(BuildContext context)  {
      return Scaffold(
          body:
          Column(
            children: [
              const SizedBox(child: Center(child: Text(
                'Wish List', style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 33),)),),
              SizedBox(height: 250,
                child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10
                    ),
                    itemCount: Wishlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(onTap: () {},
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
                                          height: 90,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          child: Image.asset(
                                            '${Wishlist[index].url}',
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
                              Text(Wishlist[index].name),
                              SizedBox(
                                height: 18, child: Row(children: [
                                Text(Wishlist[index].subname,
                                  style: TextStyle(fontSize: 12),),
                              ],),),
                              SizedBox(
                                height: 23, child: Row(children: [
                                Text('${Wishlist[index].name}',
                                  style: TextStyle(fontSize: 12),),
                                Expanded(child: Text(
                                    Wishlist[index].price.toString(),
                                    style: TextStyle(fontSize: 8,
                                        color: Colors.green,
                                        decoration: TextDecoration
                                            .lineThrough))),
                                Text('${Wishlist[index].price.toString()}',
                                  style: TextStyle(fontWeight: FontWeight.bold,
                                      fontSize: 13),), ElevatedButton(onPressed:
                                    ()  {
                                        _naviAddCart(context);
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
              ),
            ],
          )
      );
    }
  }
class WPrt {
  late String name;
  late String url;
  late String subname;
  late int price;
  WPrt({required this.name,required this.url,required this.subname,required this.price});
}
