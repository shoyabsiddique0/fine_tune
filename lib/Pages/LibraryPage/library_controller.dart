import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Widgets/HomeWidget/card_view.dart';
import 'package:fine_tune/Widgets/LibraryWidget/watchlist_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var searchEdit = TextEditingController().obs;
  var currentVal = 0.obs;
  var sort = ["Title", "Artist", "Album", "Recently Added"].obs;
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
  var likedList = [
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
  ].obs;
  var podcastList = [
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: false),
  ].obs;
  var downloadList = [
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: true),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: true),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: true),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: true),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: true),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: true),
    const WatchlistCard(
        title: "Sampoorna Ramayana",
        imageLink: "assets/HomeAssets/liked.png",
        duration: "Shreya Ghoshal, Salim - Sulaiman",
        left: "4:41",
        isDownloads: true),
  ].obs;
  late TabController tabController;
  @override
  void onInit() {
    // TODO: implement onInit
    tabController = TabController(length: 3, vsync: this);
    super.onInit();
  }
}
