import 'package:flutter/material.dart';

class Itemcounter with ChangeNotifier {
  double counter = 1;
  double finalprice = 0;
  bool isAddedtoCart = false;
  List addeditems = [];
  int globalindex = 0;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void initialisefirstprice(double initialprice) {
    finalprice = initialprice;
  }

  void incrementingprice(double initialprice) {
    finalprice = finalprice + initialprice;

    notifyListeners();
  }

  void decrementingprice(double initialprice) {
    if (initialprice != finalprice) {
      finalprice = finalprice - initialprice;
      notifyListeners();
    }
  }

  void decrementCounter() {
    if (counter > 1) {
      counter--;
      notifyListeners();
    }
  }
}
