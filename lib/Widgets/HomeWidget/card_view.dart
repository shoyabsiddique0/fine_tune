import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:main_ott/Theme/colors.dart';

// ignore: must_be_immutable
class CardView extends StatelessWidget {
  final String name;
  final String episode;
  final String image;
  void Function() action;
  final bool isWatched;
  CardView(
      {super.key,
      required this.name,
      required this.episode,
      required this.image,
      required this.action,
      required this.isWatched});

  @override
  Widget build(BuildContext context) {
    GlobalKey cardKey = GlobalKey();
    return InkWell(
      onTap: action,
      child: SizedBox(
        height: 210.h,
        width: 120.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 145.h, child: Image.asset(image, key: cardKey,)),
            isWatched
                ? SizedBox(
              width: 105.w,
                  child: LinearProgressIndicator(
                      value: 0.2,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                    ),
                )
                : SizedBox.shrink(),
            SizedBox(
              height: 10.h,
            ),
            Text(name,
                style: GoogleFonts.poppins(
                    color: whiteColor,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis),
            SizedBox(
              height: 3.h,
            ),
            Text(episode,
                style: GoogleFonts.poppins(
                    color: whiteColor.withOpacity(0.75),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis),
          ],
        ),
      ),
    );
  }
  double findWidth(GlobalKey cardKey){
    var box = cardKey.currentContext?.findRenderObject() as RenderBox;
    return box.size.width;
  }
}
