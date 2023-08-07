import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:fine_tune/Pages/PlayerPage/player_controller.dart';
import 'package:get/get.dart';

class BottomNavigationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavigationController());
    Get.lazyPut(() => PlayerController());
  }
}
