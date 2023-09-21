import 'package:fittrix/model/record.dart';
import 'package:fittrix/service/fittrix_service.dart';
import 'package:fittrix/viewModels/login_controller.dart';
import 'package:fittrix/viewModels/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class RecordController extends GetxController {

  static RecordController get to => Get.find();

  final service = FittrixService();
  final loginController = LoginController.to;
  final mainController = MainController.to;
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
    http.Response? response = await service.write();
    if(response != null) {
      Record record = Record(
          loginId: loginController.loginId.value,
          recordName: recordName,
          regDate: today,
          statusMsg: textController.text
      );
      recordList.insert(0, record);
      initRecordWrite();
      mainController.changeBottomNav(PageName.RECORD.index).then((value) => FocusManager.instance.primaryFocus?.unfocus());
    } else {
      Fluttertoast.showToast(msg: "운동이 기록되지 않았습니다. 다시 시도해주세요.");
    }
  }

  Future<List<Record>> getList() async {
    http.Response? response = await service.list();
    if(response != null) {
      return recordList;
    } else {
      return [];
    }
  }

}