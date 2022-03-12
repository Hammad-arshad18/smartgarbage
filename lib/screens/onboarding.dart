import 'package:flutter/material.dart';
import 'package:smartgarbage/components/getonboardscreen.dart';

class OnBoardingScreen extends StatelessWidget {
  // const OnBoardingScreen({Key? key}) : super(key: key);
  final _pagecontroller = PageController();
  List<Map<String, String>> data = [
    {
      "title": "Garbage",
      "text": "Welcome to Tokoto, Let’s shop!",
      "image": "assets/images/splash_1.png"
    },
    {
      "title": "Garbage",
      "text":
          "We help people conect with store \naround United State of America",
      "image": "assets/images/splash_2.png"
    },
    {
      "title": "Garbage",
      "text": "We show the easy way to shop. \nJust stay at home with us",
      "image": "assets/images/splash_3.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pagecontroller,
      itemCount: data.length,
      itemBuilder: (context, index) => GetOnBoard(
        image: data[index]['image'],
        title: data[index]['title'],
        text: data[index]['text'],
        context: context,
      ),
    );
  }
}
