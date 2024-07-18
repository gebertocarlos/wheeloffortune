import 'package:get/get.dart';
import 'dart:math';

class GameController extends GetxController {
  final currentTeam = 0.obs;
  final teamScores = [0, 0, 0].obs; // Changed to accommodate 3 teams
  final List<String> wheelValues = [
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
  ]; // Expanded values
  final selectedItem = 0.obs;
  final isSpinning = false.obs;
  final points = 0.obs; // New variable to track current spin points

  void spinWheel() {
    if (isSpinning.value) return;

    isSpinning.value = true;
    final random = Random();
    final randomIndex = random.nextInt(wheelValues.length);
    selectedItem.value = randomIndex;
    points.value = wheelValues[randomIndex] == 'LOSE TURN' ||
            wheelValues[randomIndex] == 'BANKRUPT'
        ? 0
        : int.parse(wheelValues[randomIndex]);

    if (wheelValues[randomIndex] != 'LOSE TURN' &&
        wheelValues[randomIndex] != 'BANKRUPT') {
      Future.delayed(const Duration(seconds: 5), () {
        isSpinning.value = false;
      });
    }
  }

  void awardPoints(bool correct) {
    if (wheelValues[selectedItem.value] == 'LOSE TURN') {
    } else if (wheelValues[selectedItem.value] == 'BANKRUPT') {
      teamScores[currentTeam.value] = 0;
    } else if (correct) {
      updateScore(points.value);
    } else {}

    isSpinning.value = false;
    points.value = 0; // Reset points for next spin
    nextTeam();
  }

  void updateScore(int newPoints) {
    teamScores[currentTeam.value] += newPoints;
  }

  void nextTeam() {
    currentTeam.value = (currentTeam.value + 1) % 3; // Updated for 3 teams
  }

  String getCurrentTeamName() {
    return 'Team ${currentTeam.value + 1}';
  }

  int getCurrentTeamScore() {
    return teamScores[currentTeam.value];
  }

  void resetGame() {
    currentTeam.value = 0;
    teamScores.assignAll([0, 0, 0]); // Updated for 3 teams
    selectedItem.value = 0;
    isSpinning.value = false;
    points.value = 0;
  }
}
