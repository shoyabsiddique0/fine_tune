import 'package:fine_tune/Pages/HomePage/PlaylistPage/playlist_screen.dart';
import 'package:fine_tune/Pages/HomePage/RecentlyPlayedPage/recently_played_screen.dart';
import 'package:fine_tune/Pages/HomePage/home_screen.dart';
import 'package:fine_tune/Pages/ProfilePage/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeWrapper extends StatelessWidget {
  final RxInt index;
  const HomeWrapper({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: index.value,
        children: const [
          HomeScreen(),
          PlaylistScreen(),
          RecentlyPlayedScreen(),
          ProfileScreen()
        ],
      ),
    );
  }
}
