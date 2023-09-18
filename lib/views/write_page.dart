
import 'package:fittrix/components/image_data.dart';
import 'package:fittrix/viewModels/write_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePage extends GetView<WriteController> {
  const WritePage({
    Key? key,
    required this.menuName
  }) : super(key: key);

  final String menuName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(controller.title[menuName], style: TextStyle(fontSize: 16, color: Colors.black)),
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ImageData(IconsPath[menuName], width: 500),
            const SizedBox(height: 20),
            TextField(
              controller: controller.textController,
              decoration: const InputDecoration(
                  hintText: '상태메세지'
              ),
            )
          ],
        ),
      ),
    );
  }
}
