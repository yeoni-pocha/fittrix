import 'dart:io';

import 'package:fittrix/components/message_popup.dart';
import 'package:fittrix/viewModels/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

enum PageName{HOME, WRITE, RECORD, LOGIN}

class MainController extends GetxController {

  @override
  void dispose() {
    videoController?.dispose();
    super.dispose();
  }

  static MainController get to => Get.find();

  final loginController = LoginController.to;

  RxInt pageIndex = 0.obs;
  List<int> bottomHistory = [0];
  String? menuName;
  VideoPlayerController? videoController;

  Future<void> changeBottomNav(int value, {bool hasGesture = true}) async {
    var page = PageName.values[value];
    switch (page) {
      case PageName.HOME:
        _changePage(value, hasGesture: hasGesture);
        break;
      case PageName.WRITE:
        if(isLoginCheck()) {
          if(hasGesture) {
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
          }
          _changePage(value, hasGesture: hasGesture);
          videoController?.pause();
        }
        break;
      case PageName.RECORD:
        if(isLoginCheck()) {
          _changePage(value, hasGesture: hasGesture);
          videoController?.pause();
        }
        break;
      case PageName.LOGIN:
        _changePage(value, hasGesture: hasGesture);
        videoController?.pause();
        break;
    }

  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if(!hasGesture) return;
    if(bottomHistory.last != value) {
      bottomHistory.add(value);
    }
    update();
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