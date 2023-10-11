import 'package:flutter/material.dart';
import 'package:food_ordering/infrastructure/theme/app_colors.dart';

import 'package:get/get.dart';

import '../../domain/core/status_types.dart';
import 'controllers/authentication.controller.dart';
import 'views/custom_text_form_field_view.dart';

class AuthenticationScreen extends GetView<AuthenticationController> {
  const AuthenticationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        body: Column(
      children: [
        const SizedBox(height: 90,),
        Image.asset(
          'assets/images/png/logo.png',
          width: 150,
          height: 163,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(height: 30,),
        Expanded(
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.secondaryText,
                labelPadding: const EdgeInsetsDirectional.fromSTEB(24, 0, 24, 0),
                labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 18
                ),
                unselectedLabelStyle: const TextStyle(),
                indicatorColor: AppColors.buttonColor,
                tabs: const [
                  Tab(
                    text: 'Sign In',
                  ),
                  Tab(
                    text: 'Sign Up',
                  ),
                ],
                controller: controller.tabController,
              ),


              Expanded(
                  child: TabBarView(
                controller: controller.tabController,
                    children: [
                      Form(
                        key: controller.signInForm,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(44, 36, 44, 24),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomTextFormFieldView(
                                  textEditingController: controller.emailAddressController,
                                  labelText: 'Email Address',
                                  hintText: 'Enter your email',
                                  textInputType: TextInputType.emailAddress,
                                  textFormFieldStatus: TextFormFieldStatus.emailAddress,
                                ),
                                const SizedBox(height: 20,),
                                CustomTextFormFieldView(
                                  textEditingController: controller.passwordController,
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  textFormFieldStatus: TextFormFieldStatus.password,
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  children: [
                                    Expanded(child: Obx(() {
                                      return ElevatedButton(onPressed: controller.loginButton.value == ButtonStatus.enable ? (){
                                        controller.signIn();
                                      }: null, child: controller.loginButton.value == ButtonStatus.loading ? const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 5,
                                      ): const Text("Sign In"));
                                    }
                                    )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(44, 36, 44, 24),
                          child: Form(
                            key: controller.signUpForm,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                CustomTextFormFieldView(
                                  textEditingController: controller.nameController,
                                  obscureText: false,
                                  labelText: 'Name',
                                  hintText: 'Enter your name',
                                ),
                                const SizedBox(height: 20,),
                                CustomTextFormFieldView(
                                  textEditingController: controller.emailAddressCreateController,
                                  textInputType: TextInputType.emailAddress,
                                  obscureText: false,
                                  labelText: 'Email Address',
                                  hintText: 'Enter your email',
                                  textFormFieldStatus: TextFormFieldStatus.emailAddress,
                                ),
                                const SizedBox(height: 20,),
                                CustomTextFormFieldView(
                                  textEditingController: controller.passwordCreateController,
                                  obscureText: false,
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                  textFormFieldStatus: TextFormFieldStatus.newPassword,
                                ),
                                const SizedBox(height: 20,),
                                CustomTextFormFieldView(
                                  textEditingController: controller.passwordConfirmController,
                                  obscureText: false,
                                  labelText: 'Confirm Password',
                                  hintText: 'Enter Confirm Password',
                                  textFormFieldStatus: TextFormFieldStatus.confirmPassword,
                                  oldPassword: controller.passwordCreateController.text.toString(),
                                ),
                                const SizedBox(height: 30,),
                                Row(
                                  children: [
                                    Expanded(child: Obx(() {
                                      return ElevatedButton(onPressed: controller.singUpButton.value == ButtonStatus.enable ? (){
                                        controller.signUp();
                                      }: null, child: controller.singUpButton.value == ButtonStatus.loading ? const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 5,
                                      ): const Text("Sign Up"));
                                    }
                                    )),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
              )),

            ],
          ),
        )
      ],
    ));
  }
}
