import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mashood/Provide.dart';
import 'package:provider/provider.dart';
import 'login.dart';
void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>Badgeint())
    ],
    child:  const MyApp()));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'login page',
      home: Scaffold(
        body: MyHome(),
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Bodyyy()


    );
  }
}
class Bodyyy extends StatelessWidget {
  const Bodyyy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    SizedBox(
      height:MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Image.asset('assets/images/ff.jpg',fit: BoxFit.cover,),);
  }
}
