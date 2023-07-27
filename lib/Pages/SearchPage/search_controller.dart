import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreenController extends GetxController {
  var searchEdit = TextEditingController().obs;
  var recentList = [
    {
      "title": "Alice Wonder",
      "type": "Artist",
      "image": "assets/HomeAssets/artistCard.png",
    },
    {
      "title": "Alice Wonder",
      "type": "Artist",
      "image": "assets/HomeAssets/artistCard.png",
    },
    {
      "title": "Alice Wonder",
      "type": "Artist",
      "image": "assets/HomeAssets/artistCard.png",
    },
    {
      "title": "Alice Wonder",
      "type": "Artist",
      "image": "assets/HomeAssets/artistCard.png",
    },
    {
      "title": "Alice Wonder",
      "type": "Artist",
      "image": "assets/HomeAssets/artistCard.png",
    },
  ].obs;
}
