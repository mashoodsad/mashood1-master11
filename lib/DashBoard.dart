import 'package:flutter/material.dart';
import 'package:mashood/AddCart.dart';
import 'package:mashood/HomePage.dart';
import 'package:mashood/fav.dart';

import 'Person.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  void _navigateToAddCart(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) =>const AddCart()));
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
  @override
  List<Widget> mylist =[
    HomePage(),
    AddCart(),
    Fav(),
    Person(),
  ];
  int _index =0;


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(leading: SizedBox(height: 50,width: 50,child: CircleAvatar(
        child: IconButton(icon:Image.asset('assets/images/ff.jpg',fit: BoxFit.cover,), onPressed: (
            ) {
          _scaffoldKey.currentState!.openDrawer();
        },),
      ),)),
      drawer: Drawer(
        elevation: 20.0,
        child: ListView(
          children:  [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){_scaffoldKey.currentState!.closeDrawer();}, icon: Icon(Icons.arrow_back)),
                  Text('Drawer Header'),
                ],
              ),
            ),
            ListTile(
                title: const Text('Home'),
                onTap: (){
                  Navigator.pop(context);

                },
            ),
            ListTile(
              title: const Text('cart'),
              onTap: (){
                Navigator.pop(context);
                _navigateToAddCart(context);
              },
            ),
            ListTile(
              title: const Text('favorite'),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
      body:mylist[_index],
      bottomNavigationBar: Container(
    height: 60,
    decoration: BoxDecoration(
    color: Theme.of(context).primaryColor,
    borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),

    ),
    ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _index = 0;
                });
              },
              icon: _index == 0
                  ? const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _index = 1;
                });
              },
              icon: _index == 1
                  ? const Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _index = 2;
                });
              },
              icon: _index == 2
                  ? const Icon(
                Icons.favorite,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: 35,
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  _index = 3;
                });
              },
              icon: _index == 3
                  ? const Icon(
                Icons.person,
                color: Colors.white,
                size: 35,
              )
                  : const Icon(
                Icons.person_outline_outlined,
                color: Colors.white,
                size: 35,
              ),
            ),
          ],
        ),
    )
    );
  }
}
