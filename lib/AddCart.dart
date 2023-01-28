import 'package:flutter/material.dart';
import 'package:mashood/sqlhelpeer.dart';
import 'package:provider/provider.dart';
import 'Payment.dart';
import 'Provide.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  DBProductManager dbProductManager=DBProductManager();
  late List<Product2> plist;

  get width => null;


  void _naviToPayment(BuildContext context) {
    Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const Payment()));
  }
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Badgeint>(context);
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


    return Scaffold(
      key: _scaffoldKey,
      body: Column(
        children: [
          SizedBox(
            height: 400,
            width: MediaQuery.of(context).size.width,
            child:  FutureBuilder(
            future: dbProductManager.getProductList(),
    builder: (context, snapshot) {
    if (snapshot.hasData) {
    plist = snapshot.data as List<Product2>;
    return ListView.builder(
    shrinkWrap: true,
    itemCount: plist == null ? 0 : plist.length,
    itemBuilder: (BuildContext context, int index) {
    Product2 st = plist[index] as Product2;
    return Card(
    child: Row(
    children: <Widget>[
    Padding(
    padding: EdgeInsets.all(16.0),
    child: SizedBox(
    width: width * 0.50,
    child: Column(
    children: <Widget>[
    Text('ID: ${st.id}'),
    Text('Name: ${st.name}'),
    Text('category: ${st.category}'),
    ],
    ),
    ),
    ),
    SizedBox(
    height: 50,
    width: 400,
    child:

    Column(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder( //to set border radius to button
    borderRadius: BorderRadius.circular(30),
    )
    ),
    onPressed: (){
    _naviToPayment(context);
    }, child: Text('CheckOut')

    ),
    ],
    ),
    )
    ]
    )
    );
    },
    );
    }else{
    return CircularProgressIndicator();}
    }
      ),
      )
    ]
      ),
         );
  }

}


