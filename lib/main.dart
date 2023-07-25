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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return SafeArea(
        child: GetMaterialApp(
          getPages: AppPage.getPages,
          initialRoute: AppRoute.loginScreen,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.blue,
            brightness: Brightness.light,
          ),
        ),
      );
    });
  }
}
