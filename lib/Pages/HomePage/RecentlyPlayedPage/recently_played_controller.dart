import 'package:fine_tune/Widgets/LibraryWidget/watchlist_card.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
class RecentlyPlayerController extends GetxController{
  var searchEdit = TextEditingController().obs;
  var sort = [
    "Title",
    "Artist",
    "Album",
    "Recently Added"
  ];
  Map<DateTime, List<WatchlistCard>> recentPlayed = {
    DateTime(2023, 07, 29) : [
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
    ],
    DateTime(2023, 07, 28) : [
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
    ],
    DateTime(2023, 07, 27) : [
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
    ],
    DateTime(2023, 07, 26) : [
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
    ],
  };
  var currentVal = 0.obs;
}