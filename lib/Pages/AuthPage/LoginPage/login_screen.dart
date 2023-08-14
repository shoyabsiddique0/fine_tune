import 'package:fine_tune/Pages/AuthPage/LoginPage/login_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/AuthWidget/custom_text_input.dart';
import 'package:fine_tune/Widgets/AuthWidget/cutom_button.dart';
import 'package:fine_tune/Widgets/background.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find<LoginController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBody: true,
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //       gradient: LinearGradient(colors: [
          //     const Color(0xff007AEA).withOpacity(0.5),
          //     const Color(0xff052931)
          //   ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          //   height: double.infinity,
          //   width: double.infinity,
          // ),
          // Container(
          //   height: 378.h,
          //   decoration: BoxDecoration(
          //       backgroundBlendMode: BlendMode.plus,
          //       // image: DecorationImage(
          //       //   image: Image.asset(
          //       //     "assets/AuthAssets/Bg.png",
          //       //     fit: BoxFit.fitHeight,
          //       //     height: 800.h,
          //       //   ).image,
          //       // ),
          //       gradient: LinearGradient(colors: [
          //         const Color(0xff103035).withOpacity(0.45),
          //         Colors.transparent
          //       ], stops: const [
          //         0,
          //         0.3
          //       ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          //   child: Image.asset(
          //     "assets/AuthAssets/Bg.png",
          //     fit: BoxFit.fitHeight,
          //     colorBlendMode: BlendMode.softLight,
          //   ),
          // ),
          Background(),
          Positioned(
            top: 160.h,
            right: 30.w,
            child: Text(
              "FINE TUNE",
              style: GoogleFonts.poppins(
                  color: whiteColor,
                  fontSize: 60.sp,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Positioned(
            top: 350.h,
            child: SizedBox(
              width: 360.w,
              child: CustomTextInput(
                  prefix: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+91 | ",
                        style: GoogleFonts.poppins(
                            color: whiteColor.withOpacity(0.8),
                            fontWeight: FontWeight.w500,
                            fontSize: 14.sp),
                      ),
                    ],
                  ),
                  controller: controller.phoneController,
                  hintText: "Enter Your Mobile Number",
                  inputType: TextInputType.phone,
                  validateFunc: controller.validateMobile,
                  valText: controller.valMob),
            ),
          ),
          Positioned(
              top: 430.h,
              left: 24.w,
              child: SizedBox(
                  width: 310.w,
                  height: 40.h,
                  child: CustomButton(
                    title: "Send OTP",
                    func: () => Get.toNamed(AppRoute.otpScreen),
                  ))),
          Positioned(
            top: 500.h,
            left: 22.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 140.w,
                  child: Divider(
                    color: whiteColor.withOpacity(0.5),
                    thickness: 2,
                    height: 2,
                  ),
                ),
                Text(
                  " OR ",
                  style: GoogleFonts.poppins(
                      color: whiteColor.withOpacity(0.5), fontSize: 15.sp),
                ),
                SizedBox(
                  width: 140.w,
                  child: Divider(
                    color: whiteColor.withOpacity(0.5),
                    thickness: 2,
                    height: 2,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 540.h,
            left: 112.w,
            child: SizedBox(
              width: 130.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/AuthAssets/google.svg"),
                  SvgPicture.asset("assets/AuthAssets/facebook.svg"),
                ],
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              // top: 630.h,
              // left: 15.w,
              child: Padding(
                padding: EdgeInsets.only(bottom: 12.0.h),
                child: Text.rich(
                  TextSpan(
                      text: "By continuing you accept out ",
                      style: GoogleFonts.poppins(
                          color: whiteColor.withOpacity(0.5),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap =
                                () => Get.toNamed(AppRoute.privacyPolicyScreen),
                          text: "Privacy Policy",
                          style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                        TextSpan(
                            text: " and ",
                            style: GoogleFonts.poppins(
                                color: whiteColor.withOpacity(0.5),
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500)),
                        TextSpan(
                          text: "T&C",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => Get.toNamed(AppRoute.tncScreen),
                          style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ]),
                ),
              ))
        ],
      ),
    );
  }
}
