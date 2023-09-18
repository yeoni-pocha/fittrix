import 'package:fittrix/viewModels/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final FocusScopeNode currentScope = FocusScope.of(context);
        if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: Obx(() => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: (controller.loginId.isEmpty) ? Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller.textController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(
                      hintText: '12345'
                  ),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: controller.login, child: const Text('로그인'))
            ],
          ) : Text('${controller.loginId} 님 로그인중입니다.')
        ),
      )),
    );
  }
}
