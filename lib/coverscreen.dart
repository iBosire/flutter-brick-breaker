import 'package:flutter/material.dart';

class Coverscreen extends StatelessWidget {
  final bool gameStarted;

  const Coverscreen({super.key, required this.gameStarted});

  @override
  Widget build(BuildContext context) {
    return gameStarted
        ? Container()
        : Container(
            alignment: Alignment(0, -0.2),
            child: const Text(
              'Tap to start',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          );
  }
}
