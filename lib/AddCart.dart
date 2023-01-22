import 'package:flutter/material.dart';

class AddCart extends StatefulWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  State<AddCart> createState() => _AddCartState();
}

class _AddCartState extends State<AddCart> {
  List<Prt>Cardlist=[
    Prt(
      name: "Dog food",
     url: 'assets/images/ff.jpg'),
    Prt(
        name: "Cat food",
        url: 'assets/images/ff.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: Cardlist.length,
            itemBuilder: (BuildContext context,
                int index
        ){
              return Dismissible(
                  background: Container(
                    color: Colors.red,
                  ),
                  key: ValueKey(Cardlist[index].id.toString()),
                  direction: DismissDirection.endToStart,
                 // confirmDismiss: (direction){},
                  onDismissed: (DismissDirection direction){
                    setState(() {
                      Cardlist.removeAt(index);
                    });
                  },
                  child: Card(
                child: Row(
                  children: [Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: SizedBox(
                        width:70,child: Image.asset("${Cardlist[index].url}")
                    ),
                  ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width-110,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        fit: StackFit.expand,
                        children:
                        [
                          const Positioned(
                              top: 10,
                              left: 10,
                              child: SizedBox(width:200,child: Text("dog food",
                               // style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                              )
                              )
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Container(height: 17,
                              width: 55,
                              child: Center(child: Text('1.0 kg')),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(
                                      width: .5, color: Color(
                                      0xffa4a4a4)),
                                  borderRadius: BorderRadius
                                      .circular(8.0)
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: SizedBox(
                                  width:24,child: IconButton(onPressed: (){
                              }, icon:const Icon(Icons.delete) )))
                        ],
                      ),
                    ),],
                ),
              )
              );
            }
              ),
      ),
         );
  }
}

class Prt {
  late String name;
  late String url;
  Prt({required this.name,required this.url});

  get id => null;
}
