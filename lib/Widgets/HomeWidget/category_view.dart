import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      padding: EdgeInsets.all(8.w),
      // margin: EdgeInsets.only(left: 24.w, right: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8.w)),
        color: Color(0xff3D3D3D),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
              height: 40.w,
              width: 40.w,
              child: SvgPicture.asset("assets/HomeAssets/category.svg")),
          Text(
            "Top Audio Books",
            style: GoogleFonts.poppins(
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: whiteColor),
          )
        ],
      ),
    );
  }
}
