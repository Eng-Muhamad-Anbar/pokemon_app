import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimationsController extends GetxController {
  String myName;
  double height = 325;
  double width = 325;
  Color? color = Colors.blue[900];
  BorderRadius borderRadius = BorderRadius.zero;
  AnimationsController({
    required this.myName,
  });
  void applyAnimation(
      {required Color? color, required BorderRadius borderRadius}) {
    this.color = color;
    this.borderRadius = borderRadius;
    update(["Animation"]);
  }
}
