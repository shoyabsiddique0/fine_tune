import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/PremiumWidget/subscription_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset("assets/HomeAssets/premiumBg.png"),
        ),
        ListView(
          // padding: EdgeInsets.all(10.h),
          children: [
            Container(
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 35.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Upgrade now for",
                    style: GoogleFonts.poppins(
                      color: whiteColor.withOpacity(0.8),
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "10000+ Audios",
                    style: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35.h,
            ),
            const SubscriptionCard(
              gradients: [Color(0xffFF9213), Color(0xffB400AD)],
              plan: "Premium",
              amount: "₹ 200",
              details: [
                "Lorem ipsum domet - dummy text",
                "Lorem ipsum domet - dummy text",
                "Lorem ipsum domet - dummy text",
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const SubscriptionCard(
              gradients: [Color(0xfff515FF), Color(0xff5CA7FF)],
              plan: "Advanced",
              amount: "₹ 125",
              details: [
                "Lorem ipsum domet - dummy text",
                "Lorem ipsum domet - dummy text",
                "Lorem ipsum domet - dummy text",
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const SubscriptionCard(
              gradients: [
                Color(0xff007AEA),
                Color(0xff007AEA),
              ],
              plan: "Basic",
              amount: "₹ 99",
              details: [
                "Lorem ipsum domet - dummy text",
                "Lorem ipsum domet - dummy text",
                "Lorem ipsum domet - dummy text",
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        )
      ],
    );
  }
}
