import 'package:carousel_slider/carousel_controller.dart';
import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_screen.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:fine_tune/Widgets/HomeWidget/card_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Widget> carousel = [
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
  ];
  @override
  void onReady() {
    Get.find<BottomNavigationController>().displayNav.value = true;
    super.onReady();
  }

  var controller = CarouselController();
  var current = 0.obs;
  var pageController = PageController().obs;
  List continueList = [
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Navigator.of(Get.context!)
          .push(MaterialPageRoute(builder: (context) => PlaylistScreen())),
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.toNamed(AppRoute.playlistScreen),
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.toNamed(AppRoute.playlistScreen),
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.toNamed(AppRoute.playlistScreen),
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.toNamed(AppRoute.playlistScreen),
      isWatched: true,
    )
  ].obs;
  List featuredList = [
    CardView(
      name: "Divide",
      episode: "20:45 mins",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.toNamed(AppRoute.playlistScreen),
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20:45 mins",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20:45 mins",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20:45 mins",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20:45 mins",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
  ].obs;
  List trendingList = [
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
  ].obs;
  List topList = [
    CardView(
      name: "Divide",
      episode: "20 Episodes",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20 Episodes",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20 Episodes",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20 Episodes",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
    CardView(
      name: "Divide",
      episode: "20 Episodes",
      image: "assets/HomeAssets/featuredCard.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: false,
    ),
  ].obs;
}
