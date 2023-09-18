import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WriteController extends GetxController {

  static WriteController get to => Get.find();

  final textController = TextEditingController();
  Map title = {
    'lunge' : '런지',
    'squad' : '스쿼트',
    'pushup' : '푸시업',
    'legraises' : '레그 레이즈'
  };

}