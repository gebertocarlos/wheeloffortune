import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';
import 'game_controller.dart';

void main() {
  // Register GameController with GetX
  Get.put(GameController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Wheel of Fortune Game',
      home: HomeScreen(),
    );
  }
}
