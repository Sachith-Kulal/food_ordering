import 'package:get/get.dart';

import '../../../../presentation/sucessfull/controllers/sucessfull.controller.dart';

class SucessfullControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SucessfullController>(
      () => SucessfullController(),
    );
  }
}
