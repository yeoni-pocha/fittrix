import 'package:fittrix/controller/fittrix_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<FittrixController>(FittrixController());
  }
}