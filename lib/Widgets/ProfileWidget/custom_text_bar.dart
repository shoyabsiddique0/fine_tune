import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextBar extends StatelessWidget {
  final TextEditingController controller;
  final List<String>? list;
  final RxInt? currentVal;
  final Widget? suffix;
  final String hint;
  final Widget? prefix;
  final bool enabled;
  const CustomTextBar(
      {super.key,
      required this.controller,
      required this.hint,
      this.list,
      this.currentVal,
      required this.enabled,
      this.suffix,
      this.prefix});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          hint,
          style: GoogleFonts.poppins(
              fontSize: 10.sp,
              fontWeight: FontWeight.w400,
              color: whiteColor.withOpacity(0.75)),
        ),
        Container(
          height: 45.h,
          margin: EdgeInsets.only(bottom: 16.h),
          decoration: BoxDecoration(
              // color: whiteColor.withOpacity(0.1),
              color: Color(0xff3E3D3D),
              borderRadius: BorderRadius.all(Radius.circular(8.w))),
          child: TextFormField(
            expands: true,
            minLines: null,
            maxLines: null,
            // enabled: enabled,
            controller: controller,
            decoration: InputDecoration(
                enabled: enabled,
                isDense: true,
                prefixIcon: prefix,
                contentPadding: EdgeInsets.only(left: 16.w),
                suffixIcon: suffix,
                hintStyle:
                    GoogleFonts.poppins(color: whiteColor, fontSize: 12.sp),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder()),
            style: GoogleFonts.poppins(
                color: enabled ? whiteColor : whiteColor.withOpacity(0.75),
                fontSize: 15.sp),
          ),
        ),
      ],
    );
  }
}
