import 'package:fine_tune/Pages/ProfilePage/EditProfilePage/edit_profile_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/ProfileWidget/custom_text_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    EditProfileController controller = Get.find<EditProfileController>();
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "My List",
          style: GoogleFonts.poppins(
              fontSize: 16.sp, color: whiteColor, fontWeight: FontWeight.w400),
        ),
        leading: InkWell(
            onTap: () => Get.back(),
            child: SvgPicture.asset(
              "assets/HomeAssets/prev.svg",
              fit: BoxFit.scaleDown,
            )),
      ),
      backgroundColor: Color(0xff1c1b1b),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/AuthAssets/profile.png"),
              radius: 80.w,
            ),
            SizedBox(
              height: 15.h,
            ),
            SvgPicture.asset(
              "assets/HomeAssets/upload.svg",
              width: 30.w,
              height: 30.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
                margin: EdgeInsets.only(left: 24.w, right: 24.w),
                child: CustomTextBar(
                    controller: controller.nameController.value,
                    hint: "Name",
                    enabled: true)),
            Container(
                margin: EdgeInsets.only(left: 24.w, right: 24.w),
                child: CustomTextBar(
                    controller: controller.emailController.value,
                    hint: "Email",
                    enabled: true)),
            Container(
                margin: EdgeInsets.only(left: 24.w, right: 24.w),
                child: CustomTextBar(
                  controller: controller.phoneController.value,
                  hint: "Phone Number",
                  enabled: false,
                  prefix: Container(
                    margin: EdgeInsets.only(
                        left: 5.w, right: 5.w, top: 12.h, bottom: 10.h),
                    child: Text("+91 | ",
                        style: GoogleFonts.poppins(
                            color: whiteColor.withOpacity(0.75),
                            fontSize: 14.sp)),
                  ),
                )),
            Container(
              margin: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w),
              width: double.infinity,
              height: 40.h,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
                child: Text(
                  "Save",
                  style: GoogleFonts.poppins(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: whiteColor),
                ),
              ),
            ),
            SizedBox(
              height: 160.h,
            )
          ],
        ),
      ),
    );
  }
}
