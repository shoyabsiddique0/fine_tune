import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/PlaylistWidget/bookmark.dart';
import 'package:fine_tune/Widgets/PlaylistWidget/cast_crew.dart';
import 'package:fine_tune/Widgets/PlaylistWidget/episodes.dart';
import 'package:fine_tune/Widgets/PlaylistWidget/more_like_this.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PlaylistController controller = Get.put(PlaylistController());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xff1c1b1b),
        body: Column(
          children: [
            Container(
              height: 350.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/HomeAssets/ramayan.png"),
                      fit: BoxFit.fitWidth),
                  gradient: LinearGradient(
                    colors: [
                      Color(0xff1c1b1b),
                      Color(0xff1c1b1b),
                      Colors.transparent
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  )),
              child: Stack(
                children: [
                  Positioned(
                    top: 20.h,
                    left: 20.w,
                    child: InkWell(
                        onTap: () => Get.find<BottomNavigationController>()
                            .homeIndex
                            .value = 0,
                        child: SvgPicture.asset(
                          "assets/HomeAssets/prev.svg",
                          fit: BoxFit.scaleDown,
                        )),
                  ),
                  Positioned(
                    top: 210.h,
                    child: Container(
                      margin: EdgeInsets.only(left: 24.w, right: 24.w),
                      width: ScreenUtil.defaultSize.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Ramayan",
                            style: GoogleFonts.poppins(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w500,
                                color: whiteColor),
                          ),
                          Text(
                            "Description - Lorem Ipsum dummy text htiw on esens esaelp erongi",
                            maxLines: 2,
                            // overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: whiteColor.withOpacity(0.75)),
                          ),
                          Text(
                            "22 hr 30 min",
                            style: GoogleFonts.poppins(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w400,
                                color: whiteColor.withOpacity(0.75)),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300.h,
                    left: 24.w,
                    right: 24.w,
                    child: SizedBox(
                      width: ScreenUtil.defaultSize.width.w,
                      // margin: EdgeInsets.only(right: 24.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 60.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    "assets/HomeAssets/download.svg"),
                                SvgPicture.asset("assets/HomeAssets/option.svg")
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 165.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SvgPicture.asset(
                                    "assets/HomeAssets/likePlaylist.svg"),
                                SizedBox(
                                  width: 100.w,
                                  height: 37.h,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor),
                                    child: Text(
                                      "Play",
                                      style: GoogleFonts.poppins(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                          color: whiteColor),
                                    ),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              child: TabBar(
                controller: controller.tabController,
                tabs: [
                  SizedBox(
                    width: 110.w,
                    height: 30.h,
                    child: Center(
                        child: Text(
                      "Episodes (16)",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: Center(
                      child: Text(
                        "Cast & Crew",
                        style: GoogleFonts.poppins(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 90.w,
                    height: 30.h,
                    child: Center(
                        child: Text(
                      "Bookmarks",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 120.w,
                    height: 30.h,
                    child: Center(
                        child: Text(
                      "More Like This",
                      style: GoogleFonts.poppins(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                  ),
                ],
                isScrollable: true,
                indicatorColor: primaryColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                labelColor: whiteColor,
                indicator: BoxDecoration(
                  // color: Colors.yellow,
                  gradient: const LinearGradient(
                      colors: [Color(0xff007AEA), Color(0xff1b1c1c)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.center,
                      tileMode: TileMode.decal,
                      stops: [0, 0.5]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.w),
                  ),
                  border: Border(
                    left: const BorderSide(width: 0, color: Color(0xff007AEA)),
                    right: const BorderSide(width: 0, color: Color(0xff007AEA)),
                    top: const BorderSide(width: 0, color: Color(0xff007AEA)),
                    bottom:
                        BorderSide(width: 2.w, color: const Color(0xff007AEA)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
                child:
                    TabBarView(controller: controller.tabController, children: [
              Episodes(),
              CastCrew(),
              Bookmark(),
              MoreLikeThis(),
            ]))
          ],
        ),
      ),
    );
  }
}
