import 'package:flutter/material.dart';

class ScreenSize extends ChangeNotifier {
  int screenCount = 2;
  int get counter => screenCount;

  void getTheSize(int i) {
    screenCount = i;
  }
}
