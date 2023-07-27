import 'package:fine_tune/Pages/ProfilePage/MyListPage/my_list_controller.dart';
import 'package:get/get.dart';

class MyListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyListController());
  }
}
