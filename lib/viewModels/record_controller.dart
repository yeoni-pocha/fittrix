import 'package:fittrix/model/record.dart';
import 'package:fittrix/viewModels/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecordController extends GetxController {

  static RecordController get to => Get.find();

  final loginController = LoginController.to;
  final textController = TextEditingController();
  Map title = {
    'lunge' : '런지',
    'squad' : '스쿼트',
    'pushup' : '푸시업',
    'legraises' : '레그 레이즈'
  };

  late String today;
  List<Record> recordList = [];

  @override
  void onInit() {
    super.onInit();
    today = getToday();
  }

  void initRecordWrite() {
    today = getToday();
    textController.text = '';
  }

  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    return formatter.format(now);
  }

  Future<void> save(String recordName) async {
    if(textController.text.isEmpty) {
      Fluttertoast.showToast(msg: "상태메시지를 입력해주세요.");
      return;
    }
    // TODO API 연동
    Record record = Record(
      loginId: loginController.loginId.value,
      recordName: recordName,
      regDate: today,
      statusMsg: textController.text
    );
    recordList.add(record);
    initRecordWrite();
  }

}