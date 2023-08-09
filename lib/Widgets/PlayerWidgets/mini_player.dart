import 'package:audio_service/audio_service.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fine_tune/Model/PlayerModel/position_data.dart';
import 'package:fine_tune/Pages/PlayerPage/player_controller.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:marquee/marquee.dart';
import 'package:rxdart/rxdart.dart' as rx;

class MiniPlayer extends StatelessWidget {
  MiniPlayer({super.key});
  final PlayerController controller = Get.put(PlayerController());
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
    return Column(
      children: [
        Obx(
          () => GestureDetector(
            onVerticalDragStart: (details) {
              controller.startPos.value = details.globalPosition;
            },
            onVerticalDragUpdate: (details) {
              controller.endPos.value = details.globalPosition;
            },
            onVerticalDragEnd: (details) {
              if (controller.startPos.value.distance -
                      controller.endPos.value.distance >
                  Offset.zero.distance) {
                Get.toNamed(AppRoute.playerScreen);
              }
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.w),
              child: Container(
                height: 70.w,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  const Color(0xff3B3233).withOpacity(0.9),
                  const Color(0xff635758).withOpacity(0.9)
                ], stops: const [
                  0.2,
                  0.9
                ])),
                padding: EdgeInsets.only(left: 20.w),
                // child: Row(children: [
                //   Container(
                //     height: 40.w,
                //     width: 40.w,
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.all(Radius.circular(40.w)),
                //         image: const DecorationImage(
                //             image: AssetImage(
                //                 "assets/PlaylistAssets/songCard.png"))),
                //   ),
                //   SvgPicture.asset("assets/PlaylistAssets/play.svg"),
                // ]),
                child: StreamBuilder<SequenceState?>(
                    stream: controller.audioPlayer.value.sequenceStateStream,
                    builder: (context, snapshot) {
                      final state = snapshot.data;
                      if (state?.sequence.isEmpty ?? true) {
                        return const SizedBox();
                      }
                      var data = state?.currentSource?.tag as MediaItem;
                      controller.currIndex.value = int.parse(data.id);
                      controller.currDur.value =
                          controller.audioPlayer.value.position;
                      return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Hero(
                                  tag: "image",
                                  transitionOnUserGestures: true,
                                  child: SizedBox(
                                    height: 50.h,
                                    width: 50.w,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: CachedNetworkImage(
                                        imageUrl: data.artUri.toString(),
                                        placeholder: (context, url) =>
                                            const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 110.w,
                                      height: 25.h,
                                      child: Marquee(
                                        scrollAxis: Axis.horizontal,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        velocity: 50.0,
                                        blankSpace: 10.w,
                                        pauseAfterRound:
                                            const Duration(seconds: 2),
                                        text: data.title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            decoration: TextDecoration.none,
                                            fontFamily: "Poppins",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25.h,
                                      width: 110.w,
                                      child: Marquee(
                                        scrollAxis: Axis.horizontal,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        velocity: 50.0,
                                        blankSpace: 10.w,
                                        pauseAfterRound:
                                            const Duration(seconds: 2),
                                        text: data.artist!,
                                        style: TextStyle(
                                          color: Colors.white70,
                                          decoration: TextDecoration.none,
                                          fontFamily: "Poppins",
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50.h,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        if (controller
                                                .audioPlayer.value.loopMode ==
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
                                            color: Colors.red,
                                          )),
                                    ),
                                    SvgPicture.asset(
                                        "assets/HomeAssets/heart.svg"),
                                    SizedBox(
                                      height: 40.h,
                                      child: StreamBuilder<PlayerState>(
                                          stream: controller.audioPlayer.value
                                              .playerStateStream,
                                          builder: (context, snapshot) {
                                            final playerState = snapshot.data;
                                            final processingState =
                                                playerState?.processingState;
                                            final playing =
                                                playerState?.playing;
                                            if (!(playing ?? false)) {
                                              return InkWell(
                                                  onTap: () {
                                                    controller.audioPlayer.value
                                                        .play();
                                                  },
                                                  child: SvgPicture.asset(
                                                    "assets/HomeAssets/play.svg",
                                                    fit: BoxFit.scaleDown,
                                                  ));
                                            } else if (processingState !=
                                                ProcessingState.completed) {
                                              return InkWell(
                                                  onTap: () {
                                                    controller.audioPlayer.value
                                                        .pause();
                                                  },
                                                  child: SvgPicture.asset(
                                                      "assets/HomeAssets/pause.svg",
                                                      fit: BoxFit.scaleDown));
                                            }
                                            return SvgPicture.asset(
                                                "assets/HomeAssets/play.svg",
                                                fit: BoxFit.scaleDown);
                                          }),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ]);
                    }),
              ),
            ),
          ),
        ),
        StreamBuilder<PositionData>(
            stream: _positionDataStream,
            builder: (context, snapshot) {
              final position = snapshot.data;
              return ProgressBar(
                barHeight: 2.w,
                baseBarColor: Colors.white,
                bufferedBarColor: Colors.grey[300],
                progressBarColor: Colors.red,
                thumbColor: Colors.red,
                thumbRadius: 2.w,
                progress: position?.position ?? Duration.zero,
                total: position?.duration ?? Duration.zero,
                buffered: position?.bufferedPosition ?? Duration.zero,
                onSeek: (value) => controller.audioPlayer.value.seek(value),
                barCapShape: BarCapShape.round,
                timeLabelLocation: TimeLabelLocation.none,
              );
            }),
      ],
    );
  }
}
