import 'package:carousel_slider/carousel_controller.dart';
import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
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
  var controller = CarouselController();
  var current = 0.obs;
  var pageController = PageController().obs;
  List continueList = [
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: true,
    ),
    CardView(
      name: "Ramayan",
      episode: "Ep 3/20",
      image: "assets/HomeAssets/card.png",
      action: () => Get.find<BottomNavigationController>().homeIndex.value = 1,
      isWatched: true,
    )
  ].obs;
  List featuredList = [
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
