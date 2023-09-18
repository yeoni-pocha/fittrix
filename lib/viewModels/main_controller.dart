import 'dart:io';

import 'package:fittrix/components/message_popup.dart';
import 'package:fittrix/viewModels/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

enum PageName{HOME, WRITE, RECORD, LOGIN}
enum menuName{LUNGE, SQUAD, PUSHUP, LEGRAISES}

class MainController extends GetxController {

  static MainController get to => Get.find();

  final loginController = LoginController.to;
  final changePageUniqueId = UniqueKey().toString();

  int pageIndex = 0;
  List<int> bottomHistory = [0];
  String? menuName;

  Future<void> changeBottomNav(int value, {bool hasGesture = true}) async {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
        _changePage(value, hasGesture: hasGesture);
        break;
      case PageName.WRITE:
        if(isLoginCheck()) {
          menuName = await showMenu(
            context: Get.context!,
            position: const RelativeRect.fromLTRB(0.0, 1000.0, 1000.0, 0.0),
            items: <PopupMenuItem<String>>[
              PopupMenuItem<String>(child: Text('런치'), value: 'lunge'),
              PopupMenuItem<String>(child: Text('스쿼트'), value: 'squad'),
              PopupMenuItem<String>(child: Text('푸시업'), value: 'pushup'),
              PopupMenuItem<String>(child: Text('레그 레이즈'), value: 'legraises'),
            ],
          );
          update([changePageUniqueId]);
        }
        break;
      case PageName.RECORD:
        if(isLoginCheck()) {
          _changePage(value, hasGesture: hasGesture);
        }
        break;
      case PageName.LOGIN:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
    pageIndex = value;
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex = value;
    if(!hasGesture) return;
    if(bottomHistory.last != value) {
      bottomHistory.add(value);
    }
    update([changePageUniqueId]);
  }

  Future<bool> willPopAction() async {
    if(bottomHistory.length == 1) {
      showDialog(
          context: Get.context!,
          builder: (context) => MessagePopup(
            title: "시스템",
            message: "종료하시겠습니까?",
            okCallback: () {
              exit(0);
            },
            cancelCallback: Get.back,
          )
      );
      return true;
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }

  bool isLoginCheck() {
    if(loginController.loginId.isNotEmpty) {
      return true;
    } else {
      Fluttertoast.cancel();
      Fluttertoast.showToast(msg: "로그인이 필요합니다.");
      return false;
    }
  }

}