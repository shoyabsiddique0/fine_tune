import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Pages/HomePage/home_controller.dart';
import 'package:fine_tune/Pages/LibraryPage/library_controller.dart';
import 'package:fine_tune/Pages/PremiumPage/premium_controller.dart';
import 'package:fine_tune/Pages/SearchPage/search_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => PremiumController());
    Get.lazyPut(() => LibraryController());
    Get.lazyPut(() => SearchScreenController());
  }
}
