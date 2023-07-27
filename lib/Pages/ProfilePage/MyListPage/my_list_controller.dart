import 'package:fine_tune/Widgets/LibraryWidget/watchlist_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyListController extends GetxController {
  var searchEdit = TextEditingController().obs;
  var currentVal = 0.obs;
  var sort = ["Title", "Artist", "Album", "Recently Added"].obs;
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
}
