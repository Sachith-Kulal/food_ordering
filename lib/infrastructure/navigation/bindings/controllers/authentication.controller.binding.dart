import 'package:get/get.dart';

import '../../../../presentation/authentication/controllers/authentication.controller.dart';

class AuthenticationControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthenticationController>(
      () => AuthenticationController(),
    );
  }
}
