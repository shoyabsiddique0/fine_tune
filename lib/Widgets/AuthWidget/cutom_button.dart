import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() func;
  const CustomButton({super.key, required this.title, required this.func});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        title,
        style: GoogleFonts.poppins(
            color: whiteColor, fontSize: 14.sp, fontWeight: FontWeight.w400),
      ),
      onPressed: func,
      style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.w),
          ),
          elevation: 0),
    );
  }
}
