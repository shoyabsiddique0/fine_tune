import 'package:fine_tune/Pages/HomePage/RecentlyPlayedPage/recently_played_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/LibraryWidget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentlyPlayedScreen extends StatelessWidget {
  const RecentlyPlayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RecentlyPlayerController controller = Get.find<RecentlyPlayerController>();
    return Scaffold(
      backgroundColor: const Color(0xff1c1b1b),
      body: SingleChildScrollView(
        child: Column(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "These were played",
                        style: GoogleFonts.poppins(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: whiteColor.withOpacity(0.75)),
                      ),
                      Text(
                        "Recently",
                        style: GoogleFonts.poppins(
                            fontSize: 30.sp,
                            // fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                            color: whiteColor),
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
            Column(
                children: controller.recentPlayed.entries.map((e) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:
                        EdgeInsets.only(left: 24.w, right: 24.w, bottom: 20.h),
                    child: e.key.day == DateTime.now().day &&
                            e.key.month == DateTime.now().month &&
                            e.key.year == DateTime.now().year
                        ? Text(
                            "Today",
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: whiteColor),
                          )
                        : DateTime.now().subtract(Duration(hours: 24)).day ==
                                    e.key.day &&
                                DateTime.now()
                                        .subtract(Duration(hours: 24))
                                        .month ==
                                    e.key.month &&
                                DateTime.now()
                                        .subtract(Duration(hours: 24))
                                        .year ==
                                    e.key.year
                            ? Text(
                                "Yesterday",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: whiteColor),
                              )
                            : Text(
                                "${e.key.day}/${e.key.month}/${e.key.year}",
                                style: GoogleFonts.poppins(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: whiteColor),
                              ),
                  ),
                  Column(
                    children: e.value.map((e) => e).toList(),
                  ),
                  Center(
                    // padding: EdgeInsets.only(top: 10.h),
                    child: Text(
                      "View All",
                      style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: whiteColor),
                    ),
                  )
                ],
              );
            }).toList()),
            SizedBox(
              height: 160.h,
            )
          ],
        ),
      ),
    );
  }
}
