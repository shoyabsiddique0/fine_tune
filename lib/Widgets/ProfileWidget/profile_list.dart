import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileList extends StatelessWidget {
  final String imageLink, title;
  final void Function() onTap;
  final Color textColor;
  const ProfileList(
      {super.key,
      required this.imageLink,
      required this.title,
      required this.onTap,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(top: 14.h, bottom: 14.h),
        margin: EdgeInsets.only(
          left: 24.w,
          right: 24.w,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  imageLink,
                  width: 24.w,
                  height: 20.h,
                  fit: BoxFit.scaleDown,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      color: textColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15.sp),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
