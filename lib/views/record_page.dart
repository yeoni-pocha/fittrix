import 'package:fittrix/components/image_data.dart';
import 'package:fittrix/viewModels/record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fittrix/model/record.dart';

class RecordPage extends GetView<RecordController> {
  const RecordPage({Key? key}) : super(key: key);

  Widget recoredCard(Record record) {
    return Card(
      color: const Color(0xffE2E8F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: const BorderSide(width: 1, color: Color(0xffE2E8F0)),
      ),
      child: Column(
        children: [
          Container(
              width: Get.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Text(record.regDate ?? '')
          ),
          Container(
              width: Get.width,
              color: Colors.white,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(12),
              child: Text(record.statusMsg ?? '')
          )
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('운동기록보기', style: TextStyle(fontSize: 16, color: Colors.black)),
        centerTitle: true,
        leading: Transform.translate(
          offset: const Offset(0, 0),
          child: IconButton(
            icon: ImageData(IconsPath['left']),
            iconSize: 28,
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: controller.recordList.isNotEmpty ? ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: controller.recordList.length,
        itemBuilder: (context, i) {
          return recoredCard(controller.recordList[i]);
        }
      ) : const Center(child: Text('운동 기록이 없습니다.'))
    );
  }
}
