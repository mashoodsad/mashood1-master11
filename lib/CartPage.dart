import 'package:flutter/material.dart';
//import 'prt.dart';
//import 'HomePage.dart';

class CartPage extends StatelessWidget {
 late String url,name;
    CartPage({Key? key,required this.url,required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(alignment: AlignmentDirectional.topCenter,
            child: Padding(
              padding:  EdgeInsets.only(top: 88,right: 40,left: 40),
              child: SizedBox(
                height: 224,
                width: 280,
                child: Container(
                  child: Image.network(url,fit: BoxFit.fill
                ),
    ),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(name,style: TextStyle(fontSize: 16),)),
            ),
          ),
          Container(
            child:const Padding(
              padding:  EdgeInsets.all(10.0),
              child:  Align(
                  alignment: Alignment.topLeft,
                  child: Text("Product Description",style: TextStyle(fontSize: 14),)),
            ),
          ),
          Container(
            child: const Padding(
              padding:  EdgeInsets.all(10.0),
              child: Text(""
                  "Kit Cat natural premium cat food was created by our "
                  "nutritionists who are also cat lovers and made with "
                  "the goodness of carefully selected natural ingredients"
                  " which contains no artificial colouring. Our Kit Cat "
                  "complete & balanced diet offers your cat a pH level "
                  "balance wholesome nutrition to support a healthy lifestyle."
                  " With selected quality meat containing essential vitamins, "
                  "our Kit Cat formula also has an optimal ration of omega- "
                  "to omega-6 fatty acids that promotes a healthy heart, skin "
                  "and coat for your cats. In addition, this diet contains "
                  "fructooligosaccharides which promotes a healthier digestive"
                  " track and taurine for healthy eyes."),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              child: ElevatedButton(onPressed: () {},
                  child: Text("Add Cart",
                    style: TextStyle(fontSize: 12),))
            ),
          ),
        ],
      ),
    );
  }
}
