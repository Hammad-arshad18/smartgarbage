import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1.0),
        title: Text(
          "smart garbage management".toUpperCase(),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 200.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromRGBO(143, 148, 251, 1.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/email.png"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Contact Us Here".toUpperCase(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                        fontSize: 20.0),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: const [
                  Icon(
                    Icons.location_on_outlined,
                    color: Colors.deepPurpleAccent,
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "University Of Sialkot\n1 km Daska Road Sialkot\nhttps://uskt.edu.pk/",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(
                    Icons.phone_android_outlined,
                    color: Colors.deepPurpleAccent,
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "+92-332-8432678\n+92-334-9522494",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Icon(
                    Icons.access_time_outlined,
                    color: Colors.deepPurpleAccent,
                    size: 30.0,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Monday - Friday\n9am - 5pm",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Saturday - Sunday\n9am - 12pm",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 17.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
