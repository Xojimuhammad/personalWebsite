import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/widget_size_provider.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ScreenSize(),
      builder: (context, widget) {
        var provider = context.read<ScreenSize>();
        return LayoutBuilder(
          builder: (context, boxConstraints) {
            int crossAxisCount = boxConstraints.maxWidth ~/ 250;
            provider.getTheSize(crossAxisCount);
            return  const HomePage();
          },
        );
      },
    );
  }
}
