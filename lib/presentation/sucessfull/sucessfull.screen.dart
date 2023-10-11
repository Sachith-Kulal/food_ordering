import 'package:flutter/material.dart';
import 'package:food_ordering/infrastructure/theme/app_colors.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../infrastructure/navigation/routes.dart';
import 'controllers/sucessfull.controller.dart';

class SucessfullScreen extends GetView<SucessfullController> {
  const SucessfullScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Center(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/json/successfully.json',
                  width: 150,
                  height: 130,
                  fit: BoxFit.contain,
                  repeat: false,
                  animate: true,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Text(
                    'congrats',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Text(
                    'your order sucessfull',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
                const SizedBox(height: 15,),
                ElevatedButton(
                    onPressed: () {
                      Get.offAndToNamed(Routes.HOME);
                    },
                    child: const Text("Go Home")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
