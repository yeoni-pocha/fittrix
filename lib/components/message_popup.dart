
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePopup extends StatelessWidget {
  final String title;
  final String message;
  final Function()? okCallback;
  final Function()? cancelCallback;
  const MessagePopup({required this.title, required this.message, required this.okCallback, this.cancelCallback, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white
            ),
            width: Get.width * 0.7,
            child: Column(
              children: [
                Text(title, style: const TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(height: 7),
                Text(message, style: const TextStyle(fontSize: 16, color: Colors.black)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: okCallback, child: const Text('확인')),
                    const SizedBox(width: 10),
                    ElevatedButton(onPressed: cancelCallback, style: ElevatedButton.styleFrom(primary: Colors.grey), child: const Text('취소')),
                  ],
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
