import 'package:fine_tune/Pages/HomePage/home_screen.dart';
import 'package:fine_tune/Pages/LibraryPage/library_screen.dart';
import 'package:fine_tune/Pages/PremiumPage/premium_screen.dart';
import 'package:fine_tune/Pages/SearchPage/search_screen.dart';
import 'package:fine_tune/Routes/app_route.dart';
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

  final Rx<bool> _showBottomNavBar = false.obs;
  bool get getShowBottomNavBarValue => _showBottomNavBar.value;
  set setShowBottomNavBarValue(bool val) => _showBottomNavBar.value = val;

  final Rx<int> _selectedIndex = 0.obs;
  int get getSelectedIndex => _selectedIndex.value;
  set setSelectedIndex(int val) => _selectedIndex.value = val;

  final List<String> _mainPageRoutes = [
    AppRoute.homeScreen,
    AppRoute.searchScreen,
    AppRoute.premiumScreen,
    AppRoute.libraryScreen
  ];
  var displayNav = false.obs;
  changePage(index) {
    Get.offAllNamed(_mainPageRoutes[index]);
    setSelectedIndex = index;
  }
}
