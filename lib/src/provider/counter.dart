import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _count = 0;
  int get counter => _count;

  void increment() {
    _count++;
    //es lo que va a escuchar que cada vez cambia el count
    notifyListeners();
  }
}
