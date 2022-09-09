import 'package:particles_flutter/particles_flutter.dart';
import 'package:flutter/material.dart';
class BackEffect extends StatelessWidget {
  late double w;
  late double h;

  BackEffect({Key? key, required this.h, required this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularParticle(
      width: w,
      height: h,
      awayRadius: w / 5,
      numberOfParticles: 150,
      speedOfParticles: 1.5,
      maxParticleSize: 7,
      particleColor: Colors.white.withOpacity(.7),
      awayAnimationDuration: const Duration(milliseconds: 600),
      awayAnimationCurve: Curves.easeInOutBack,
      onTapAnimation: true,
      isRandSize: true,
      isRandomColor: false,
      connectDots: true,
      enableHover: true,
      hoverColor: Colors.black,
      hoverRadius: 90,
    );
  }
}
/// From  Flutter Animation gallery
