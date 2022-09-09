import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import '../platforms/mobile.dart';
import '../platforms/tablet.dart';
import '../platforms/web.dart';
import '../services/screen_change.dart';
import '../services/widget_size_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<String> list = [
    'Flutter & Dart',
    'Figma',
    'Unit Testing',
    'Rest Api',
    'Encryption',
    'Firebase',
    'Crashlytics',
    'Remote Config',
    'App Distribution',
    ' GetX, Provider,Bloc',
    'Hive',
    'Shared Preferance',
  ];
  late AnimationController controller;
  late VideoPlayerController videoPlayerController;
  final asset = 'assets/video/my_speech.mp4';

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(asset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((_) => videoPlayerController.pause());
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..forward();
  }

  @override
  void dispose() {
    controller.dispose();
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {


    return Consumer<ScreenSize>(
      builder: (context, model, child) {
        double h = MediaQuery.of(context).size.height;
        double w = MediaQuery.of(context).size.width;
        return Padding(
          padding: const EdgeInsets.all(10),
          child: ScreenChange(
            index: model.counter,

            /// Phone Screen
            phoneScreen: MobileScreen(controller: controller, list: list,),

            /// Tablet Screen
            tabletScreen: Tablet(controller: controller, list: list,),

            /// WebScreen
            webScreen: Web(controller: controller, list: list,),
          ),
        );
      },
    );
  }
}
