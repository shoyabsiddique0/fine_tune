import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_controller.dart';
import 'package:get/get.dart';

class PlayerViewController extends GetxController{
  @override
  void onReady() {
    Get.find<BottomNavigationController>().displayNav.value = false;
    super.onReady();
  }
  @override
  void onClose() {
    Get.find<BottomNavigationController>().displayNav.value = true;
    super.onClose();
  }
}