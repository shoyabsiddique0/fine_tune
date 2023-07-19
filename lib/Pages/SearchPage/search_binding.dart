import 'package:fine_tune/Pages/SearchPage/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchScreenController());
  }
}
