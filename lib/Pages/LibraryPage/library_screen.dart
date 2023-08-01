import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Pages/LibraryPage/library_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/LibraryWidget/custom_search_bar.dart';
import 'package:fine_tune/Widgets/LibraryWidget/downloads.dart';
import 'package:fine_tune/Widgets/LibraryWidget/liked.dart';
import 'package:fine_tune/Widgets/LibraryWidget/listen_now.dart';
import 'package:fine_tune/Widgets/LibraryWidget/podcast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryController controller = Get.find<LibraryController>();
    return Scaffold(
      backgroundColor: Color(0xff1c1b1b),
      body: DefaultTabController(
        length: 4,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180.h,
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
              // width: double.infinity,
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
                            "Welcome to your",
                            style: GoogleFonts.poppins(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                                color: whiteColor.withOpacity(0.75)),
                          ),
                          Text(
                            "Library",
                            style: GoogleFonts.poppins(
                                fontSize: 32.sp,
                                // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25.h),
                        // width: 85.w,
                        child: GestureDetector(
                          onTap: () => Get.find<BottomNavigationController>()
                              .libIndex
                              .value = 1,
                          child: CircleAvatar(
                            radius: 18.w,
                            backgroundImage: const AssetImage(
                                "assets/AuthAssets/profile.png"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CustomSearchBar(
                    controller: controller.searchEdit.value,
                    list: controller.sort,
                    currentVal: controller.currentVal,
                    hint: "Search Library",
                    hasSuffix: true,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              child: TabBar(
                controller: controller.tabController,
                tabs: [
                  SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: Center(
                        child: Text(
                      "Listen Now",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 60.w,
                    height: 30.h,
                    child: Center(
                      child: Text(
                        "Liked",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90.w,
                    height: 30.h,
                    child: Center(
                        child: Text(
                      "Downloads",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 90.w,
                    height: 30.h,
                    child: Center(
                        child: Text(
                      "Podcasts",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                ],
                isScrollable: true,
                indicatorColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                labelColor: whiteColor,
                indicator: BoxDecoration(
                  // color: Colors.yellow,
                  gradient: const LinearGradient(
                      colors: [Color(0xff007AEA), Color(0xff1b1c1c)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      tileMode: TileMode.decal,
                      stops: [0, 0.5]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.w),
                  ),
                  border: Border(
                    left: const BorderSide(width: 0, color: Color(0xff007AEA)),
                    right: const BorderSide(width: 0, color: Color(0xff007AEA)),
                    top: const BorderSide(width: 0, color: Color(0xff007AEA)),
                    bottom:
                        BorderSide(width: 2.w, color: const Color(0xff007AEA)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                  ListenNow(),
                  Liked(),
                  Downloads(),
                  Podcast(),
                ],
                // physics: NeverScrollableScrollPhysics(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
