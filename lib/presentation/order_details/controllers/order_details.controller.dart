import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/theme/app_colors.dart';

class OrderDetailsController extends GetxController {
  //TODO: Implement OrderDetailsController
  dynamic argumentData = Get.arguments;
  final RxInt count = 1.obs;
  final RxInt totalAmount = 0.obs;
  late  int price;
  late  String name,image;
  late String userName,userEmail;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment({required int price}) {
    count.value++;
    amount();
  }
  void discernment({required int price}) {
    if(count.value !=1){
      count.value--;
      amount();
    }

  }

  void amount() => totalAmount.value = count.value * price;

  getProductInfo(){
    User? user = FirebaseAuth.instance.currentUser;
    userName = user!.displayName?? "";
    userEmail = user.email!;

    image = argumentData["image"];
    price = argumentData["price"];
    name = argumentData["name"];
    amount();
  }

  order() {
    if (count.value > 2) {
      Get.snackbar(
        "Error",
        "",
        messageText: const Text(
          'out of stock',
          style: TextStyle(
            color: AppColors.primaryColor,
          ),
        ),
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(milliseconds: 4000),
        backgroundColor: AppColors.buttonColor,
      );
    } else {
    Get.offNamed(Routes.SUCESSFULL);
    }

  }
}
