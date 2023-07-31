import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Theme/app_ratio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CastCrew extends StatelessWidget {
  const CastCrew({super.key});

  @override
  Widget build(BuildContext context) {
    PlaylistController controller = Get.find<PlaylistController>();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.w,
          crossAxisSpacing: 10.w,
          childAspectRatio: width / (height / 1.8)),
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              backgroundImage:
                  Image.asset(controller.castList[index]["imageLink"]!).image,
              radius: 40.r,
            ),
            Text(
              controller.castList[index]["name"]!,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: whiteColor),
            ),
            Text(
              controller.castList[index]["artist"]!,
              style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: whiteColor.withOpacity(0.75)),
            )
          ],
        );
      },
      itemCount: controller.castList.length,
    );
  }
}
