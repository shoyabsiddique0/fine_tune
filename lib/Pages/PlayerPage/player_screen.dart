import 'package:fine_tune/Widgets/PlayerWidgets/player.dart';
import 'package:flutter/material.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1c1b1b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Player(index: 0, duration: Duration.zero)
          ],
        ),
      ),
    );
  }
}
