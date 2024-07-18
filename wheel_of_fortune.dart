import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:confetti/confetti.dart';
import 'game_controller.dart';

class WheelOfFortune extends StatefulWidget {
  const WheelOfFortune({super.key});

  @override
  WheelOfFortuneState createState() => WheelOfFortuneState();
}

class WheelOfFortuneState extends State<WheelOfFortune> {
  final StreamController<int> _controller = StreamController<int>();
  late final ConfettiController _confettiController;
  late final GameController _gameController;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
    _gameController = Get.find<GameController>();
  }

  @override
  void dispose() {
    _controller.close(); // Close the StreamController to prevent memory leaks
    _confettiController
        .dispose(); // Dispose of the ConfettiController to free up resources
    super.dispose();
  }

  void showAnswerDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white.withOpacity(0.95),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            'Was the answer correct?',
            style: TextStyle(
              color: Colors.blue[700],
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.help_outline,
                size: 60,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  icon: const Icon(Icons.close, color: Colors.white),
                  label: const Text('No',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    elevation: 5,
                  ),
                  onPressed: () {
                    _gameController.awardPoints(false);
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.check, color: Colors.white),
                  label: const Text('Yes',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    elevation: 5,
                  ),
                  onPressed: () {
                    _gameController.awardPoints(true);
                    _confettiController.play();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 550,
                width: 550,
                child: FortuneWheel(
                  selected: _controller.stream,
                  items: _buildFortuneItems(),
                  physics: _buildPhysics(),
                  animateFirst: false,
                  onAnimationEnd: () {
                    if (_gameController.wheelValues[
                                _gameController.selectedItem.value] !=
                            'LOSE TURN' &&
                        _gameController.wheelValues[
                                _gameController.selectedItem.value] !=
                            'BANKRUPT') {
                      showAnswerDialog();
                    } else {
                      _gameController.awardPoints(false);
                    }
                  },
                  indicators: [
                    FortuneIndicator(
                      alignment: Alignment.topCenter,
                      child: TriangleIndicator(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                  ],
                  styleStrategy: UniformStyleStrategy(
                    color: Colors.black,
                    borderWidth: Material.defaultSplashRadius * pi,
                    borderColor: Colors.black.withOpacity(0.7),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConfettiWidget(
                  confettiController: _confettiController,
                  blastDirectionality: BlastDirectionality.explosive,
                  blastDirection: pi / 2,
                  maxBlastForce: 60,
                  minBlastForce: 1,
                  emissionFrequency: 0.4,
                  numberOfParticles: 30,
                  gravity: 0.6,
                  shouldLoop: false,
                  colors: const [
                    Colors.red,
                    Colors.green,
                    Colors.blue,
                    Colors.yellow,
                    Colors.purple
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Obx(() => AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              transform: Matrix4.rotationZ(
                  _gameController.isSpinning.value ? pi / 18 : 0),
              child: ElevatedButton.icon(
                onPressed: () {
                  if (!_gameController.isSpinning.value) {
                    _gameController.spinWheel();
                    _controller.add(_gameController.selectedItem.value);
                  }
                },
                icon: const Icon(Icons.rotate_right, size: 24),
                label: const Text('Spin',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFF86F03),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 18),
                  elevation: 8,
                  shadowColor: Colors.orange.withOpacity(0.5),
                ),
              ),
            )),
        const SizedBox(height: 20),
      ],
    );
  }

  List<FortuneItem> _buildFortuneItems() {
    final List<String> items = [
      '10',
      '20',
      '30',
      '40',
      '50',
      '60',
      '70',
      '80',
      '90',
      '100',
      '200',
      'BANKRUPT',
      '300',
      'LOSE TURN'
    ];

    final List<Color> colors = [
      const Color(0xFFFFC107), // Bright Yellow
      const Color(0xFFFF5722), // Deep Orange
      const Color(0xFF4CAF50), // Green
      const Color(0xFF2196F3), // Blue
      const Color(0xFFFFEB3B), // Yellow
      const Color(0xFF9C27B0), // Purple
      const Color(0xFFE91E63), // Pink
      const Color(0xFF3F51B5), // Indigo
      const Color(0xFFFF9800), // Orange
      const Color(0xFF00BCD4), // Cyan
      const Color(0xFF8BC34A), // Light Green
      Colors.black, // Black for BANKRUPT
      const Color(0xFFCDDC39), // Lime
      Colors.red // Red for LOSE TURN
    ];

    return items.asMap().entries.map((entry) {
      final index = entry.key;
      final value = entry.value;

      return FortuneItem(
        child: Stack(
          children: [
            // Text with shadow
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                shadows: [
                  Shadow(
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.8),
                  ),
                ],
              ),
            ),
            // Main text with border
            Text(
              value,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    offset: const Offset(1, 1),
                    blurRadius: 1,
                    color: Colors.black.withOpacity(0.2),
                  ),
                ],
              ),
            ),
          ],
        ),
        style: FortuneItemStyle(
          color: colors[index], // Background color
          borderWidth: Material.defaultSplashRadius * 0.36,
          borderColor: Colors.white.withOpacity(0.2), // Border color
          textStyle: TextStyle(
            fontSize: 16, // Font size
            fontWeight: FontWeight.bold, // Font weight
            color: Colors.white, // Font color
            shadows: [
              Shadow(
                color: Colors.black.withOpacity(0.6), // Shadow color
                offset: const Offset(1, 1), // Shadow position
                blurRadius: 4, // Shadow blur radius
              ),
            ],
          ),
        ),
      );
    }).toList();
  }

  CircularPanPhysics _buildPhysics() {
    return CircularPanPhysics(
      duration: const Duration(seconds: 8),
      curve: Curves.easeOut,
    );
  }
}
