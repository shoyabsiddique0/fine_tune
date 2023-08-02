import 'package:fine_tune/Pages/HomePage/home_screen.dart';
import 'package:fine_tune/Pages/LibraryPage/library_screen.dart';
import 'package:fine_tune/Pages/PremiumPage/premium_screen.dart';
import 'package:fine_tune/Pages/SearchPage/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final pageIndex = 0.obs;
  final homeIndex = 0.obs;
  final libIndex = 0.obs;
  final pages = <Widget>[].obs;
  @override
  void onInit() {
    pages.value = [
      const HomeScreen(),
      const SearchScreen(),
      // Text(""),
      const PremiumScreen(),
      const LibraryScreen()
    ].obs;
    super.onInit();
  }
}
