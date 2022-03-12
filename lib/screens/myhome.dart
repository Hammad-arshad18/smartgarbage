import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartgarbage/screens/about.dart';
import 'package:smartgarbage/screens/camera.dart';
import 'package:smartgarbage/screens/contact.dart';
import 'package:smartgarbage/screens/employee_month.dart';
import 'package:smartgarbage/screens/employee_year.dart';
import 'package:smartgarbage/screens/map.dart';
import 'package:smartgarbage/screens/profile.dart';
import 'package:badges/badges.dart';
import 'package:status_alert/status_alert.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  Widget _services({required s_image, required s_text, onTap}) {
    return InkWell(
      splashColor: Colors.grey,
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          children: [
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(s_image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              s_text,
              style: const TextStyle(
                fontSize: 15.0,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int _indexbottomnavigation = 0;
    const screens_navigation = [
      MyHome(),
      Camera(),
      Profile(),
      Maps(),
    ];
    return Container(
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.deepPurpleAccent,
                width: 0.5,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4.0,
                  offset: Offset(2, 2),
                ),
              ],
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(
                      color: Colors.grey,
                      width: 0.8,
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 4.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Smart Garbage",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.grey,
                        onTap: () {},
                        child: Badge(
                          badgeContent: const Text(
                            '3',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          animationType: BadgeAnimationType.slide,
                          animationDuration: const Duration(milliseconds: 3000),
                          child: const Icon(Icons.notifications_none),
                          badgeColor: const Color.fromRGBO(143, 148, 251, 1.0),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Center(
                  child: Text(
                    "Alert",
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w900,
                        color: Colors.red),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Garbage Alert",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Rangpura, Sialkot",
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
          Container(
            height: 400,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 8,
              childAspectRatio: 1.50,
              children: [
                _services(
                  s_image: "assets/images/map.png",
                  s_text: "Location",
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Location Coordinates',
                                textAlign: TextAlign.center,
                              ),
                              content: const Text(
                                'Go To This Location & Clean The Garbage',
                                textAlign: TextAlign.center,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('OK'),
                                )
                              ],
                            ));
                  },
                ),
                _services(
                    s_image: "assets/images/news.png",
                    s_text: "Mark Status",
                    onTap: () {
                      StatusAlert.show(
                        context,
                        duration: const Duration(seconds: 2),
                        title: 'DONE',
                        subtitle: 'Your Status has Been Marked As Completed !!',
                        configuration:
                            const IconConfiguration(icon: Icons.done),
                      );
                    }),
                _services(
                    s_image: "assets/images/awards.png",
                    s_text: "Employee of Month",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmployeeMonth()));
                    }),
                _services(
                    s_image: "assets/images/trophy.png",
                    s_text: "Employee of Year",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EmployeeYear()));
                    }),
                _services(
                    s_image: "assets/images/contact.png",
                    s_text: "Contact Us",
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    }),
                _services(
                    s_image: "assets/images/complain.png",
                    s_text: "About Us",
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
