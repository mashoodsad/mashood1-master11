import 'package:flutter/material.dart';
import 'package:mashood/sqlhelpeer.dart';

class Badgeint extends ChangeNotifier{
  int _count = 0;
  DBProductManager dbProductManager=DBProductManager();
  int get count => _count;
  Future<void> increment() async {
 List<Product2> p=await dbProductManager.getProductList();
 _count=p.length;
    notifyListeners();

  }
}