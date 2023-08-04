import 'package:audio_service/audio_service.dart';
import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Theme/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:subtitle/subtitle.dart';
import 'package:http/http.dart' as http;

class PlayerController extends GetxController {
  final audioPlayer = AudioPlayer().obs;
  final loopMode = true.obs;
  final mute = false.obs;
  final RxMap<String, List<Duration>> bookmarks =
      <String, List<Duration>>{}.obs;
  final volume = 1.0.obs;
  final muteVal = false.obs;
  final playback = 4.obs;
  final currPos = 0.0.obs;
  var width = 0.0.obs;
  var showFrontSide = true.obs;
  var startPos = const Offset(0, 0).obs;
  var endPos = const Offset(0, 0).obs;
  var mywidgetkey = GlobalKey().obs;
  var caption = <Subtitle>[].obs;
  var metaData = const MediaItem(id: "", title: "").obs;
  final currIndex = 0.obs;
  final currDur = Duration.zero.obs;
  final subtitle = SubtitleController(
      provider: SubtitleProvider.fromNetwork(Uri.parse(
          "https://ott-2.s3.eu-north-1.amazonaws.com/Taylor-Swift-Love-Story.srt")));
  Rx<Subtitle?>? currentSubtitle;
  final playlist = ConcatenatingAudioSource(children: [
    AudioSource.uri(Uri.parse("https://pagalworldi.com/files/download/id/3025"),
        tag: MediaItem(
            id: "1",
            title: "Love Story",
            artist: "Taylor Swift",
            artUri: Uri.parse(
                "https://upload.wikimedia.org/wikipedia/en/0/01/Taylor_Swift_-_Love_Story.png"),
            duration: const Duration(minutes: 4, seconds: 45))),
    AudioSource.uri(
        Uri.parse(
            "https://pagalsong.in/uploads/systemuploads/mp3/Hum Dono (1961)/Abhi Na Jao Chhod Kar 128 Kbps.mp3"),
        tag: MediaItem(
            id: "2",
            title: "Abhi Na Jao Chhod Kar",
            artist: "Asha Bhosle, Mohammed Rafi",
            artUri: Uri.parse(
                "https://bajikaraoke.com/image/cache/catalog/karaoke/karaoke_2020/rafi/abhi_na_jao_chhod_kar-500x500.png"),
            duration: const Duration(minutes: 4, seconds: 45))),
    AudioSource.uri(
        Uri.parse(
            "https://pagalsong.in/uploads/systemuploads/mp3/Airlift/Soch Na Sake.mp3"),
        tag: MediaItem(
          id: "3",
          title: "Soch na sake",
          artist: "Arijit Singh",
          artUri: Uri.parse(
              "https://i.scdn.co/image/ab67616d0000b2736b047c1401c8c18a54e4377d"),
          duration: const Duration(minutes: 4, seconds: 45),
        )),
    AudioSource.uri(
        Uri.parse(
            "https://pagalfree.com/musics/128-Pal - Monsoon Shootout 128 Kbps.mp3"),
        tag: MediaItem(
            id: "4",
            title: "Pal - Monsoon Shootout",
            artist: "Arijit Singh",
            artUri: Uri.parse(
                "https://is5-ssl.mzstatic.com/image/thumb/Music125/v4/08/04/59/08045948-152f-725f-d980-b43b1dd29e42/191773930202.jpg/600x600bf-60.jpg"),
            duration: const Duration(minutes: 4, seconds: 45))),
  ]);
  @override
  void onInit() {
    // ignore: avoid_function_literals_in_foreach_calls
    playlist.children.forEach((element) =>
        bookmarks["${playlist.children.indexOf(element) + 1}"] = <Duration>[]);
    _init();
    super.onInit();
  }

  @override
  void onReady() {
    Get.find<BottomNavigationController>().displayNav.value = false;
    super.onReady();
  }

  void _init() async {
    await audioPlayer.value.setLoopMode(LoopMode.all);
    await audioPlayer.value
        .setAudioSource(playlist, initialIndex: 0, preload: true);
    audioPlayer.value.positionStream.listen((event) {
      print("----> Inside");
      if (caption.isNotEmpty) {
        currentSubtitle =
            getSubtitleForCurrentPosition(audioPlayer.value.position, caption)
                .obs;
        print("---->${currentSubtitle?.value?.data}");
      }
    });
  }

  Future<List<Subtitle>> getCloseCaptionFile(url) async {
    try {
      final data = await http.get(Uri.parse(url));
      final srtContent = data.body.toString();
      print(srtContent.length);
      print(srtContent.trim().length);
      var lines = srtContent.split('\n');
      // var subtitles = <String, String>{};
      // print("---->${lines.length}");
      List<Subtitle> subtitles = [];
      int index = 0;

      for (int i = 0; i < lines.length; i++) {
        final line = lines[i].trim();

        if (line.isEmpty) {
          continue;
        }

        if (int.tryParse(line) != null) {
          index = int.parse(line);
        } else if (line.contains('-->')) {
          final parts = line.split(' --> ');
          final start = parseDuration(parts[0]);
          final end = parseDuration(parts[1]);

          var data = lines[++i].trim();
          var j = i + 1;
          if (lines[j].isNotEmpty) {
            data += " ${lines[++i]}";
          }
          subtitles
              .add(Subtitle(index: index, start: start, end: end, data: data));
          print("---->${subtitles.length}");
        }
        // print("---->${subtitles[subtitles.length]}");
      }
      return subtitles;
    } catch (e) {
      debugPrint(e.toString());
      debugPrintStack();
    }
    return [];
  }

  Duration parseDuration(String s) {
    int hours = 0;
    int minutes = 0;
    int seconds;
    List<String> parts = s.split(':');
    if (parts.length > 2) {
      hours = int.parse(parts[parts.length - 3]);
    }
    if (parts.length > 1) {
      minutes = int.parse(parts[parts.length - 2]);
    }
    seconds = (double.parse(parts[parts.length - 1].split(",")[0])).round();
    // print("----->$hours $minutes $seconds");
    return Duration(hours: hours, minutes: minutes, seconds: seconds);
  }

  Subtitle? getSubtitleForCurrentPosition(Duration position, caption) {
    // print("----->${caption.value.length}");
    print("----> Called");
    for (var subtitle in caption.value) {
      if (position >= subtitle.start && position <= subtitle.end) {
        print("----->${subtitle.start}---${subtitle.end}");
        return subtitle;
      }
    }
    return null;
  }

  @override
  void onClose() {
    Get.find<BottomNavigationController>().displayNav.value = true;
    audioPlayer.value.dispose();
    super.onClose();
  }

  void changeIndex(currIndex, duration) async {
    await audioPlayer.value.setAudioSource(playlist,
        initialIndex: currIndex, preload: true, initialPosition: duration);
  }

  void findWidth(GlobalKey widgetkey) {
    var box = widgetkey.currentContext?.findRenderObject() as RenderBox;
    width.value = box.size.width;
  }

  List<Widget> getBookmarks(metaData, position, widgetkey) {
    try {
      List<Widget> data = bookmarks[metaData?.id]!.map((bookmark) {
        findWidth(widgetkey);
        double bookmarkPosition = bookmark.inSeconds.toDouble();
        double bookmarkWidth = (bookmarkPosition /
                audioPlayer.value.duration!.inSeconds.toDouble()) *
            width.value;
        return GestureDetector(
          onTap: () => audioPlayer.value.seek(bookmark),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                width: 11.5.w,
                height: 20.0,
                margin: EdgeInsets.only(left: bookmarkWidth),
                // decoration: const BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage(
                //             "assets/PlaylistAssets/pin.png"))),
                child: SvgPicture.asset("assets/HomeAssets/pin.svg",
                    // color: bookmark.inSeconds >=
                    //         position!.position.inSeconds
                    //     ? Colors.white
                    //     : Colors.red,
                    theme: SvgTheme(
                      currentColor:
                          bookmark.inSeconds >= position!.position.inSeconds
                              ? Colors.white
                              : primaryColor,
                    )),
              ),
              Text(
                "${bookmarkPosition.toInt().toString()}s",
                style: GoogleFonts.poppins(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: whiteColor),
              )
            ],
          ),
        );
      }).toList();
      return data;
    } catch (e) {
      return [];
    }
  }
}
