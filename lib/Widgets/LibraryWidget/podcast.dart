import 'package:fine_tune/Pages/LibraryPage/library_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Podcast extends StatelessWidget {
  const Podcast({super.key});

  @override
  Widget build(BuildContext context) {
    LibraryController controller = Get.find<LibraryController>();
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: ListView(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          children: controller.likedList),
    );
  }
}
