import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var phoneController = TextEditingController().obs;
  var valMob = "".obs;
  void validateMobile(String? value) {
    if (value!.isEmpty) {
      valMob.value = "";
    }
    if (value.length != 10) {
      valMob.value = 'Mobile Number must be of 10 digit';
    } else {
      valMob.value = "";
    }
  }
}
