import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionCard extends StatelessWidget {
  final List<Color> gradients;
  final String amount;
  final String plan;
  final List<String> details;
  const SubscriptionCard(
      {super.key,
      required this.gradients,
      required this.amount,
      required this.plan,
      required this.details});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      margin: EdgeInsets.only(left: 24.w, right: 24.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          gradient: LinearGradient(
              colors: gradients,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight)),
      child: Stack(children: [
        Container(
          margin:
              EdgeInsets.only(left: 15.w, top: 15.w, bottom: 15.w, right: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Current Plan",
                style: GoogleFonts.poppins(
                  color: whiteColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: details
                    .map(
                      (e) => Row(
                        children: [
                          SvgPicture.asset("assets/HomeAssets/doubletick.svg"),
                          Text(
                            e,
                            style: GoogleFonts.poppins(
                              color: whiteColor,
                              fontSize: 8.w,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    )
                    .toList(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    plan,
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: whiteColor,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.w),
                          )),
                      child: Text(
                        "Subscribe",
                        style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Positioned(
            top: 20.h,
            right: 85.w,
            child: Text(
              "From",
              style: GoogleFonts.poppins(
                color: whiteColor,
                fontSize: 12.sp,
                fontWeight: FontWeight.w400,
              ),
            )),
        Positioned(
            top: 20.h,
            right: 15.w,
            child: Text(
              amount,
              style: GoogleFonts.poppins(
                color: whiteColor,
                fontSize: 22.sp,
                fontWeight: FontWeight.w400,
              ),
            )),
      ]),
    );
  }
}
