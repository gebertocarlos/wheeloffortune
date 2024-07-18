# Wheel of Fortune Game

This is a Wheel of Fortune game built using Flutter and GetX for state management. It is designed to be played with students in a classroom setting. The game involves spinning a wheel to earn points, with special segments like "LOSE TURN" and "BANKRUPT". The game keeps track of scores for three teams.

## Features

- **Spin the Wheel**: Players can spin the wheel to earn points.
- **Answer Dialog**: After each spin, players are prompted to answer a question to determine if they should keep the points.
- **Confetti Animation**: A confetti animation is displayed for correct answers.
- **Special Segments**: The wheel includes special segments like "LOSE TURN" and "BANKRUPT".
- **Three Teams**: The game supports three teams and keeps track of their scores.
- **Responsive UI**: The UI is designed to be responsive and visually appealing.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install): Install Flutter
- [Dart SDK](https://dart.dev/get-dart): Install Dart

### Installation

1. **Clone the Repository:**

    ```sh
    git clone https://github.com/gebertocarlos/wheeloffortune.git
    cd wheeloffortune
    ```

2. **Install Dependencies:**

    ```sh
    flutter pub get
    ```

3. **Run the App:**

    ```sh
    flutter run

# How to Play

### Start the Game
Run the application and start the game.

### Spin the Wheel
Press the "Spin" button to spin the wheel.

### Answer the Question
After the wheel stops, answer the question to determine if you keep the points.

### Next Team
The turn moves to the next team.

### Special Segments
If the wheel lands on "LOSE TURN" or "BANKRUPT", special rules apply.

# Customization

### Wheel Values
Modify the `wheelValues` list in `game_controller.dart` to change the segments on the wheel.

### Team Count
The game currently supports three teams. You can modify the `teamScores` list and related logic in `game_controller.dart` to support more or fewer teams.

### UI Styling
Customize the UI elements in `wheel_of_fortune.dart` to match your preferences.

# Credits

- **Flutter:** [Flutter.dev](https://flutter.dev)
- **GetX:** [GetX Package](https://pub.dev/packages/get)
- **Confetti:** [Confetti Package](https://pub.dev/packages/confetti)
- **Flutter Fortune Wheel:** [Flutter Fortune Wheel Package](https://pub.dev/packages/flutter_fortune_wheel)
