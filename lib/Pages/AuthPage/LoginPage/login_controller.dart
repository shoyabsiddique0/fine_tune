import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/AuthWidget/update_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    Get.find<BottomNavigationController>().displayNav.value = false;
    super.onInit();
  }

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

  @override
  void onReady() {
    Get.find<BottomNavigationController>().displayNav.value = false;
    if (DateTime.now().compareTo(DateTime(2023, 8, 17)) >= 0) {
      Get.bottomSheet(const UpdatePopUp(),
          isDismissible: false,
          elevation: 0,
          barrierColor: whiteColor.withOpacity(0.1));
    }
    super.onReady();
  }
}
