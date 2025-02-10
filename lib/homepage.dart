import 'dart:async';
import 'dart:developer';
import 'package:brick_breaker/ball.dart';
import 'package:brick_breaker/coverscreen.dart';
import 'package:brick_breaker/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  // focus node
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void startGame() {
    if(!_focusNode.hasFocus){
      _focusNode.requestFocus();
    }

    hasGameStarted = true;
    Timer.periodic(const Duration(milliseconds: 10), (timer) {
      setState(() {
        ballY += 0.01;
      });
    });
  }

  void moveLeft() {
    if (!(playerX - 0.1 <= -1)) {
      setState(() {
        playerX -= 0.1;
      });
    }
  }

  void moveRight() {
    if (!(playerX + 0.1 >= 1)) {
      setState(() {
        playerX += 0.1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardListener(
      focusNode: _focusNode,
      autofocus: true,
      onKeyEvent: (event) {
        if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
          log('left');
          moveLeft();
        } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
          log('right');
          moveRight();
        }
      },
      child: GestureDetector(
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
      ),
    );
  }
}
