import 'package:fine_tune/Pages/AboutUs/about_us_controller.dart';
import 'package:get/get.dart';

class TnCBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AboutUsController());
  }
}
