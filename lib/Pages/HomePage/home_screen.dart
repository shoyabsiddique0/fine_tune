import 'package:carousel_slider/carousel_slider.dart';
import 'package:fine_tune/Pages/HomePage/home_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Theme/app_ratio.dart';
import 'package:fine_tune/Widgets/HomeWidget/category_view.dart';
import 'package:fine_tune/Widgets/HomeWidget/header.dart';
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
      backgroundColor: Color(0xff1c1b1b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.h,
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
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
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: whiteColor.withOpacity(0.75)),
                          ),
                          Text(
                            "FINE TUNE",
                            style: GoogleFonts.poppins(
                                fontSize: 32.sp,
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
                            GestureDetector(
                              onTap: () =>
                                  Get.toNamed(AppRoute.recentlyPlayedScreen),
                              child: SvgPicture.asset(
                                "assets/AuthAssets/time.svg",
                                height: 28.w,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoute.profileScreen),
                              child: CircleAvatar(
                                radius: 18.w,
                                backgroundImage: const AssetImage(
                                    "assets/AuthAssets/profile.png"),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 114.h,
                        width: double.infinity,
                        child: CarouselSlider(
                            items: controller.carousel,
                            options: CarouselOptions(
                                viewportFraction: width / (height / 0.55),
                                disableCenter: true,
                                enlargeFactor: width / (height / 0.25),
                                // height: 120.h,
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
                                // pageSnapping: false,
                                initialPage: 0,
                                onPageChanged: (index, reason) {
                                  controller.current.value = index;
                                },
                                // aspectRatio: 0.5.w,
                                enableInfiniteScroll: false,
                                padEnds: false,
                                enlargeCenterPage: true)),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Obx(() => Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: controller.carousel
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                onTap: () => controller.controller
                                    .animateToPage(entry.key),
                                child: Container(
                                  width: 8.0.w,
                                  height: 8.0.h,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0.h, horizontal: 3.0.w),
                                  decoration: BoxDecoration(
                                      shape:
                                          controller.current.value == entry.key
                                              ? BoxShape.rectangle
                                              : BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? const Color(0xff007AEA)
                                              : const Color(0xff007AEA))
                                          .withOpacity(
                                              controller.current.value ==
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
            ),
            Container(
              height: 160.h,
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              child: GridView(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 24.w,
                    mainAxisSpacing: 24.w,
                    childAspectRatio: width / (height / 4.8)),
                children: const [
                  CategoryView(),
                  CategoryView(),
                  CategoryView(),
                  CategoryView(),
                ],
              ),
            ),
            Header(
                title: "Continue Listening",
                child: SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                      // padding: EdgeInsets.only(right: 20.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: controller.continueList[index],
                        );
                      },
                      itemCount: controller.continueList.length),
                )),
            Header(
                title: "Featured Album",
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
            Header(
                title: "Trending Podcast",
                child: SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                      // padding: EdgeInsets.only(right: 20.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: controller.trendingList[index],
                        );
                      },
                      itemCount: controller.trendingList.length),
                )),
            Header(
                title: "Top Episodes",
                child: SizedBox(
                  height: 220.h,
                  child: ListView.builder(
                      // padding: EdgeInsets.only(right: 20.w),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(right: 12.w),
                          child: controller.topList[index],
                        );
                      },
                      itemCount: controller.topList.length),
                )),
            SizedBox(
              height: 55.h,
            ),
          ],
        ),
      ),
    );
  }
}
