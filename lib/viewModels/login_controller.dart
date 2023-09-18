import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  static LoginController get to => Get.find();

  final textController = TextEditingController();
  RxString loginId = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> login() async {
    if(textController.text.isEmpty) {
      Fluttertoast.showToast(msg: "ID를 입력해주세요.");
      return;
    }
    // TODO API 연동
    if(textController.text == '12345') {
      loginId.value = textController.text;
    } else {
      Fluttertoast.showToast(msg: "ID가 존재하지 않습니다.");
    }
  }

}