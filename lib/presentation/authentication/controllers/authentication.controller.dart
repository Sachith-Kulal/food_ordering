import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/core/status_types.dart';
import '../../../infrastructure/navigation/routes.dart';
import '../../../infrastructure/theme/app_colors.dart';

class AuthenticationController extends GetxController with GetSingleTickerProviderStateMixin{
  //TODO: Implement AuthenticationController

  late final Rx<User?> firebaseUser;
  late TabController tabController;
  Rx<ButtonStatus> loginButton = ButtonStatus.enable.obs;
  Rx<ButtonStatus> singUpButton = ButtonStatus.enable.obs;
  final signUpForm = GlobalKey<FormState>();
  final signInForm = GlobalKey<FormState>();

   late TextEditingController emailAddressController;
   late TextEditingController  passwordController;
  late TextEditingController  nameController;
  late TextEditingController  emailAddressCreateController ;
  late TextEditingController  passwordCreateController;
  late TextEditingController  passwordConfirmController;


  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    emailAddressController = TextEditingController();
     passwordController = TextEditingController();
    nameController = TextEditingController();
     emailAddressCreateController = TextEditingController();
     passwordCreateController = TextEditingController();
    passwordConfirmController = TextEditingController();
  }
  Future<void>  signUp() async {
    singUpButton.value = ButtonStatus.loading;
    if(signUpForm.currentState!.validate()){
     try {
          final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailAddressCreateController.text.toString(),
            password: passwordCreateController.text.toString(),

          );
          await credential.user!.updateDisplayName(nameController.text.toString());
          Get.offAllNamed(Routes.HOME);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'weak-password') {
            Get.snackbar("Error", "The password provided is too weak.",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: AppColors.buttonColor,);
          } else if (e.code == 'email-already-in-use') {
            Get.snackbar("Error", "The account already exists for that email.",
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(milliseconds: 4000),
              backgroundColor: AppColors.buttonColor,);
          }
        } catch (e) {
          Get.snackbar("Error", e.toString(),
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: AppColors.buttonColor,);
        }

    }
    singUpButton.value = ButtonStatus.enable;
  }

  Future<void>  signIn() async {
    loginButton.value = ButtonStatus.loading;
    if(signInForm.currentState!.validate()){
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddressController.text.toString(),
          password: passwordController.text.toString(),

        );

        Get.offAllNamed(Routes.HOME);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.snackbar("Error", "No user found for that email.",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: AppColors.buttonColor);
        } else if (e.code == 'wrong-password') {
          Get.snackbar("Error", "Wrong password provided for that user.",
            snackPosition: SnackPosition.BOTTOM,
            duration: const Duration(milliseconds: 4000),
            backgroundColor: AppColors.buttonColor,);
        }
      } catch (e) {
        Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(milliseconds: 4000),
          backgroundColor: AppColors.buttonColor,);
      }
    }
    loginButton.value = ButtonStatus.enable;
  }




  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
