import 'package:animate_do/animate_do.dart';
import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/PlayerWidgets/mini_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavigationScreen extends StatelessWidget {
  const BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavigationController = Get.find<BottomNavigationController>();
    return
        // Scaffold(
        //   backgroundColor: const Color(0xff1b1c1c),
        //   extendBody: true,
        // bottomNavigationBar:
        Obx(
      () => Visibility(
          visible: bottomNavigationController.displayNav.value,
          child: Theme(
            data: ThemeData(canvasColor: const Color(0xff1b1c1c)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Visibility(
                    visible: bottomNavigationController.showPlayer.value,
                    child: BounceInUp(child: MiniPlayer())),
                GestureDetector(
                  onTap: () => Get.currentRoute != AppRoute.premiumScreen
                      ? bottomNavigationController.changePage(2)
                      : null,
                  child: Container(
                    height: 25.h,
                    padding: EdgeInsets.only(left: 24.w, right: 24.w),
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff007AEA), Color(0xff7A53E8)])),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Upgrade Now to get 50% Off",
                          style: GoogleFonts.poppins(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.none,
                              color: whiteColor.withOpacity(0.8)),
                        ),
                        SizedBox(
                          width: 100.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/NavBarAssets/premium.svg",
                                // width: 12.w,
                              ),
                              Text(
                                "Upgrade",
                                style: GoogleFonts.poppins(
                                    fontSize: 11.sp,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600,
                                    color: whiteColor),
                              ),
                              SvgPicture.asset(
                                "assets/NavBarAssets/forward.svg",
                                width: 12.sp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/NavBarAssets/home.svg",
                        width: 18.w,
                      ),
                      icon: SvgPicture.asset(
                        "assets/NavBarAssets/home.svg",
                        width: 18.w,
                        theme: const SvgTheme(currentColor: Color(0xff8D8A8A)),
                      ),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/NavBarAssets/search.svg",
                          width: 18.w,
                        ),
                        icon: SvgPicture.asset(
                          "assets/NavBarAssets/search.svg",
                          theme: const SvgTheme(),
                          width: 18.w,
                        ),
                        label: "Search"),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/NavBarAssets/premium.svg",
                          width: 18.w,
                          color: const Color(0xff8D8A8A),
                        ),
                        activeIcon: SvgPicture.asset(
                          "assets/NavBarAssets/premium.svg",
                          width: 18.w,
                        ),
                        label: "Premium"),
                    BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          "assets/NavBarAssets/library.svg",
                          width: 18.w,
                          color: const Color(0xff8D8A8A),
                        ),
                        activeIcon: SvgPicture.asset(
                          "assets/NavBarAssets/library.svg",
                          width: 18.w,
                        ),
                        // activeIcon:
                        //     SvgPicture.asset("assets/NavBarAssets/activeProfile.svg"),
                        label: "Library"),
                  ],
                  type: BottomNavigationBarType.fixed,
                  // backgroundColor: blackColor,
                  currentIndex: bottomNavigationController.getSelectedIndex,
                  selectedItemColor: whiteColor,
                  unselectedItemColor: hintTextColor,
                  selectedFontSize: 12.sp,
                  unselectedFontSize: 12.sp,
                  onTap: (int index) {
                    bottomNavigationController.changePage(index);
                  },
                  showUnselectedLabels: true,
                  selectedLabelStyle: GoogleFonts.poppins(
                      color: whiteColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                  unselectedLabelStyle: GoogleFonts.poppins(
                      color: const Color(0xff5d5d5d),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          )),
    );
    //   body: Obx(() => bottomNavigationController
    //       .pages[bottomNavigationController.pageIndex.value]),
    // );
  }
}
