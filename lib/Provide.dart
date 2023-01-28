import 'package:flutter/material.dart';
import 'package:mashood/prt.dart';

class Badgeint extends ChangeNotifier{
  int _count = 0;

  int get count => _count;
  void increment(){
    _count++;
    notifyListeners();
  }
}