import 'dart:async';
import 'package:brick_breaker/ball.dart';
import 'package:brick_breaker/coverscreen.dart';
import 'package:brick_breaker/player.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // ball coordinates
  double ballX = 0;
  double ballY = 0;

  // game settings
  bool hasGameStarted = false;

  // player variables
  double playerX = 0;
  double playerWidth = 0.5;

  void startGame() {
    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        ballX += 0.01;
        ballY -= 0.01;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: startGame,
      child: Scaffold(
        backgroundColor: Colors.teal,
        body: Center(
          child: Stack(
            children: [
              // tap to start
              Coverscreen(gameStarted: hasGameStarted),
              // ball
              MyBall(ballX: ballX, ballY: ballY),
              // player
              MyPlayer(playerX: playerX, playerWidth: playerWidth),
            ],
          ),
        ),
      ),
    );
  }
}