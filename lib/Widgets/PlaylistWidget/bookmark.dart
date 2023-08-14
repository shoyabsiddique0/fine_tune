import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({super.key});
  @override
  Widget build(BuildContext context) {
    PlaylistController controller = Get.find<PlaylistController>();
    return Container(
      margin: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
      child: ListView.builder(
          itemCount: controller.bookmarkList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 13.h),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.w),
                    side: BorderSide(color: primaryColor, width: 2.w)),
                dense: true,
                contentPadding: EdgeInsets.only(
                    top: 7.h, bottom: 7.h, left: 16.w, right: 16.w),
                title: Text(
                  "Bookmarked",
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: whiteColor.withOpacity(0.75)),
                ),
                leading: Text(
                  "#${index + 1}",
                  style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: whiteColor.withOpacity(0.75)),
                ),
                trailing: Text(
                  "${controller.bookmarkList[index].inMinutes - controller.bookmarkList[index].inHours * 60} mins ${controller.bookmarkList[index].inSeconds - controller.bookmarkList[index].inMinutes * 60} secs",
                  style: GoogleFonts.poppins(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: whiteColor),
                ),
              ),
            );
          }),
    );
  }
}
