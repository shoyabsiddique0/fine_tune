import 'package:fine_tune/Pages/LibraryPage/library_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/HomeWidget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ListenNow extends StatelessWidget {
  const ListenNow({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryController controller = Get.find<LibraryController>();
    return ListView(
      // mainAxisSize: MainAxisSize.min,
      shrinkWrap: true,
      // physics: const NeverScrollableScrollPhysics(),
      children: [
        SizedBox(
          height: 30.h,
        ),
        Header(
            title: "Recently Played",
            child: SizedBox(
              height: 220.h,
              child: ListView.builder(
                  // padding: EdgeInsets.only(right: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: controller.recentList[index],
                    );
                  },
                  itemCount: controller.recentList.length),
            )),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 15.h),
          child: Divider(
            color: Color(0xff272626),
            thickness: 3.h,
            height: 3.h,
          ),
        ),
        Header(
            title: "Your Top Artist",
            child: SizedBox(
              height: 170.h,
              child: ListView.builder(
                  // padding: EdgeInsets.only(right: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w, top: 10.h),
                      child: Column(children: [
                        CircleAvatar(
                          radius: 65.r,
                          backgroundImage: Image.asset(
                            "assets/HomeAssets/artist.png",
                            fit: BoxFit.fill,
                          ).image,
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          "Elizeu Dias",
                          style: GoogleFonts.poppins(
                            color: whiteColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                    );
                  },
                  itemCount: controller.featuredList.length),
            )),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 15.h),
          child: Divider(
            color: Color(0xff272626),
            thickness: 3.h,
            height: 3.h,
          ),
        ),
        Header(
            title: "Featured Albums",
            child: SizedBox(
              height: 220.h,
              child: ListView.builder(
                  // padding: EdgeInsets.only(right: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: controller.featuredList[index],
                    );
                  },
                  itemCount: controller.featuredList.length),
            )),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 15.h),
          child: Divider(
            color: Color(0xff272626),
            thickness: 3.h,
            height: 3.h,
          ),
        ),
        Header(
            title: "Podcast",
            child: SizedBox(
              height: 220.h,
              child: ListView.builder(
                  // padding: EdgeInsets.only(right: 20.w),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(right: 12.w),
                      child: controller.recentList[index],
                    );
                  },
                  itemCount: controller.recentList.length),
            )),
        Padding(
          padding: EdgeInsets.only(left: 24.w, right: 24.w, bottom: 15.h),
          child: Divider(
            color: Color(0xff272626),
            thickness: 3.h,
            height: 3.h,
          ),
        ),
        SizedBox(
          height: 45.h,
        )
      ],
    );
  }
}
