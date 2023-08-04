import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Widgets/LibraryWidget/watchlist_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:subtitle/subtitle.dart';

class PlaylistController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var castList = [
    {
      "name": "Ariana Grande",
      "imageLink": "assets/HomeAssets/ariana.png",
      "artist": "Voice Artist"
    },
    {
      "name": "Ariana Grande",
      "imageLink": "assets/HomeAssets/ariana.png",
      "artist": "Voice Artist"
    },
    {
      "name": "Ariana Grande",
      "imageLink": "assets/HomeAssets/ariana.png",
      "artist": "Voice Artist"
    },
    {
      "name": "Ariana Grande",
      "imageLink": "assets/HomeAssets/ariana.png",
      "artist": "Voice Artist"
    },
    {
      "name": "Ariana Grande",
      "imageLink": "assets/HomeAssets/ariana.png",
      "artist": "Voice Artist"
    },
    {
      "name": "Ariana Grande",
      "imageLink": "assets/HomeAssets/ariana.png",
      "artist": "Voice Artist"
    },
  ];
  var bookmarkList = [
    Duration(minutes: 2, seconds: 10),
    Duration(minutes: 2, seconds: 10),
    Duration(minutes: 2, seconds: 10),
    Duration(minutes: 2, seconds: 10),
    Duration(minutes: 2, seconds: 10),
    Duration(minutes: 2, seconds: 10),
    Duration(minutes: 2, seconds: 10),
    Duration(minutes: 2, seconds: 10),
  ];
  var moreList = [
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
    {
      "title": "Radha Krishna",
      "episodes": "20 Episodes",
      "imageLink": "assets/HomeAssets/radhaKrishna.png"
    },
  ];
  var episodeList = [
    WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        onTap: () => Get.toNamed(AppRoute.playerScreen),
        isDownloads: false),
    WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        onTap: () => Get.toNamed(AppRoute.playerScreen),
        left: "4:41",
        isDownloads: false),
    WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        onTap: () => Get.toNamed(AppRoute.playerScreen),
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        onTap: () => Get.toNamed(AppRoute.playerScreen),
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        onTap: () => Get.toNamed(AppRoute.playerScreen),
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        onTap: () => Get.toNamed(AppRoute.playerScreen),
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
  ].obs;
  @override
  void onInit() async {
    tabController = TabController(length: 4, vsync: this);
    var url = Uri.parse(
        'https://brenopolanski.github.io/html5-video-webvtt-example/MIB2-subtitles-pt-BR.vtt');
    var controller = SubtitleController(
        provider: SubtitleProvider.fromNetwork(
      url,
      type: SubtitleType.vtt,
    ));
    print(controller.initialized);
    await controller.initial();
    print(controller.initialized);
    print(controller.subtitles);
    printResult(controller.subtitles);
    super.onInit();
  }

  void printResult(List<Subtitle> subtitles) {
    subtitles.sort((s1, s2) => s1.compareTo(s2));
    for (var result in subtitles) {
      print(
          '--->(${result.index}) Start: ${result.start}, end: ${result.end} [${result.data}]');
    }
  }
}
