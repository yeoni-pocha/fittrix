import 'package:fittrix/viewModels/login_controller.dart';
import 'package:fittrix/viewModels/main_controller.dart';
import 'package:fittrix/viewModels/write_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(LoginController());
    Get.put<MainController>(MainController());
    Get.put<WriteController>(WriteController());
  }
}