import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartgarbage/screens/home.dart';
import 'package:smartgarbage/screens/register.dart';
import 'package:smartgarbage/screens/login.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(
        navigateRoute: Login(),
        duration: 3000,
        imageSize: 100,
        imageSrc: 'assets/images/Logo.png',
        text: "SMART GARBAGE",
        textType: TextType.ColorizeAnimationText,
        textStyle: const TextStyle(fontSize: 40.0),
        colors: const [
          Colors.purple,
          Colors.blue,
          Colors.yellow,
          Colors.red,
        ],
        backgroundColor: Colors.grey[300],
      ),
      routes: {
        Login.id: (context) => Login(),
        Register.id: (context) => Register(),
        HomePage.id: (context) => HomePage(),
      },
    ),
  );
}
