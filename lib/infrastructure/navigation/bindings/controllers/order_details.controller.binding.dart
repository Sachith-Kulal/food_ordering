import 'package:get/get.dart';

import '../../../../presentation/order_details/controllers/order_details.controller.dart';

class OrderDetailsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(
      () => OrderDetailsController(),
    );
  }
}
