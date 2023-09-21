import 'package:fittrix/service/fittrix_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  static LoginController get to => Get.find();

  final service = FittrixService();
  final textController = TextEditingController();
  RxString loginId = "".obs;

  Future<void> login() async {
    if(textController.text.isEmpty) {
      Fluttertoast.showToast(msg: "ID를 입력해주세요.");
      return;
    }
    if(textController.text == '12345') {
      service.login().then((value) {
        loginId.value = textController.text;
      });
    } else {
      Fluttertoast.showToast(msg: "ID가 존재하지 않습니다.");
    }
  }

}