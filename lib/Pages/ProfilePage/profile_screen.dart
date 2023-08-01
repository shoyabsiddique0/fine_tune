import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/ProfileWidget/profile_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Get.find<BottomNavigationController>().libIndex.value = 0;
        Get.find<BottomNavigationController>().homeIndex.value = 0;
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: const Color(0xff1c1b1b),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
              // width: double.infinity,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Color(0xff1C1B1B), Color(0xff0F4A81)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset("assets/HomeAssets/prev.svg")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: GoogleFonts.poppins(
                                fontSize: 14.sp,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                                color: whiteColor.withOpacity(0.75)),
                          ),
                          Text(
                            "Alice Wonder",
                            style: GoogleFonts.poppins(
                                fontSize: 28.sp,
                                // fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.w500,
                                color: whiteColor,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 25.h),
                        // width: 85.w,
                        child: CircleAvatar(
                          radius: 35.w,
                          backgroundImage:
                              const AssetImage("assets/AuthAssets/profile.png"),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () => Get.toNamed(AppRoute.editProfileScreen),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        minimumSize: Size(50.w, 30.h),
                        fixedSize: Size(100.w, 35.h),
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: primaryColor, width: 1.w),
                            borderRadius: BorderRadius.circular(8.w))),
                    child: Text(
                      "Edit",
                      style: GoogleFonts.poppins(
                          fontSize: 15.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  // CustomSearchBar(
                  //   controller: controller.searchEdit.value,
                  //   list: controller.sort,
                  //   currentVal: controller.currentVal,
                  //   hint: "Search Library",
                  //   hasSuffix: true,
                  // )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<BottomNavigationController>().pageIndex.value = 2;
                // Get.back();
              },
              child: Container(
                height: 52.h,
                margin: EdgeInsets.only(left: 24.w, right: 24.w),
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.w),
                    gradient: const LinearGradient(
                        colors: [Color(0xff9713FF), Color(0xff5CA7FF)])),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Current Plan",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Premium",
                      style: GoogleFonts.poppins(
                          fontSize: 16.sp,
                          color: whiteColor,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            ProfileList(
              imageLink: "assets/HomeAssets/myList.svg",
              title: "My List",
              onTap: () => Get.toNamed(AppRoute.myListScreen),
              textColor: whiteColor,
            ),
            ProfileList(
              imageLink: "assets/HomeAssets/privacyPolicy.svg",
              title: "Privacy Policy",
              onTap: () {},
              textColor: whiteColor,
            ),
            ProfileList(
              imageLink: "assets/HomeAssets/contactUs.svg",
              title: "Contact Us",
              onTap: () {},
              textColor: whiteColor,
            ),
            ProfileList(
              imageLink: "assets/HomeAssets/support.svg",
              title: "Help and Support",
              onTap: () {},
              textColor: whiteColor,
            ),
            ProfileList(
              imageLink: "assets/HomeAssets/about.svg",
              title: "About Us",
              onTap: () {},
              textColor: whiteColor,
            ),
            ProfileList(
              imageLink: "assets/HomeAssets/logout.svg",
              title: "Logout",
              onTap: () {
                Get.bottomSheet(
                    Container(
                      padding:
                          EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w),
                      height: 140.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          color: Color(0xff1c1b1b)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                      "assets/HomeAssets/logoutFrame.svg"),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Logout?",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        color: whiteColor,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () => Get.back(),
                                child: SvgPicture.asset(
                                    "assets/HomeAssets/cross.svg"),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Flexible(
                              child: Text("Are you sure you want to Logout?",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w400))),
                          SizedBox(
                            height: 10.h,
                          ),
                          Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          fixedSize: Size.fromHeight(40.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.w))),
                                      onPressed: () {},
                                      child: Text(
                                        "Logout",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: whiteColor),
                                      ))),
                              SizedBox(
                                width: 24.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        fixedSize: Size.fromHeight(40.h),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: primaryColor,
                                                width: 2.w),
                                            borderRadius:
                                                BorderRadius.circular(8.w))),
                                    onPressed: () {},
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: whiteColor),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    elevation: 0,
                    barrierColor: whiteColor.withOpacity(0.1));
              },
              textColor: whiteColor,
            ),
            ProfileList(
              imageLink: "assets/HomeAssets/delete.svg",
              title: "Delete Account",
              onTap: () {
                Get.bottomSheet(
                    Container(
                      padding: EdgeInsets.only(left: 24.w, right: 24.w),
                      height: 180.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.w),
                          color: Color(0xff1b1c1c)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Color(0xff3C1717),
                                    child: SvgPicture.asset(
                                        "assets/HomeAssets/delete.svg"),
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "Delete Account",
                                    style: GoogleFonts.poppins(
                                        fontSize: 15.sp,
                                        color: Colors.red,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              InkWell(
                                onTap: () => Get.back(),
                                child: SvgPicture.asset(
                                    "assets/HomeAssets/cross.svg"),
                              )
                            ],
                          ),
                          Flexible(
                              child: Text(
                                  "Are you sure you want to Delete account? All the data of this account will be deleted",
                                  style: GoogleFonts.poppins(
                                      fontSize: 11.sp,
                                      color: whiteColor,
                                      fontWeight: FontWeight.w400))),
                          Flex(
                            direction: Axis.horizontal,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: primaryColor,
                                          fixedSize: Size.fromHeight(40.h),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.w))),
                                      onPressed: () {},
                                      child: Text(
                                        "Delete",
                                        style: GoogleFonts.poppins(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400,
                                            color: whiteColor),
                                      ))),
                              SizedBox(
                                width: 24.w,
                              ),
                              Expanded(
                                flex: 1,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        fixedSize: Size.fromHeight(40.h),
                                        shape: RoundedRectangleBorder(
                                            side: BorderSide(
                                                color: primaryColor,
                                                width: 2.w),
                                            borderRadius:
                                                BorderRadius.circular(8.w))),
                                    onPressed: () {},
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: whiteColor),
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    elevation: 0,
                    barrierColor: whiteColor.withOpacity(0.1));
              },
              textColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
