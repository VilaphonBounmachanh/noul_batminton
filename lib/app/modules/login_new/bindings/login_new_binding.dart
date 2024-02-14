import 'package:get/get.dart';

import '../controllers/login_new_controller.dart';

class LoginNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginNewController>(
      () => LoginNewController(),
    );
  }
}
