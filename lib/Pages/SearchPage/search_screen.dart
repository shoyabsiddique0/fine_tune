import 'package:fine_tune/Pages/SearchPage/search_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Theme/app_ratio.dart';
import 'package:fine_tune/Widgets/LibraryWidget/custom_search_bar.dart';
import 'package:fine_tune/Widgets/SearchWidget/browse.dart';
import 'package:fine_tune/Widgets/SearchWidget/recent_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchScreenController controller = Get.find<SearchScreenController>();
    return Scaffold(
      backgroundColor: const Color(0xff1c1b1b),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160.h,
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
              // width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff1C1B1B), Color(0xff0F4A81)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Search",
                            style: GoogleFonts.poppins(
                                fontSize: 30.sp,
                                // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25.h),
                        // width: 85.w,
                        child: InkWell(
                          onTap: () => Get.toNamed(AppRoute.profileScreen),
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
                    // list: controller.sort,
                    // currentVal: controller.currentVal,
                    hint: "What do you want to listen to?",
                    hasSuffix: false,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Recent Searches",
                    style: GoogleFonts.poppins(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor,
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: controller.recentList
                          .map((element) => RecentSearch(
                                func: () =>
                                    controller.recentList.remove(element),
                                imageLink: element["image"]!,
                                subtitle: element["type"]!,
                                title: element["title"]!,
                              ))
                          .toList(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => controller.recentList.clear(),
                      child: Text(
                        "Clear Recent Searches",
                        style: GoogleFonts.poppins(
                            color: whiteColor, fontSize: 10.sp),
                      ),
                    ),
                  ),
                  Text(
                    "Browse what you like",
                    style:
                        GoogleFonts.poppins(color: whiteColor, fontSize: 13.sp),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15.w,
                        childAspectRatio: width / (height / 3.2),
                        mainAxisSpacing: 15.w),
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      Browse(),
                      Browse(),
                      Browse(),
                      Browse(),
                      Browse(),
                      Browse(),
                      Browse(),
                      Browse(),
                      Browse(),
                      Browse(),
                    ],
                  ),
                  SizedBox(
                    height: 180.h,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
