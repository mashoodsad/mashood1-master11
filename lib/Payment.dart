import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selected = "";
  List checkListItems = [
  {
  "id": 0,
  "title": "Cash on Delivary",
},
    {
      "id": 1,
      "value": false,
      "title": "Credit/Debit Card",
    },
    {
      "id": 2,
      "value": false,
      "title": "UPI",
    },
    {
      "id": 3,
      "value": false,
      "title": "NetBanking",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100,
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
              children: List.generate(
                checkListItems.length,
                    (index) => CheckboxListTile(
                  controlAffinity: ListTileControlAffinity.leading,
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: Text(
                    checkListItems[index]["title"],
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.black,
                    ),
                  ),
                  value: checkListItems[index]["value"],
                  onChanged: (value) {
                    setState(() {
                      for (var element in checkListItems) {
                        element["value"] = false;
                      }
                      checkListItems[index]["value"] = value;
                      selected =
                      "${checkListItems[index]["id"]}, ${checkListItems[index]["title"]}, ${checkListItems[index]["value"]}";
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 100.0),
            Text(
              selected,
              style: const TextStyle(
                fontSize: 22.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
