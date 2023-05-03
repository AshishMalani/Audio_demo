import 'package:get/get.dart';

import '../controllers/practices_screen_controller.dart';

class PracticesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PracticesScreenController>(
      () => PracticesScreenController(),
    );
  }
}
