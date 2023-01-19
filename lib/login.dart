import 'package:flutter/material.dart';
import 'DashBoard.dart';
import 'NewScreen.dart';
import 'Singup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => NewScreen()));
  }

  void _navsignup(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => SingUp()));
  }
  void _naviHomePage(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => DashBoard()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone Number',
                  ),),),
              Container(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _navigateToNextScreen(context);
                    },
                    child: const Text('Forgot Password',),
                  ),
                ],
              ),

              Container(
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    child: const Text('Login'),
                    onPressed: () {
                      _naviHomePage(context);
                      print(nameController.text);
                      print(passwordController.text);
                    },
                  )
              ), Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('already have account?'),
                  TextButton(
                    child: const Text(
                      'sigin',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      _navsignup(context);
                    },
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }
}

