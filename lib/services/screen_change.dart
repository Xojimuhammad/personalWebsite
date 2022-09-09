import 'package:flutter/material.dart';

class ScreenChange extends StatelessWidget {
  final Widget phoneScreen;
  final Widget tabletScreen;
  final Widget webScreen;
  int index;

  ScreenChange(
      {Key? key,
      required this.index,
      required this.phoneScreen,
      required this.tabletScreen,
      required this.webScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (index <= 2) {
      return phoneScreen;
    } else if (index <= 4) {
      return tabletScreen;
    } else {
      return webScreen;
    }
  }
}
