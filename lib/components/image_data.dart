import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageData extends StatelessWidget {
  final String icon;
  final double? width;
  const ImageData(this.icon, {this.width=55, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(icon, width: width! / Get.mediaQuery.devicePixelRatio);
  }
}

Map IconsPath = {
  'lunge' : 'assets/images/lunge.PNG',
  'squad' : 'assets/images/squad.png',
  'pushup' : 'assets/images/pushup.jpg',
  'legraises' : 'assets/images/legraises.jpg',
  'left' : 'assets/images/angle-small-left.png'
};