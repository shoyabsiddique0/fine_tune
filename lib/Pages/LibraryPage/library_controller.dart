import 'package:fine_tune/Widgets/HomeWidget/card_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryController extends GetxController {
  var searchEdit = TextEditingController().obs;
  var groupValue = "A to Z".obs;
  var sort = [
    {
      "title": "A to Z",
      "value": "A to Z",
    },
    {
      "title": "Z to A",
      "value": "Z to A",
    },
    {
      "title": "Recently Watched",
      "value": "Recently Watched",
    },
  ].obs;
  List recentList = [
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Soulful Arijit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/trendingCard.png",
      action: () {},
      isWatched: false,
    ),
  ].obs;
  List featuredList = [
    CardView(
      name: "Ariana's Hit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/ariana.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Ariana's Hit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/ariana.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Ariana's Hit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/ariana.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Ariana's Hit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/ariana.png",
      action: () {},
      isWatched: false,
    ),
    CardView(
      name: "Ariana's Hit",
      episode: "20:45 mins",
      image: "assets/HomeAssets/ariana.png",
      action: () {},
      isWatched: false,
    ),
  ].obs;
}
