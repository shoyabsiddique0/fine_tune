import 'package:carousel_slider/carousel_slider.dart';
import 'package:fine_tune/Pages/HomePage/home_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find<HomeController>();
    return Scaffold(
      backgroundColor: const Color(0xff1C1B1B),
      body: Column(
        children: [
          Container(
            height: 300.h,
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 40.h),
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff1C1B1B), Color(0xff0F4A81)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to",
                          style: GoogleFonts.poppins(
                              fontSize: 18.w,
                              fontWeight: FontWeight.w400,
                              color: whiteColor.withOpacity(0.75)),
                        ),
                        Text(
                          "FINE TUNE",
                          style: GoogleFonts.poppins(
                              fontSize: 32.w,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: whiteColor),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25.h),
                      width: 85.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            "assets/AuthAssets/time.svg",
                            height: 28.w,
                          ),
                          CircleAvatar(
                            radius: 18.w,
                            backgroundImage: const AssetImage(
                                "assets/AuthAssets/profile.png"),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 36.h,
                ),
                // Expanded(
                //     child: ListView.builder(
                //         scrollDirection: Axis.horizontal,
                //         // padding: EdgeInsets.only(right: 20.w, left: 20.w),
                //         itemCount: controller.carousel.length,
                //         itemBuilder: (context, index) {
                //           return Row(children: [
                //             controller.carousel[index],
                //             SizedBox(
                //               width: 10.w,
                //             )
                //           ]);
                //         }))
                Column(
                  children: [
                    SizedBox(
                      height: 120.h,
                      width: double.infinity,
                      child: CarouselSlider(
                          items: controller.carousel,
                          options: CarouselOptions(
                              viewportFraction: 0.45.w,
                              disableCenter: true,
                              enlargeFactor: 0.2,
                              height: 120.h,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              // pageSnapping: false,
                              initialPage: 0,
                              // aspectRatio: 0.5.w,
                              enableInfiniteScroll: false,
                              padEnds: false,
                              enlargeCenterPage: true)),
                    ),
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              controller.carousel.asMap().entries.map((entry) {
                            return GestureDetector(
                              onTap: () => controller.controller
                                  .animateToPage(entry.key),
                              child: Container(
                                width: 8.0.w,
                                height: 8.0.w,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0.w, horizontal: 3.0.h),
                                decoration: BoxDecoration(
                                    shape: controller.current.value == entry.key
                                        ? BoxShape.rectangle
                                        : BoxShape.circle,
                                    color: (Theme.of(context).brightness ==
                                                Brightness.dark
                                            ? const Color(0xff007AEA)
                                            : const Color(0xff007AEA))
                                        .withOpacity(controller.current.value ==
                                                entry.key
                                            ? 0.9
                                            : 0.4)),
                              ),
                            );
                          }).toList(),
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
