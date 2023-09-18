import 'package:fittrix/components/image_data.dart';
import 'package:fittrix/viewModels/record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordPage extends GetView<RecordController> {
  const RecordPage({Key? key}) : super(key: key);

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
      body: ListView.builder(
        padding:const EdgeInsets.all(8),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            color: Colors.yellow,
          );
        }
      )
    );
  }
}
