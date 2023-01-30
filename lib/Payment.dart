import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String ? payment ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.arrow_back_outlined)),
                  const Text("Payments",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ],
              ),
    Column(
    children: <Widget>[
        Column(
          children: [

            RadioListTile(
              title: Text("UPI"),
              value: "UPI",
              groupValue: payment,
              onChanged: (value){
                setState(() {
                  payment = value.toString();
                });
              },
            ),

            RadioListTile(
              title: Text("Credit/Debit Card"),
              value: "Card",
              groupValue: payment,
              onChanged: (value){
                setState(() {
                  payment = value.toString();
                });
              },
            ),

            RadioListTile(
              title: Text("COD"),
              value: "COD",
              groupValue: payment,
              onChanged: (value){
                setState(() {
                  payment = value.toString();
                });
              },
            ),
            RadioListTile(
              title: Text("NetBanking"),
              value: "NetBanking",
              groupValue: payment,
              onChanged: (value){
                setState(() {
                  payment = value.toString();
                });
              },
            )

          ],
        )
     ])
            ],
          ),
        ),
      ),
    );
  }
}
