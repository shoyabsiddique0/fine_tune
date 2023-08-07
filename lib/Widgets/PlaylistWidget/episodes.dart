import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Episodes extends StatelessWidget {
  const Episodes({super.key});

  @override
  Widget build(BuildContext context) {
    PlaylistController controller = Get.find<PlaylistController>();
    return Padding(
      padding: EdgeInsets.only(top: 5.h),
      child: ListView(
          // shrinkWrap: false,
          // physics: const NeverScrollableScrollPhysics(),
          children: controller.episodeList),
    );
  }
}
