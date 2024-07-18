// ignore_for_file: library_private_types_in_public_api

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'game_controller.dart';
import 'wheel_of_fortune.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GameController gameController = Get.find();

    Widget buildScoreCard(
        String teamName, int score, Color color, bool isCurrentTurn) {
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isCurrentTurn ? 160 : 140,
        height: isCurrentTurn ? 140 : 120,
        decoration: BoxDecoration(
          color: color.withOpacity(0.8),
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: isCurrentTurn
                  ? Colors.yellow.withOpacity(0.4)
                  : Colors.black38,
              blurRadius: 15,
              spreadRadius: isCurrentTurn ? 5 : 2,
            ),
          ],
          border: isCurrentTurn
              ? Border.all(
                  color: Colors.yellow.withOpacity(0.7),
                  width: Material.defaultSplashRadius * 0.24)
              : null,
        ),
        child: Stack(
          children: [
            if (isCurrentTurn)
              const Positioned.fill(
                child: SparklesAnimation(),
              ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    teamName,
                    style: GoogleFonts.poppins(
                      fontSize: isCurrentTurn ? 24 : 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$score',
                    style: GoogleFonts.poppins(
                      fontSize: isCurrentTurn ? 20 : 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withBlue(80),
              const Color.fromARGB(255, 1, 3, 5),
            ],
            stops: const [0.1, 0.7],
            transform: const GradientRotation(pi * 200),
          ),
        ),
        child: Stack(
          children: [
            const Positioned.fill(
              child: SparklesAnimation(),
            ),
            SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const WheelOfFortune(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Obx(() => buildScoreCard(
                          'Team 1',
                          gameController.teamScores[0],
                          Colors.red[600]!,
                          gameController.currentTeam.value == 0)),
                      Obx(() => buildScoreCard(
                          'Team 2',
                          gameController.teamScores[1],
                          Colors.green[600]!,
                          gameController.currentTeam.value == 1)),
                      Obx(() => buildScoreCard(
                          'Team 3',
                          gameController.teamScores[2],
                          Colors.blue[600]!,
                          gameController.currentTeam.value == 2)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SparklesAnimation extends StatefulWidget {
  const SparklesAnimation({super.key});

  @override
  _SparklesAnimationState createState() => _SparklesAnimationState();
}

class _SparklesAnimationState extends State<SparklesAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
          milliseconds: 10000), // Increased duration for slower animation
      lowerBound: 0.0,
      upperBound: 1.0,
    )..repeat(reverse: true); // Repeat animation infinitely

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return CustomPaint(
          painter: SparklesPainter(animationValue: _animation.value),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the AnimationController to prevent memory leaks
    super.dispose();
  }
}

class SparklesPainter extends CustomPainter {
  final double animationValue;

  SparklesPainter({required this.animationValue}) : super(repaint: null);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.yellow.withOpacity(0.8)
      ..style = PaintingStyle.fill;

    final random = Random();

    for (int i = 0; i < 20; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = 1 + random.nextDouble() * 2;
      final sparkleOpacity =
          (animationValue * 0.5) + 0.5; // 0.5 to 1.0 opacity range
      paint.color = Colors.yellow.withOpacity(sparkleOpacity);
      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
