import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final List<String>? list;
  final RxInt? currentVal;
  final bool hasSuffix;
  final String hint;
  const CustomSearchBar(
      {super.key,
      required this.controller,
      this.list,
      this.currentVal,
      required this.hint,
      required this.hasSuffix});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.h,
      margin: EdgeInsets.only(top: 10.h),
      decoration: BoxDecoration(
          color: whiteColor.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(8.w))),
      child: TextFormField(
        expands: true,
        minLines: null,
        maxLines: null,
        controller: controller,
        decoration: InputDecoration(
            isDense: true,
            prefixIcon: SvgPicture.asset(
              "assets/NavBarAssets/search.svg",
              fit: BoxFit.scaleDown,
              color: whiteColor.withOpacity(0.25),
            ),
            contentPadding: EdgeInsets.zero,
            suffixIcon: hasSuffix
                ? GestureDetector(
                    onTap: () {
                      Get.find<BottomNavigationController>().displayNav.value =
                          false;
                      Get.bottomSheet(
                        Container(
                          color: const Color(0xff1b1c1c),
                          height: 200.h,
                          padding: EdgeInsets.only(
                              top: 20.h, left: 24.w, right: 24.w),
                          child: Obx(
                            () => Column(children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/NavBarAssets/sort.svg",
                                        fit: BoxFit.scaleDown,
                                      ),
                                      SizedBox(width: 10.w),
                                      Text(
                                        "Sort By",
                                        style: GoogleFonts.poppins(
                                            color: whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Get.find<BottomNavigationController>()
                                            .displayNav
                                            .value = true;
                                        Get.back();
                                      },
                                      child: Padding(
                                        padding: EdgeInsets.only(right: 10.w),
                                        child: SvgPicture.asset(
                                            "assets/HomeAssets/cross.svg"),
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
                                    children: list!
                                        .map(
                                          (element) => ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: 0),
                                            onTap: () => currentVal?.value =
                                                list!.indexOf(element) + 1,
                                            title: Text(
                                              element,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color: currentVal?.value ==
                                                          list!.indexOf(
                                                                  element) +
                                                              1
                                                      ? primaryColor
                                                      : whiteColor),
                                            ),
                                          ),
                                        )
                                        .toList()),
                              ),
                            ]),
                          ),
                        ),
                        isDismissible: false,
                      );
                    },
                    child: SvgPicture.asset(
                      "assets/NavBarAssets/sort.svg",
                      fit: BoxFit.scaleDown,
                      color: whiteColor,
                    ),
                  )
                : const SizedBox.shrink(),
            hintText: hint,
            hintStyle: GoogleFonts.poppins(
                color: whiteColor.withOpacity(0.5), fontSize: 12.sp),
            border: const OutlineInputBorder(),
            focusedBorder: const OutlineInputBorder()),
        style: GoogleFonts.poppins(
            color: whiteColor.withOpacity(0.5), fontSize: 12.sp),
      ),
    );
  }
}
