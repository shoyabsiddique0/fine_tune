import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  var nameController = TextEditingController().obs;
  var emailController = TextEditingController().obs;
  var phoneController = TextEditingController().obs;
  @override
  void onInit() {
    nameController.value.text = "Alice Wonder";
    emailController.value.text = "alicewonder12@gmail.com";
    phoneController.value.text = "7263528362";
    super.onInit();
  }
}
