import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentSearch extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageLink;
  final void Function() func;
  const RecentSearch(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageLink,
      required this.func});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      visualDensity: const VisualDensity(vertical: -2, horizontal: 0),
      contentPadding: EdgeInsets.zero,
      leading: Image.asset(imageLink),
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 13.sp, color: whiteColor),
      ),
      subtitle: Text(subtitle,
          style: GoogleFonts.poppins(
              fontSize: 12.sp, color: whiteColor.withOpacity(0.75))),
      trailing: TextButton(
          onPressed: func,
          child: SvgPicture.asset("assets/HomeAssets/cross.svg")),
    );
  }
}
