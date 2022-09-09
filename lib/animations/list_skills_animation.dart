import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class SlideAnimation1 extends StatelessWidget {
  final int index;
  final String skill;
  double w;

  SlideAnimation1(
      {Key? key,
      required this.index,
      required this.w,
      required this.skill,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 500),
      columnCount: 2,
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 900),
        curve: Curves.fastLinearToSlowEaseIn,
        scale: 1.5,
        child: FadeInAnimation(
          child: Container(
            margin: EdgeInsets.only(
                bottom: w / 30, left: w / 60, right: w / 60),
            decoration: BoxDecoration(
              color: Colors.primaries[index],
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 40,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Center(
              child: Text(skill,style: const TextStyle(color: Colors.white,fontSize: 20,),textAlign: TextAlign.center,),
            ),
          ),
        ),
      ),
    );
  }
}
/// From  Flutter Animation gallery
