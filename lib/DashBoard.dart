import 'package:flutter/material.dart';
import 'package:mashood/HomePage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  void _onItemTapped(int index) {
    setState(() {
      _index = index;
    });
  }
  @override
  List<Widget> mylist =[
    HomePage(),
    HomePage(),
    HomePage(),
    // About(),
    // favorite(),
  ];
  int _index =0;


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(leading: SizedBox(height: 20,width: 20,child: IconButton(icon:Image.asset('assets/images/ff.jpg',fit: BoxFit.fill,), onPressed: (
          ) {
        _scaffoldKey.currentState!.openDrawer();
      },),)),
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
