import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1b1b),
      body: Stack(children: [
        Container(
          height: 419.h,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff0009EA), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Image.asset("assets/AuthAssets/about_us_bg.png"),
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 24.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                  onTap: () => Get.back(),
                  child: SvgPicture.asset(
                    "assets/HomeAssets/prev.svg",
                    fit: BoxFit.scaleDown,
                  )),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Privacy Policy",
                style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 22.h,
              ),
              Text(
                "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"",
                style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 10.h),
              Text(
                "\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\"",
                style: GoogleFonts.poppins(
                    fontSize: 13.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
