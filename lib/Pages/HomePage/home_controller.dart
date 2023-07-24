import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<Widget> carousel = [
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
    Image.asset("assets/HomeAssets/image.png"),
  ];
  var controller = CarouselController();
  var current = 0.obs;
}
