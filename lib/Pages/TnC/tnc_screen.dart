import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TnCScreen extends StatelessWidget {
  const TnCScreen({super.key});

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
          child: Image.asset("assets/AuthAssets/privacy_policy_bg.png"),
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
                "T&C",
                style: GoogleFonts.poppins(
                    fontSize: 30.sp,
                    color: whiteColor,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 22.h,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Text(
                        "${index + 1}. Lorem ipsum dolor sit amet, consectetuer adipiscing elit dolor sit amet, consectetuer adipscing elit tamet, consectetuer adipiscing elit dolor sit amet, consectetuer adipscing elit ",
                        style: GoogleFonts.poppins(
                            fontSize: 13.sp,
                            color: whiteColor,
                            fontWeight: FontWeight.w400));
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
