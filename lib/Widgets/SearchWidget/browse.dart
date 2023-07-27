import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Browse extends StatelessWidget {
  const Browse({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/HomeAssets/horror.png"),
        Align(
          alignment: Alignment.center,
          child: Text(
            "Horror",
            style: GoogleFonts.poppins(color: whiteColor, fontSize: 18.sp),
          ),
        ),
      ],
    );
  }
}
