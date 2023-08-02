import 'package:fine_tune/Pages/AuthPage/OtpPage/otp_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Theme/app_ratio.dart';
import 'package:fine_tune/Widgets/AuthWidget/cutom_button.dart';
import 'package:fine_tune/Widgets/AuthWidget/otp_text.dart';
import 'package:fine_tune/Widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    OtpController controller = Get.find<OtpController>();
    return Scaffold(
      body: Stack(children: [
        Background(),
        SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: height * 0.2, bottom: height * 0.1),
            height: height * 0.66,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "FINE TUNE",
                  style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 60.sp,
                      fontWeight: FontWeight.w600,
                      fontStyle: FontStyle.italic),
                ),
                Column(
                  children: [
                    Text(
                      "OTP Verification",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 35.w, right: 30.w),
                      // width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OtpText(
                            controller: controller.controller1,
                            hintText: "*",
                            inputType: TextInputType.number,
                            currNode: controller.node1,
                            nextNode: controller.node2,
                            prevNode: controller.node1,
                            isFilled: controller.isFilled1,
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          OtpText(
                            controller: controller.controller2,
                            hintText: "*",
                            inputType: TextInputType.number,
                            currNode: controller.node2,
                            nextNode: controller.node3,
                            prevNode: controller.node1,
                            isFilled: controller.isFilled2,
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          OtpText(
                            controller: controller.controller3,
                            hintText: "*",
                            inputType: TextInputType.number,
                            currNode: controller.node3,
                            nextNode: controller.node4,
                            prevNode: controller.node2,
                            isFilled: controller.isFilled3,
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          OtpText(
                            controller: controller.controller4,
                            hintText: "*",
                            inputType: TextInputType.number,
                            currNode: controller.node4,
                            nextNode: controller.node4,
                            prevNode: controller.node3,
                            isFilled: controller.isFilled4,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: EdgeInsets.only(right: 40.w),
                        child: Obx(
                          () => Text(
                            "${Duration(seconds: controller.start.value).toString().split(".")[0].split(":")[1]}:${Duration(seconds: controller.start.value).toString().split(".")[0].split(":")[2]}",
                            style: GoogleFonts.poppins(
                                color: whiteColor.withOpacity(0.5)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        width: 310.w,
                        height: 40.h,
                        child: CustomButton(
                          title: "Verify OTP",
                          func: () =>
                              Get.toNamed(AppRoute.bottomNavigationScreen),
                        )),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Didn't Recieve OTP?",
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Resend",
                          style: GoogleFonts.poppins(
                            color: controller.start.value == 0
                                ? primaryColor
                                : Colors.grey,
                            decoration: TextDecoration.underline,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        // Positioned(
        //   top: 160.h,
        //   right: 30.w,
        //   child: Text(
        //     "FINE TUNE",
        //     style: GoogleFonts.poppins(
        //         color: whiteColor,
        //         fontSize: 60.sp,
        //         fontWeight: FontWeight.w600,
        //         fontStyle: FontStyle.italic),
        //   ),
        // ),
        // Positioned(
        //     top: 330.h,
        //     left: 100.w,
        //     width: ScreenUtil.defaultSize.width,
        //     child: Text(
        //       "OTP Verification",
        //       style: GoogleFonts.poppins(
        //         color: Colors.white,
        //         fontSize: 18.sp,
        //         fontWeight: FontWeight.w500,
        //       ),
        //     )),
        // Positioned(
        //   top: 380.h,
        //   width: ScreenUtil.defaultSize.width,
        //   child: Container(
        //     margin: EdgeInsets.only(left: 35.w, right: 30.w),
        //     width: double.infinity,
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         OtpText(
        //           controller: controller.controller1,
        //           hintText: "*",
        //           inputType: TextInputType.number,
        //           currNode: controller.node1,
        //           nextNode: controller.node2,
        //           prevNode: controller.node1,
        //           isFilled: controller.isFilled1,
        //         ),
        //         OtpText(
        //           controller: controller.controller2,
        //           hintText: "*",
        //           inputType: TextInputType.number,
        //           currNode: controller.node2,
        //           nextNode: controller.node3,
        //           prevNode: controller.node1,
        //           isFilled: controller.isFilled2,
        //         ),
        //         OtpText(
        //           controller: controller.controller3,
        //           hintText: "*",
        //           inputType: TextInputType.number,
        //           currNode: controller.node3,
        //           nextNode: controller.node4,
        //           prevNode: controller.node2,
        //           isFilled: controller.isFilled3,
        //         ),
        //         OtpText(
        //           controller: controller.controller4,
        //           hintText: "*",
        //           inputType: TextInputType.number,
        //           currNode: controller.node4,
        //           nextNode: controller.node4,
        //           prevNode: controller.node3,
        //           isFilled: controller.isFilled4,
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
        // Positioned(
        //   // alignment: Alignment.centerRight,
        //   top: 440.h,
        //   right: 40.w,
        //   child: Obx(
        //     () => Text(
        //       "${Duration(seconds: controller.start.value).toString().split(".")[0].split(":")[1]}:${Duration(seconds: controller.start.value).toString().split(".")[0].split(":")[2]}",
        //       style: GoogleFonts.poppins(color: whiteColor.withOpacity(0.5)),
        //     ),
        //   ),
        // ),
        // Positioned(
        //     top: 520.h,
        //     left: 24.w,
        //     child: SizedBox(
        //         width: 310.w,
        //         height: 40.h,
        //         child: CustomButton(
        //           title: "Verify OTP",
        //           func: () => Get.toNamed(AppRoute.bottomNavigationScreen),
        //         ))),
        // Align(
        //     alignment: Alignment.center,
        //     // top: 580.h,
        //     // width: ScreenUtil.defaultSize.width,
        //     child: Padding(
        //       padding: EdgeInsets.only(top: 520.h),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Text(
        //             "Didn't Recieve OTP?",
        //             style: GoogleFonts.poppins(
        //               color: whiteColor,
        //               fontSize: 14.sp,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //           Text(
        //             "Resend",
        //             style: GoogleFonts.poppins(
        //               color: controller.start.value == 0
        //                   ? primaryColor
        //                   : Colors.grey,
        //               decoration: TextDecoration.underline,
        //               fontSize: 14.sp,
        //               fontWeight: FontWeight.w600,
        //             ),
        //           ),
        //         ],
        //       ),
        //     ))
      ]),
    );
  }
}
