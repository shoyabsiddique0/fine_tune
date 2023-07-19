import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xff007AEA).withOpacity(0.5),
              Color(0xff052931)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            height: double.infinity,
            width: double.infinity,
          ),
          Container(
            height: 378.h,
            decoration: BoxDecoration(
                backgroundBlendMode: BlendMode.plus,
                image: DecorationImage(
                  image: Image.asset(
                    "assets/AuthAssets/Bg.png",
                    fit: BoxFit.fitHeight,
                    height: 400.h,
                  ).image,
                ),
                gradient: LinearGradient(colors: [
                  Color(0xff103035).withOpacity(0.5),
                  Colors.transparent
                ], stops: [
                  0,
                  0.3
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
            // child: Image.asset(
            //   "assets/AuthAssets/Bg.png",
            //   fit: BoxFit.fitHeight,
            //   colorBlendMode: BlendMode.softLight,
            // ),
          ),
        ],
      ),
    );
  }
}
