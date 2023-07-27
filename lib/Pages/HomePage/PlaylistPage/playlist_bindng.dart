import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_controller.dart';
import 'package:get/get.dart';

class PlaylistBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PlaylistController());
  }
}
