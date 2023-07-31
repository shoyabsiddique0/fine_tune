import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Theme/app_ratio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreLikeThis extends StatelessWidget {
  const MoreLikeThis({super.key});

  @override
  Widget build(BuildContext context) {
    PlaylistController controller = Get.find<PlaylistController>();
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.w,
              crossAxisSpacing: 24.w,
              childAspectRatio: width / (height / 1.5)),
          itemCount: controller.moreList.length,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(controller.moreList[index]["imageLink"]!),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  controller.moreList[index]["title"]!,
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: whiteColor,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  controller.moreList[index]["episodes"]!,
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      color: whiteColor.withOpacity(0.8),
                      fontWeight: FontWeight.w400),
                ),
              ],
            );
          }),
    );
  }
}
