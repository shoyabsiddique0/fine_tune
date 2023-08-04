import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fine_tune/Model/PlayerModel/position_data.dart';
import 'package:fine_tune/Pages/PlayerPage/player_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:fine_tune/Widgets/PlayerWidgets/controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rx;
import 'package:subtitle/subtitle.dart';

// ignore: must_be_immutable
class Player extends StatefulWidget {
  final int index;
  final Duration duration;
  Player({Key? key, required this.index, required this.duration})
      : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  // final mywidgetkey = GlobalKey();
  MediaItem? metaData;

  PlayerController controller = Get.find<PlayerController>();

  Stream<PositionData> get _positionDataStream =>
      rx.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        controller.audioPlayer.value.positionStream,
        controller.audioPlayer.value.bufferedPositionStream,
        controller.audioPlayer.value.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  Widget build(BuildContext context) {
    // controller.changeIndex(index - 1, duration);
    return GestureDetector(
      onVerticalDragStart: (details) {
        controller.startPos.value = details.globalPosition;
      },
      onVerticalDragUpdate: (details) {
        controller.endPos.value = details.globalPosition;
      },
      onVerticalDragEnd: (details) {
        if (controller.startPos.value.distance -
                controller.endPos.value.distance <
            Offset.zero.distance) {
          Get.back();
        }
      },
      onTap: () {},
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor, Color(0xff1c1b1b)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            StreamBuilder<SequenceState?>(
                stream: controller.audioPlayer.value.sequenceStateStream,
                builder: (context, snapshot) {
                  final state = snapshot.data;
                  if (state?.sequence.isEmpty ?? true) {
                    return const SizedBox();
                  }
                  final metadata = state?.currentSource!.tag as MediaItem;
                  metaData = metadata;
                  return Container(
                    // alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: whiteColor,
                              blurRadius: 15.w,
                              spreadRadius: 2.w,
                            )
                          ]),
                          child: Hero(
                            tag: "image",
                            // child: ClipRRect(
                            //   borderRadius: BorderRadius.circular(0),
                            //   child: CachedNetworkImage(
                            //     imageUrl: metadata.artUri.toString(),
                            //     placeholder: (context, url) => const Center(
                            //       child: CircularProgressIndicator(
                            //         value: 0.3,
                            //         color: Colors.greenAccent,
                            //         backgroundColor: Colors.grey,
                            //       ),
                            //     ),
                            //     errorWidget: (context, url, error) =>
                            //         const Icon(Icons.error),
                            //     height: 260.h,
                            //     width: 300.w,
                            //   ),
                            // ),
                            child: _buildFlipAnimation(metadata),
                          ),
                        ),
                        SizedBox(
                          height: 70.w,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              metadata.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w800),
                            ),
                            InkWell(
                                onTap: () async {
                                  List<Subtitle> srtFile =
                                      await controller.getCloseCaptionFile(
                                          "https://ott-2.s3.eu-north-1.amazonaws.com/Taylor-Swift-Love-Story.srt");
                                  const AsyncSnapshot.waiting();
                                  controller.caption.value = srtFile;
                                  print("--->$srtFile");
                                },
                                child: SvgPicture.asset(
                                    "assets/HomeAssets/heart.svg"))
                          ],
                        ),
                        SizedBox(
                          height: 8.h,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            metadata.artist!,
                            // textAlign: TextAlign.start,
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12.sp,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            SizedBox(
              height: 22.h,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              StreamBuilder<PositionData>(
                  stream: _positionDataStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data;
                    // controller.currPos.value =
                    //     position.position.inSeconds.toDouble();
                    return Container(
                      height: 40.w,
                      margin: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              height: 22.5.h,
                              child: ProgressBar(
                                key: controller.mywidgetkey.value,
                                barHeight: 2.h,
                                baseBarColor: Colors.white,
                                bufferedBarColor: Colors.grey[300],
                                progressBarColor: primaryColor,
                                thumbColor: primaryColor,
                                thumbRadius: 5.w,
                                progress: position?.position ?? Duration.zero,
                                total: position?.duration ?? Duration.zero,
                                buffered:
                                    position?.bufferedPosition ?? Duration.zero,
                                onSeek: (value) =>
                                    controller.audioPlayer.value.seek(value),
                                timeLabelTextStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontSize: 10.sp),
                                barCapShape: BarCapShape.round,
                                timeLabelPadding: 10.w,
                                timeLabelType: TimeLabelType.totalTime,
                              ),
                            ),
                          ),
                          Obx(() => Stack(
                              children: controller.getBookmarks(metaData,
                                  position, controller.mywidgetkey.value)))
                        ],
                      ),
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      controller.audioPlayer.value.seek(
                          controller.audioPlayer.value.position -
                              const Duration(seconds: 10));
                    },
                    child: SvgPicture.asset(
                      "assets/HomeAssets/10rev.svg",
                      width: 30.w,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        controller.audioPlayer.value.seekToPrevious();
                      },
                      child: SvgPicture.asset(
                        "assets/HomeAssets/back1.svg",
                        width: 25,
                      )),
                  SizedBox(
                      width: 55.w,
                      child:
                          Controls(audioPlayer: controller.audioPlayer.value)),
                  InkWell(
                      onTap: () {
                        controller.audioPlayer.value.seekToNext();
                      },
                      child: SvgPicture.asset(
                        "assets/HomeAssets/forward.svg",
                        width: 30.w,
                      )),
                  InkWell(
                      onTap: () {
                        controller.audioPlayer.value.seek(
                            controller.audioPlayer.value.position +
                                const Duration(seconds: 10));
                      },
                      child: SvgPicture.asset(
                        "assets/HomeAssets/10for.svg",
                        width: 30.w,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          if (controller.audioPlayer.value.loopMode ==
                              LoopMode.all) {
                            controller.loopMode.value =
                                !controller.loopMode.value;
                            controller.audioPlayer.value
                                .setLoopMode(LoopMode.one);
                          } else {
                            controller.loopMode.value =
                                !controller.loopMode.value;
                            controller.audioPlayer.value
                                .setLoopMode(LoopMode.all);
                          }
                        },
                        child: Obx(() => SvgPicture.asset(
                              controller.loopMode.value
                                  ? "assets/HomeAssets/repeat.svg"
                                  : "assets/HomeAssets/loopOne.svg",
                              // color: Colors.red,
                            )),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.bottomSheet(Container(
                            decoration: BoxDecoration(
                                color: const Color(0xff1c1b1b),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(8.r),
                                    topRight: Radius.circular(8.r))),
                            height: 210.h,
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            left: 10.w, top: 20.w),
                                        width: 180.w,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SvgPicture.asset(
                                                "assets/HomeAssets/playback.svg"),
                                            Text(
                                              "PlayBack Speed",
                                              style: TextStyle(
                                                  color: Colors.white70,
                                                  fontSize: 18.sp,
                                                  fontFamily: "Poppins",
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 10.w, top: 20.w),
                                        child: TextButton(
                                            onPressed: () => Get.back(),
                                            child: SvgPicture.asset(
                                                "assets/HomeAssets/close.svg")),
                                      )
                                    ],
                                  ),
                                  Obx(
                                    () => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.audioPlayer.value
                                                  .setSpeed(0.25);
                                              controller.playback.value = 1;
                                            },
                                            title: Text(
                                              "0.25x",
                                              style: TextStyle(
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: controller
                                                              .playback.value ==
                                                          1
                                                      ? primaryColor
                                                      : Colors.white),
                                            )),
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.playback.value = 2;
                                              controller.audioPlayer.value
                                                  .setSpeed(0.5);
                                            },
                                            title: Text("0.5x",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller.playback
                                                                .value ==
                                                            2
                                                        ? primaryColor
                                                        : Colors.white))),
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.playback.value = 3;
                                              controller.audioPlayer.value
                                                  .setSpeed(0.75);
                                            },
                                            title: Text("0.75x",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller.playback
                                                                .value ==
                                                            3
                                                        ? primaryColor
                                                        : Colors.white))),
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.playback.value = 4;
                                              controller.audioPlayer.value
                                                  .setSpeed(1);
                                            },
                                            title: Text("Normal",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller.playback
                                                                .value ==
                                                            4
                                                        ? primaryColor
                                                        : Colors.white))),
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.audioPlayer.value
                                                  .setSpeed(1.25);
                                              controller.playback.value = 5;
                                            },
                                            title: Text("1.25x",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller.playback
                                                                .value ==
                                                            5
                                                        ? primaryColor
                                                        : Colors.white))),
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.playback.value = 6;
                                              controller.audioPlayer.value
                                                  .setSpeed(1.5);
                                            },
                                            title: Text("1.5x",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller.playback
                                                                .value ==
                                                            6
                                                        ? primaryColor
                                                        : Colors.white))),
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.playback.value = 7;
                                              controller.audioPlayer.value
                                                  .setSpeed(1.75);
                                            },
                                            title: Text("1.75x",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller.playback
                                                                .value ==
                                                            7
                                                        ? primaryColor
                                                        : Colors.white))),
                                        ListTile(
                                            visualDensity: const VisualDensity(
                                                vertical: -4, horizontal: -2),
                                            onTap: () {
                                              controller.playback.value = 8;
                                              controller.audioPlayer.value
                                                  .setSpeed(2);
                                            },
                                            title: Text("2x",
                                                style: TextStyle(
                                                    fontSize: 14.sp,
                                                    fontWeight: FontWeight.w400,
                                                    color: controller.playback
                                                                .value ==
                                                            8
                                                        ? primaryColor
                                                        : Colors.white))),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                        },
                        child: SvgPicture.asset(
                          "assets/HomeAssets/playback.svg",
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            if (controller.muteVal.value) {
                              controller.audioPlayer.value.setVolume(1.0);
                              controller.muteVal.value = false;
                            } else {
                              controller.audioPlayer.value.setVolume(0.0);
                              controller.muteVal.value = true;
                            }
                          },
                          child: Obx(
                            () => SvgPicture.asset(
                              controller.muteVal.value
                                  ? "assets/HomeAssets/mute.svg"
                                  : "assets/HomeAssets/volume.svg",
                            ),
                          )),
                      TextButton(
                          onPressed: () {
                            controller.bookmarks[metaData?.id]
                                ?.add(controller.audioPlayer.value.position);
                          },
                          child: SvgPicture.asset(
                            "assets/HomeAssets/bookmark.svg",
                          )),
                    ],
                  )
                ],
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildFlipAnimation(metadata) {
    return GestureDetector(
        onTap: () =>
            controller.showFrontSide.value = !controller.showFrontSide.value,
        child: Obx(
          () => AnimatedSwitcher(
            duration: Duration(milliseconds: 2000),
            child: controller.showFrontSide.value
                ? _buildFront(metadata)
                : _buildRear(),
          ),
        ));
  }

  Widget _buildFront(metadata) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: CachedNetworkImage(
        imageUrl: metadata.artUri.toString(),
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(
            value: 0.3,
            color: Colors.greenAccent,
            backgroundColor: Colors.grey,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
        height: 260.h,
        width: 300.w,
      ),
    );
  }

  Widget _buildRear() {
    return Container(
        height: 260.h,
        width: 300.w,
        padding:
            EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h, bottom: 10.h),
        child: Obx(
          () => ListView.builder(
              itemCount: controller.caption.length,
              itemBuilder: (context, index) {
                print("###${controller.currentSubtitle?.value?.data}");
                print('@@@@@@@@@@@${controller.caption[index].data}');
                return Obx(
                  () => Text(
                    controller.caption[index].data,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 10.sp,
                        fontWeight: controller.currentSubtitle?.value?.data ==
                                controller.caption[index].data
                            ? FontWeight.w700
                            : FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                );
              }),
        ));
  }
}
