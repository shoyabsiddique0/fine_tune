import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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

  @override
  void onReady() {
    Get.bottomSheet(
        Container(
          padding: EdgeInsets.only(left: 24.w, right: 24.w),
          height: 180.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.w),
              color: Color(0xff1b1c1c)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(0xff3C1717),
                        child: SvgPicture.asset("assets/HomeAssets/update.svg"),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        "Update Available",
                        style: GoogleFonts.poppins(
                            fontSize: 15.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset("assets/HomeAssets/cross.svg"),
                  )
                ],
              ),
              Flexible(
                  child: Text(
                      "We recommend you to update the app to access new features",
                      style: GoogleFonts.poppins(
                          fontSize: 11.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w400))),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 1,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              fixedSize: Size.fromHeight(40.h),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.w))),
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: whiteColor),
                          ))),
                ],
              )
            ],
          ),
        ),
        elevation: 0,
        barrierColor: whiteColor.withOpacity(0.1));
    super.onReady();
  }
}
