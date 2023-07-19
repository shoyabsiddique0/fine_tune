import 'package:fine_tune/Pages/AuthPage/LoginPage/login_binding.dart';
import 'package:fine_tune/Pages/AuthPage/LoginPage/login_screen.dart';
import 'package:fine_tune/Pages/AuthPage/OtpPage/otp_binding.dart';
import 'package:fine_tune/Pages/AuthPage/OtpPage/otp_screen.dart';
import 'package:fine_tune/Pages/HomePage/home_binding.dart';
import 'package:fine_tune/Pages/HomePage/home_screen.dart';
import 'package:fine_tune/Pages/SearchPage/search_binding.dart';
import 'package:fine_tune/Pages/SearchPage/search_screen.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:get/get.dart';

class AppPage {
  static final List<GetPage> getPages = [
    GetPage(
        name: AppRoute.loginScreen,
        page: () => LoginScreen(),
        binding: LoginBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.otpScreen,
        page: () => OtpScreen(),
        binding: OtpBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.homeScreen,
        page: () => HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.rightToLeft),
    GetPage(
        name: AppRoute.searchScreen,
        page: () => SearchScreen(),
        binding: SearchBinding(),
        transition: Transition.rightToLeft),
  ];
}
