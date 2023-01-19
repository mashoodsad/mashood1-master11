import 'package:flutter/material.dart';
import 'package:mashood/HomePage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  List<Widget> mylist =[
    HomePage(),
    // About(),
    // favorite(),
  ];
  int index =(0);


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
                onTap: (){},
            ),
            ListTile(
              title: const Text('About'),
              onTap: (){},
            ),
            ListTile(
              title: const Text('favorite'),
              onTap: (){},
            )
          ],
        ),
      ),
      body:mylist[index],
    );
  }
}
