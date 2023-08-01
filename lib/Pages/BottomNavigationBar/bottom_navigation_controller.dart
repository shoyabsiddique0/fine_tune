import 'package:fine_tune/Pages/PremiumPage/premium_screen.dart';
import 'package:fine_tune/Pages/SearchPage/search_screen.dart';
import 'package:fine_tune/Wrappers/home_wrapper.dart';
import 'package:fine_tune/Wrappers/library_wrapper.dart';
import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  final pageIndex = 0.obs;
  final homeIndex = 0.obs;
  final libIndex = 0.obs;
  final pages = [].obs;
  @override
  void onInit() {
    pages.value = [
      HomeWrapper(index: homeIndex),
      const SearchScreen(),
      // Text(""),
      const PremiumScreen(),
      LibraryWrapper(index: libIndex)
    ].obs;
    super.onInit();
  }
}
