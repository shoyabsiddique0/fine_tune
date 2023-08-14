import 'package:fine_tune/Pages/ProfilePage/MyListPage/my_list_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/LibraryWidget/custom_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MyListController controller = Get.find<MyListController>();
    return Scaffold(
      backgroundColor: const Color(0xff1c1b1b),
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              child: CustomSearchBar(
                controller: controller.searchEdit.value,
                list: controller.sort,
                currentVal: controller.currentVal,
                hint: "Search Library",
                hasSuffix: true,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              margin: EdgeInsets.only(left: 24.w, right: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "48 File",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: whiteColor),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset("assets/HomeAssets/shuffle.svg"),
                      SizedBox(
                        width: 20.w,
                      ),
                      SvgPicture.asset("assets/HomeAssets/playAll.svg"),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Column(
              children: controller.likedList,
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
