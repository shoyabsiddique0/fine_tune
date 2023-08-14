import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class WatchlistCard extends StatelessWidget {
  final String title, imageLink, duration, left;
  final bool isDownloads;
  final void Function()? onTap;
  const WatchlistCard(
      {super.key,
      required this.title,
      required this.imageLink,
      required this.duration,
      required this.left,
      this.onTap,
      required this.isDownloads});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        margin: EdgeInsets.only(left: 24.w, right: 24.w),
        padding: EdgeInsets.only(bottom: 20.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(width: 80.w, height: 80.h, child: Image.asset(imageLink)),
            SizedBox(
              width: 15.w,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 5.h),
                // width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.poppins(
                                  fontSize: 12.5.w,
                                  fontWeight: FontWeight.w500,
                                  color: whiteColor),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            Text(
                              duration,
                              style: GoogleFonts.poppins(
                                  fontSize: 10.sp,
                                  color: whiteColor.withOpacity(0.5)),
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Get.find<BottomNavigationController>()
                                .displayNav
                                .value = false;
                            Get.bottomSheet(
                                Container(
                                  height: isDownloads ? 160.h : 140.h,
                                  padding: EdgeInsets.only(
                                      left: 24.w, right: 24.w, top: 20.w),
                                  color: const Color(0xff1b1c1c),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            title,
                                            style: GoogleFonts.poppins(
                                                color: whiteColor,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.find<
                                                      BottomNavigationController>()
                                                  .displayNav
                                                  .value = true;
                                              Get.back();
                                            },
                                            child: SvgPicture.asset(
                                                "assets/HomeAssets/cross.svg"),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 23.w,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/HomeAssets/like.svg",
                                            width: 18.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text(
                                            "Liked",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                color: whiteColor,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 16.w,
                                      ),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            "assets/HomeAssets/list.svg",
                                            width: 12.w,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          Text(
                                            isDownloads
                                                ? "Add to List"
                                                : "Add to List",
                                            style: GoogleFonts.poppins(
                                                fontSize: 14.sp,
                                                color: whiteColor,
                                                fontWeight: FontWeight.w400),
                                          )
                                        ],
                                      ),
                                      isDownloads
                                          ? SizedBox(
                                              height: 16.w,
                                            )
                                          : const SizedBox.shrink(),
                                      isDownloads
                                          ? Row(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/HomeAssets/trash.svg",
                                                  width: 15.w,
                                                  fit: BoxFit.fill,
                                                ),
                                                SizedBox(
                                                  width: 15.w,
                                                ),
                                                Text(
                                                  "Delete From Downloads",
                                                  style: GoogleFonts.poppins(
                                                      fontSize: 14.sp,
                                                      color: whiteColor,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                )
                                              ],
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                                isDismissible: false);
                          },
                          child: Container(
                            padding: EdgeInsets.only(
                                left: 10.w,
                                right: 10.w,
                                top: 10.h,
                                bottom: 10.h),
                            child: SizedBox(
                              height: 14.h,
                              width: 12.w,
                              child: SvgPicture.asset(
                                "assets/HomeAssets/option.svg",
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          left,
                          style: GoogleFonts.poppins(
                              fontSize: 12.sp,
                              color: whiteColor.withOpacity(0.75)),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
                          child: SizedBox(
                            height: 17.h,
                            width: 19.w,
                            child: SvgPicture.asset(
                              !isDownloads
                                  ? "assets/HomeAssets/download.svg"
                                  : "assets/HomeAssets/heart.svg",
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
