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
                  }, icon: const Icon(Icons.arrow_back_outlined)),
                  const Text("Payments",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                ],
              ),
    Column(
    children: <Widget>[
        Stack(
          children: [
            Positioned(child: TopBar())
            ,Column(
            children: [

              RadioListTile(
                title: const Text("UPI",style: TextStyle(color: Colors.white),),
                value: "UPI",
                groupValue: payment,
                onChanged: (value){
                  setState(() {
                    payment = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: const Text("Credit/Debit Card",style: TextStyle(color: Colors.white)),
                value: "Card",
                groupValue: payment,
                onChanged: (value){
                  setState(() {
                    payment = value.toString();
                  });
                },
              ),

              RadioListTile(
                title: const Text("COD",style: TextStyle(color: Colors.white)),
                value: "COD",
                groupValue: payment,
                onChanged: (value){
                  setState(() {
                    payment = value.toString();
                  });
                },
              ),
              RadioListTile(
                title: const Text("NetBanking",style: TextStyle(color: Colors.white)),
                value: "NetBanking",
                groupValue: payment,
                onChanged: (value){
                  setState(() {
                    payment = value.toString();
                  });
                },
              )
            ],
          ),]
        )
     ])
            ],
          ),
        ),
      ),
    );
  }
}
Color colorOne = Colors.blue;
Color? colorTwo = Colors.blue[300];
Color? colorThree = Colors.blue[100];

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 350.0,
      ),
      painter: CurvePainter(),
    );
  }
}
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();


    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.10, size.height * 0.70, size.width * 0.17,
        size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.20, size.height, size.width * 0.25, size.height * 0.90);
    path.quadraticBezierTo(
        size.width * 0.40, size.height * 0.40, size.width * 0.50,
        size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.60, size.height * 0.85, size.width * 0.65,
        size.height * 0.65);
    path.quadraticBezierTo(
        size.width * 0.70, size.height * 0.90, size.width, 0);
    path.close();

    paint.color = colorThree!;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(
        size.width * 0.10, size.height * 0.80, size.width * 0.15,
        size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.20, size.height * 0.45, size.width * 0.27,
        size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(
        size.width * 0.55, size.height * 0.45, size.width * 0.75,
        size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorTwo!;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.10, size.height * 0.55, size.width * 0.22,
        size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.30, size.height * 0.90, size.width * 0.40,
        size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.52, size.height * 0.50, size.width * 0.65,
        size.height * 0.70);
    path.quadraticBezierTo(
        size.width * 0.75, size.height * 0.85, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();

    paint.color = colorOne;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}