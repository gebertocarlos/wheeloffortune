Wheel of Fortune Game

This is a Wheel of Fortune game built using Flutter and GetX for state management. It is designed to be played with students in a classroom setting. The game involves spinning a wheel to earn points, with special segments like "LOSE TURN" and "BANKRUPT". The game keeps track of scores for three teams.

Features

Spin the Wheel: Players can spin the wheel to earn points.
Answer Dialog: After each spin, players are prompted to answer a question to determine if they should keep the points.
Confetti Animation: A confetti animation is displayed for correct answers.
Special Segments: The wheel includes special segments like "LOSE TURN" and "BANKRUPT".
Three Teams: The game supports three teams and keeps track of their scores.
Responsive UI: The UI is designed to be responsive and visually appealing.
Getting Started

Prerequisites
Flutter SDK: Install Flutter
Dart SDK: Install Dart
Installation
Clone the Repository:

sh
Copy code
git clone https://github.com/gebertocarlos/wheeloffortune.git
cd wheeloffortune
Install Dependencies:

sh
Copy code
flutter pub get
Run the App:

sh
Copy code
flutter run
Project Structure

lib: Contains the main application code.
main.dart: The entry point of the application.
wheel_of_fortune.dart: The main widget for the Wheel of Fortune game.
game_controller.dart: Contains the GameController class for managing the game state.
How to Play

Start the Game: Run the application and start the game.
Spin the Wheel: Press the "Spin" button to spin the wheel.
Answer the Question: After the wheel stops, answer the question to determine if you keep the points.
Next Team: The turn moves to the next team.
Special Segments: If the wheel lands on "LOSE TURN" or "BANKRUPT", special rules apply.
Customization

Wheel Values: Modify the wheelValues list in game_controller.dart to change the segments on the wheel.
Team Count: The game currently supports three teams. You can modify the teamScores list and related logic in game_controller.dart to support more or fewer teams.
UI Styling: Customize the UI elements in wheel_of_fortune.dart to match your preferences.
Credits

Flutter: Flutter.dev
GetX: GetX Package
Confetti: Confetti Package
Flutter Fortune Wheel: Flutter Fortune Wheel Package

