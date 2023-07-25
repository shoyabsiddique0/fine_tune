import 'package:fine_tune/Pages/LibraryPage/library_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/HomeWidget/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryController controller = Get.find<LibraryController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 180.h,
            padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 20.h),
            width: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xff1C1B1B), Color(0xff0F4A81)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to your",
                          style: GoogleFonts.poppins(
                              fontSize: 18.w,
                              fontWeight: FontWeight.w400,
                              color: whiteColor.withOpacity(0.75)),
                        ),
                        Text(
                          "Library",
                          style: GoogleFonts.poppins(
                              fontSize: 32.w,
                              // fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w500,
                              color: whiteColor),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 25.h),
                      // width: 85.w,
                      child: CircleAvatar(
                        radius: 18.w,
                        backgroundImage:
                            const AssetImage("assets/AuthAssets/profile.png"),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 45.h,
                  margin: EdgeInsets.only(top: 10.h),
                  decoration: BoxDecoration(
                      color: whiteColor.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(8.w))),
                  child: TextFormField(
                    expands: true,
                    minLines: null,
                    maxLines: null,
                    controller: controller.searchEdit.value,
                    decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: SvgPicture.asset(
                          "assets/NavBarAssets/search.svg",
                          fit: BoxFit.scaleDown,
                          color: whiteColor.withOpacity(0.25),
                        ),
                        contentPadding: EdgeInsets.zero,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            Get.bottomSheet(Container(
                              color: const Color(0xff1b1c1c),
                              height: 170.h,
                              padding: EdgeInsets.only(
                                  top: 20.h, left: 24.w, right: 24.w),
                              child: Obx(
                                () => Column(children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Sort By",
                                        style: GoogleFonts.poppins(
                                            color: whiteColor,
                                            fontSize: 14.w,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      GestureDetector(
                                          onTap: () => Get.back(),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.w),
                                            child: SvgPicture.asset(
                                                "assets/HomeAssets/DetailsAssets/cross.svg"),
                                          ))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Theme(
                                    data: ThemeData(
                                        unselectedWidgetColor: whiteColor),
                                    child: Column(
                                      children: controller.sort.map((element) {
                                        return GestureDetector(
                                            onTap: () => controller.groupValue
                                                .value = element["value"]!,
                                            child: RadioListTile(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              visualDensity:
                                                  const VisualDensity(
                                                      vertical: -4),
                                              title: Text(
                                                element["title"]!,
                                                style: GoogleFonts.poppins(
                                                    color: whiteColor,
                                                    fontSize: 14.w,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              contentPadding: EdgeInsets.zero,
                                              activeColor: primaryColor,
                                              groupValue:
                                                  controller.groupValue.value,
                                              value: element["value"],
                                              onChanged: (value) => controller
                                                  .groupValue
                                                  .value = value.toString(),
                                            ));
                                      }).toList(),
                                    ),
                                  ),
                                ]),
                              ),
                            ));
                          },
                          child: SvgPicture.asset(
                            "assets/NavBarAssets/sort.svg",
                            fit: BoxFit.scaleDown,
                            color: whiteColor,
                          ),
                        ),
                        hintText: "Search Here...",
                        hintStyle: GoogleFonts.poppins(
                            color: whiteColor.withOpacity(0.5), fontSize: 14.w),
                        border: const OutlineInputBorder(),
                        focusedBorder: const OutlineInputBorder()),
                    style: GoogleFonts.poppins(
                        color: whiteColor.withOpacity(0.5), fontSize: 14.w),
                  ),
                ),
              ],
            ),
          ),
          Header(
              title: "Recently Played",
              child: SizedBox(
                height: 220.h,
                child: ListView.builder(
                    // padding: EdgeInsets.only(right: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: controller.recentList[index],
                      );
                    },
                    itemCount: controller.recentList.length),
              )),
          Header(
              title: "Featured Albums",
              child: SizedBox(
                height: 220.h,
                child: ListView.builder(
                    // padding: EdgeInsets.only(right: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: controller.featuredList[index],
                      );
                    },
                    itemCount: controller.featuredList.length),
              )),
          Header(
              title: "Podcast",
              child: SizedBox(
                height: 220.h,
                child: ListView.builder(
                    // padding: EdgeInsets.only(right: 20.w),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(right: 12.w),
                        child: controller.recentList[index],
                      );
                    },
                    itemCount: controller.recentList.length),
              )),
          SizedBox(
            height: 45.h,
          )
        ],
      ),
    );
  }
}
