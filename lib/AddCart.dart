import 'package:flutter/material.dart';
import 'package:mashood/sqlhelpeer.dart';
import 'Payment.dart';


class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  DBProductManager dbProductManager = DBProductManager();


  get width => null;

  get id => null;


  void _naviToPayment(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Payment()));
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      body: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height-250,
          width: MediaQuery.of(context).size.width,
          child: FutureBuilder(
              future: dbProductManager.getProductList(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                 var  plist = snapshot.data as List<Product2>;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: plist == null ? 0 : plist.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Product2 st = plist[index];

                      return Card(
                          child: Dismissible(
                            direction: DismissDirection.endToStart,
                            key: UniqueKey(),
                            onDismissed: (DismissDirection direction) {
                              dbProductManager.deleteProduct(st.id);
                              setState(() {
                                plist.removeAt(index);
                              });
                            },
                            background: const ColoredBox(
                              color: Colors.red,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(Icons.delete, color: Colors.white),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(children: <Widget>[
                        Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Row(
                                children: [
                                  SizedBox(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(st.url)),
                                  Column(
                                    children: <Widget>[
                                      Text('Name: ${st.name}'),
                                      Text('category: ${st.category}'),
                                    ],
                                  ),
                                     IconButton(onPressed: (){
                                       dbProductManager.deleteProduct(st.id);
                                       setState(() {
                                         plist.removeAt(index);
                                       });
                                    }, icon: const Icon(Icons.delete)),
                                ],
                              ),
                        ),
                      ]),
                            ),
                          ));
                    },
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ), Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    //to set border radius to button
                    borderRadius: BorderRadius.circular(30),
                  )),
              onPressed: () {
                _naviToPayment(context);
              },
              child: Text('CheckOut')),
        ),
      ]),
    );
  }
}


