import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mashood/AddCart.dart';
import 'package:mashood/HomePage.dart';
import 'package:mashood/Provide.dart';
import 'package:mashood/fav.dart';
import 'package:provider/provider.dart';

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
    var store = Provider.of<Badgeint>(context);
    store.increment();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
      actions: [Padding(
        padding: const EdgeInsets.all(10.0),
        child: Badge(
          child: Icon(Icons.shopping_cart, size: 40, color: Colors.white,),
          showBadge: store.count > 0,//icon style
          badgeContent: SizedBox(
              width: 20, height: 20, //badge size
              child:Center(  //aligh badge content to center
                child:
                Text(store.count.toString(), style: TextStyle(
                    color: Colors.white,  //badge font color
                    fontSize: 20 //badge font size
                )
                ),
              )
          ),
          badgeColor: Colors.purple, //badge background color
        ),
      )]
      ,leading: SizedBox(height: 50,width: 50,child: CircleAvatar(
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
