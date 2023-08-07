import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_binding.dart';
import 'package:fine_tune/Pages/BottomNavigationBar/bottom_navigation_screen.dart';
import 'package:fine_tune/Routes/app_page.dart';
import 'package:fine_tune/Routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return SafeArea(
        child: GetMaterialApp(
          getPages: AppPage.getPages,
          initialBinding: BottomNavigationBinding(),
          initialRoute: AppRoute.loginScreen,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
            brightness: Brightness.light,
          ),
          builder: (context, child) {
            // if (Get.currentRoute == AppRoute.otpScreen ||
            //     Get.currentRoute == AppRoute.loginScreen ||
            //     Get.currentRoute == "") {
            //   return child!;
            // }
            return Overlay(
              initialEntries: [
                OverlayEntry(
                  builder: (context) => Stack(
                    alignment: Alignment.bottomCenter,
                    children: [child!, const BottomNavigationScreen()],
                  ),
                )
              ],
            );
          },
        ),
      );
    });
  }
}
