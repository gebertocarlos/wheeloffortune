# Wheel of Fortune Game

This is a Flutter-based Wheel of Fortune game built to play with students at school. It features a spinning wheel with various point values, a confetti animation for correct answers, and a scoreboard to keep track of team scores.

## Features

- **Spinning Wheel**: Spin the wheel to land on different point values or special items like "LOSE TURN" and "BANKRUPT".
- **Confetti Animation**: Celebrate correct answers with a burst of confetti.
- **Scoreboard**: Keep track of scores for three teams.
- **Interactive Dialogs**: Confirm whether the answer was correct or not with a custom dialog.

## Technologies Used

- **Flutter**: The framework used to build the application.
- **GetX**: Used for state management.
- **flutter_fortune_wheel**: Used to create the spinning wheel.
- **confetti**: Used to show confetti animation.

## Installation

1. **Clone the Repository**:
   ```sh
   git clone https://github.com/yourusername/wheeloffortune.git
   cd wheeloffortune

2. Install Dependencies:

sh
Copy code
flutter pub get
Run the App:

sh
Copy code
flutter run
Usage

Spin the Wheel: Press the "Spin" button to spin the wheel.
Answer Confirmation: After the wheel stops, a dialog will prompt you to confirm if the answer was correct.
Track Scores: The scoreboard will automatically update based on the wheel's outcome and your input.
Game Rules

Point Values: The wheel contains various point values ranging from 10 to 300.
Special Items:
LOSE TURN: The team loses their turn without gaining points.
BANKRUPT: The team's score resets to 0.
Answer Validation: After each spin, confirm if the answer was correct to award points.
Team Rotation: The game supports three teams and rotates turns between them.
Screenshots

Add screenshots of your app here.

Contributing

If you would like to contribute to this project, please follow these steps:

Fork the Repository:

sh
Copy code
git clone https://github.com/yourusername/wheeloffortune.git
Create a New Branch:

sh
Copy code
git checkout -b feature-branch
Make Changes and Commit:

sh
Copy code
git commit -m "Add your message here"
Push to the Branch:

sh
Copy code
git push origin feature-branch
Create a Pull Request: Go to the repository on GitHub and create a pull request.

License

This project is licensed under the MIT License. See the LICENSE file for details.

Acknowledgments

Thanks to the Flutter and Dart community for their great tools and packages.
Special thanks to my students for being enthusiastic participants in testing this game.
This game was built to provide an interactive and fun way to engage with students in a classroom setting.

