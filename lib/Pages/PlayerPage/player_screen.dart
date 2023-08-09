import 'package:audio_service/audio_service.dart';
import 'package:fine_tune/Pages/PlayerPage/player_controller.dart';
import 'package:fine_tune/Pages/PlayerPage/player_view_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/PlayerWidgets/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    PlayerViewController controller = Get.find<PlayerViewController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        leading: TextButton(
          child: SvgPicture.asset("assets/HomeAssets/prev.svg"),
          onPressed: () => Get.back(),
        ),
        title: StreamBuilder(
            stream: Get.find<PlayerController>()
                .audioPlayer
                .value
                .sequenceStateStream,
            builder: (context, snapshot) {
              if (snapshot.data?.sequence.isEmpty ?? true) {
                return const SizedBox();
              }
              MediaItem metadata =
                  snapshot.data?.currentSource?.tag as MediaItem;
              return Text(
                metadata.title,
                style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: whiteColor),
              );
            }),
        centerTitle: true,
      ),
      backgroundColor: const Color(0xff1c1b1b),
      body: const SingleChildScrollView(
        child: Column(
          children: [Player(index: 0, duration: Duration.zero)],
        ),
      ),
    );
  }
}
