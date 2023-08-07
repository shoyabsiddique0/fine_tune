import 'package:fine_tune/Pages/PlayerPage/player_view_controller.dart';
import 'package:get/get.dart';

class PlayerBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => PlayerViewController());
  }
}