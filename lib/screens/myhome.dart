import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smartgarbage/screens/about.dart';
import 'package:smartgarbage/screens/blog.dart';
import 'package:smartgarbage/screens/camera.dart';
import 'package:smartgarbage/screens/changePassword.dart';
import 'package:smartgarbage/screens/contact.dart';
import 'package:smartgarbage/screens/employee_month.dart';
import 'package:smartgarbage/screens/employee_year.dart';
import 'package:smartgarbage/screens/map.dart';
import 'package:smartgarbage/screens/profile.dart';
import 'package:badges/badges.dart';
import 'package:smartgarbage/screens/taskEmployee.dart';
import 'package:smartgarbage/screens/complaint.dart';
import 'package:status_alert/status_alert.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var _location; // List

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

  Future getTasks() async {
    var cacheManager = await APICacheManager().getCacheData("username");
    var url = Uri.parse(
        'https://smart-garbage-api.herokuapp.com/api/tasks/${cacheManager.syncData}');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        for (var i = 0; i < data.length; i++) {
          if (data[i]['status'] != "Completed") {
            _location = data[0]['task_data'];
          }
        }
      });
      return data;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTasks();
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
              // border: Border.all(
              //   color: Colors.deepPurpleAccent,
              //   width: 0.5,
              // ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    // border: Border.all(
                    //   color: Colors.grey,
                    //   width: 0.8,
                    // ),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     blurRadius: 4.0,
                    //     offset: Offset(2, 2),
                    //   ),
                    // ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Smart Garbage".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                          // color: Colors.deepPurple,
                        ),
                      ),
                      InkWell(
                          splashColor: Colors.grey,
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const TaskEmployee(),
                              ),
                            );
                          },
                          child: FutureBuilder(
                              builder: (context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData && snapshot.data != null) {
                              // print(snapshot.data.length);
                              return Badge(
                                badgeContent: Text(
                                  "${snapshot.data.length}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                animationType: BadgeAnimationType.slide,
                                animationDuration:
                                    const Duration(milliseconds: 3000),
                                child: const Icon(Icons.notifications_none),
                                badgeColor:
                                    const Color.fromRGBO(143, 148, 251, 1.0),
                              );
                            } else {
                              return Badge(
                                badgeContent: const Text(
                                  '',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                animationType: BadgeAnimationType.slide,
                                animationDuration:
                                    const Duration(milliseconds: 3000),
                                child: const Icon(
                                  Icons.notifications_none,
                                  size: 30,
                                  color: Color.fromARGB(255, 248, 176, 42),
                                ),
                                badgeColor:
                                    const Color.fromRGBO(143, 148, 251, 1.0),
                              );
                            }
                          })),
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
            height: 500,
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
                          'Location',
                          textAlign: TextAlign.center,
                        ),
                        content: _location != null
                            ? Text(
                                '${_location}',
                                textAlign: TextAlign.center,
                              )
                            : const Text("No Task Available"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('OK'),
                          )
                        ],
                      ),
                    );
                  },
                ),
                _services(
                    s_image: "assets/images/news.png",
                    s_text: "Complaint",
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const Comlaint()));
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
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ContactUs()));
                    }),
                _services(
                    s_image: "assets/images/complain.png",
                    s_text: "About Us",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AboutUs()));
                    }),
                _services(
                    s_image: "assets/images/blogging.png",
                    s_text: "Blogs",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Blog()));
                    }),
                _services(
                    s_image: "assets/images/password.png",
                    s_text: "Change Password",
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChangePassword()));
                    }),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          const Center(
            child: Text(
              "Neat & Clean Pakistan",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                color: Colors.green,
              ),
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
                  "Developed By Hammad",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
