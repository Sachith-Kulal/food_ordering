import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../domain/core/status_types.dart';

class CustomTextFormFieldView extends GetView {
  const CustomTextFormFieldView({Key? key,
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
    this.obscureText = false,
    this.textInputType,
    this.isStrongPassword = false,
    this.textFormFieldStatus,
    this.oldPassword})
      : super(key: key);
  final String labelText, hintText;
  final String? oldPassword;
  final TextEditingController textEditingController;
  final bool obscureText, isStrongPassword;
  final TextInputType? textInputType;
  final TextFormFieldStatus? textFormFieldStatus;

  @override
  Widget build(BuildContext context) {
    RxBool passwordVisibility = obscureText.obs;
    return Obx(() {
      return TextFormField(
        controller: textEditingController,
        obscureText: passwordVisibility.value,
        // maxLines: null,
        keyboardType: textInputType,
        decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: textFormFieldStatus == TextFormFieldStatus.newPassword ||
              textFormFieldStatus == TextFormFieldStatus.confirmPassword ||
              textFormFieldStatus == TextFormFieldStatus.password ? InkWell(
              onTap: () {
                passwordVisibility.toggle();
              },
          focusNode: FocusNode(skipTraversal: true),
          child:  Icon(
            passwordVisibility.value
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: const Color(0xFF57636C),
            size: 20,
          ),
        ): null
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '$labelText is required.';
          }

          switch (textFormFieldStatus) {
            case TextFormFieldStatus.newPassword:
              if (value.length >= 8 &&
                  value.contains(RegExp(r'[a-zA-Z]')) &&
                  value.contains(RegExp(r'[0-9]')) &&
                  value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'))) {
                break;
              }
              return "The password provided is too weak.";
            case TextFormFieldStatus.emailAddress:
              if (!GetUtils.isEmail(value)) {
                return 'Please enter a valid email.';
              }
              break;

            case TextFormFieldStatus.confirmPassword:
              if (oldPassword != value) {
                return "Passwords don't match!.";
              }
              break;
            default:
          }
          return null; // Return null for no validation error
        },

      );
    }
    );
  }
}
