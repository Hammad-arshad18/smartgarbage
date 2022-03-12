import 'package:flutter/material.dart';

Widget GetOnBoard({required image, required title, required text, required context}) {
  return Container(
    child: Column(
      children: [
        Text(text),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
      ],
    ),
  );
}
