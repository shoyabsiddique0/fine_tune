import 'package:fine_tune/Pages/LibraryPage/library_screen.dart';
import 'package:fine_tune/Pages/ProfilePage/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibraryWrapper extends StatelessWidget {
  final RxInt index;
  const LibraryWrapper({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: index.value,
        children: const [LibraryScreen(), ProfileScreen()],
      ),
    );
  }
}
