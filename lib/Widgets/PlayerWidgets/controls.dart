import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';

class Controls extends StatelessWidget {
  const Controls({super.key, required this.audioPlayer});
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
        stream: audioPlayer.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          if (!(playing ?? false)) {
            return GestureDetector(
                onTap: () {
                  audioPlayer.play();
                },
                child: SvgPicture.asset("assets/HomeAssets/play.svg"));
          } else if (processingState != ProcessingState.completed) {
            return GestureDetector(
                onTap: () {
                  audioPlayer.pause();
                },
                child: SvgPicture.asset("assets/HomeAssets/pause.svg"));
          }
          return SvgPicture.asset("assets/HomeAssets/play.svg");
        });
  }
}