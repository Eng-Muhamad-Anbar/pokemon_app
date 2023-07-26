import 'package:get/get.dart';

import 'animations_controller.dart';

class AnimationsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AnimationsController(myName: Get.arguments));
  }
}
