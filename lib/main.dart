import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:project_ebusiness/bottom_navigasi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 250,
        duration: 3000,
        splash: 'assets/image/cokro teks.png',
        nextScreen: BottomScreen(),
        // splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Color(0XFF9B4B26),
      ),
    );
  }
}
