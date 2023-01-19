import 'package:flutter/material.dart';
import 'package:mashood/HomePage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
  @override
  List<Widget> mylist =[
    HomePage(),
    // About(),
    // favorite(),
  ];
  int _index =(0);


  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children:  [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
                title: const Text('Home'),
                onTap: (){
                  Navigator.pop(context);
                },
            ),
            ListTile(
              title: const Text('About'),
              onTap: (){
                Navigator.pop(context);
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
      bottomNavigationBar: BottomNavigationBar(
        items: const [BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
