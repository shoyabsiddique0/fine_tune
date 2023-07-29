import 'package:fine_tune/Pages/HomePage/RecentlyPlayedPage/recently_played_controller.dart';
import 'package:get/get.dart';

class RecentlyPlayedBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RecentlyPlayerController());
  }
}