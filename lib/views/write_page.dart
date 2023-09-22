
import 'package:fittrix/components/image_data.dart';
import 'package:fittrix/viewModels/main_controller.dart';
import 'package:fittrix/viewModels/record_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WritePage extends GetView<RecordController> {
  const WritePage({
    Key? key,
    required this.menuName
  }) : super(key: key);

  final String menuName;

  @override
  Widget build(BuildContext context) {
    controller.initRecordWrite();
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(controller.title[menuName], style: const TextStyle(fontSize: 16, color: Colors.black)),
          centerTitle: true,
          leading: Transform.translate(
            offset: const Offset(0, 0),
            child: IconButton(
              icon: ImageData(IconsPath['left']),
              iconSize: 28,
              onPressed: () {
                MainController.to.changeBottomNav(PageName.HOME.index);
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(controller.today, style: TextStyle(fontSize: 16)),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controller.textController,
                      decoration: const InputDecoration(
                          hintText: '상태메시지'
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(onPressed: () => controller.save(controller.title[menuName]), child: const Text('저장'))
                ],
              ),
              const SizedBox(height: 20),
              ImageData(IconsPath[menuName], width: 500),
            ],
          ),
        ),
      ),
    );
  }
}
