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
    ```

## Project Structure

```plaintext
lib
├── main.dart             # Entry point of the application
├── wheel_of_fortune.dart # Main widget for the Wheel of Fortune game
└── game_controller.dart  # Contains the GameController class for managing the game state
